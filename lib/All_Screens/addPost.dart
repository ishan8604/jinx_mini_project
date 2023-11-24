import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../firestore_methods.dart';


class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {

  Uint8List ?_file;
  bool _isLoading = false;
  bool choicechip = false;

  int finaltime=0;

  String username="";
  String uid="";

  late TimeOfDay time;
  _selectedTime()async{
    TimeOfDay? picker = await showTimePicker(context: context, initialTime: time);
    if(picker != null){
      int hour = (DateTime.now().hour-time.hour).abs()*3600;
      int min = (DateTime.now().minute-time.minute).abs()*60;
      setState(() {
        time = picker;
        finaltime = hour+min;
      });

    }
  }
  void getalldetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('UsersDetails').doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username = (snap.data() as Map<String,dynamic>)['username'];
      uid = (snap.data() as Map<String,dynamic>)['uid'];
    });
  }
  void _postImage(
      String uid,
      String username,
      ) async {
    setState(() {
      _isLoading = true;
    });
    if(choicechip==false){
      try{
        String res = await FirestoreMethods().uploadPost(
            controllerCaption.text,
            uid,
            username,
            controllerlocation.text,
            _file!);
        if(res=="Success"){
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Posted!")
              )
          );
          clearImg();
        }
        else{
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(res)
              )
          );
        }
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(e.toString())
            )
        );
      }
    }
    else{
      try{
        Timer(Duration(seconds: finaltime), () async{
          String res = await FirestoreMethods().uploadPost(
              controllerCaption.text,
              uid,
              username,
              controllerlocation.text,
              _file!);
          if(res=="Success"){
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Posted!")
                )
            );
            clearImg();
          }
          else{
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(res)
                )
            );
          }
        });

      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(e.toString())
            )
        );
      }
    }
  }


  TextEditingController controllerCaption = TextEditingController();
  TextEditingController controllerlocation = TextEditingController();
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            title: Text(
              "Select an Image",
              style: GoogleFonts.signikaNegative(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            children: [
              Divider(
                thickness: 2,
                color: Colors.white,
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Take a Photo",
                        style: GoogleFonts.notoSans(color: Colors.white)),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(source: ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.smartphone_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Choose a Photo",
                        style: GoogleFonts.notoSans(color: Colors.white)),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(source: ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Cancel",
                        style: GoogleFonts.notoSans(color: Colors.white)),
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),

            ],
          );
        });
  }

  void clearImg(){
    setState(() {
      _file = null;
    });
  }
  @override
  void initState() {
    time = TimeOfDay.now();
    // TODO: implement initState
    super.initState();
    getalldetails();
  }
  @override
  Widget build(BuildContext context) {
    return _file == null?
      Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add New Post",style: GoogleFonts.signikaNegative(
            color: Color.fromRGBO(216, 249, 217, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 20),),
        actions: [
          TextButton(onPressed: (){}, child: Text("Share",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17),))
        ],
      ),
      body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Colors.white12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          color: Colors.white30,
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(200)),
                                color: Colors.white38,
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(200)),
                                      color: Colors.white54,
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(200)),
                                            color: Colors.white60,
                                          ),
                                          child:Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(200)),
                                                  color: Colors.white70,
                                                ),
                                                child:Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(200)),
                                                        color: Colors.white,
                                                      ),
                                                      child:IconButton(icon: Icon(Icons.upload_outlined,color: Theme.of(context).colorScheme.background,size: 50,),onPressed: (){_selectImage(context);},)
                                                  ),
                                                ),
                                            ),
                                          ),
                                      ),
                                    ),
                                ),
                              ),
                          ),
                        ),
                  ),
                ),),
                SizedBox(height: 60,),
                Text("Tap on Icon to Select an Image",style: GoogleFonts.crimsonText(fontSize: 20,color: Theme.of(context).colorScheme.tertiary,),)
              ],
            ),
          ),
        ),
    ):
    Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: clearImg,
        ),
        title: Text("Add New Post",style: GoogleFonts.signikaNegative(
        color: Color.fromRGBO(216, 249, 217, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 20),),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: (){
                if(choicechip==false)   _postImage(uid, username);
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                          content: Text("Your Post is Scheduled For"+time.hour.toString()+time.minute.toString())
                      )
                  );
                  _postImage(uid, username);
                }
              },
              child: Text(
                "Share",
                style: GoogleFonts.signikaNegative(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _isLoading? LinearProgressIndicator(color: Colors.white,): const Padding(padding: EdgeInsets.only(top: 0)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width*0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      )),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width*0.60,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.w600),
                    controller: controllerCaption,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Write a Caption',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            //   child: Divider(thickness: 1.5,color: Colors.grey,),
            // ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: TextFormField(
                controller: controllerlocation,
                style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined,color: Theme.of(context).colorScheme.onPrimary,size:30 ,),
                  hintText: 'Add Location',
                  hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.90,
              height: 60,
              child: Center(child: Row(
                children: [
                  Text("Schedule Post",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
                  Spacer(),
                  ChoiceChip(
                    label: choicechip == false?Text("OFF",style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold),):Text("ON",style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold),),
                    selected: choicechip,
                    selectedColor: Color.fromRGBO(22, 128, 57, 1.0),
                    onSelected: (newState){
                      setState(() {
                        choicechip = newState;
                      });
                      //choosedTime();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              title: Text(
                                "Select Time For Post",
                                style: GoogleFonts.signikaNegative(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Divider(
                                  thickness: 2,
                                  color: Colors.white,
                                ),
                                Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: (){
                                              setState(() {
                                                _selectedTime();
                                              });
                                            },
                                            child: Text("Choose Time")
                                        ),
                                        //Text("${time.hour}:${time.minute}",style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),SimpleDialogOption(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Cancel",
                                          style: GoogleFonts.notoSans(color: Colors.white)),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            );
                          });
                    },
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Divider(thickness: 1.5,color: Colors.grey,),
            ),
            Row(
              children: [
                Text("Choosed Time:",style: GoogleFonts.notoSans(color: Colors.white,fontSize: 15)),
                SizedBox(width: 20,),
                Text(time.hour.toString()+":"+time.minute.toString(),style: GoogleFonts.notoSans(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }

  pickImage({required ImageSource source}) async{
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file1 = await _imagePicker.pickImage(source: source);

    if(_file1 != null) return await _file1.readAsBytes();
    print("No Image Selected");
  }
}
