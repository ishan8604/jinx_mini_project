import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jinx/firestore_methods.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {

  TextEditingController bioController = TextEditingController();
  Uint8List ?_file;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 22, 22, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: (){
              String res = FirestoreMethods().updateBio(bioController.text,_file!).toString();
              if(res=="Success"){
                setState(() {
                  _file=null;
                });
                bioController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      width: MediaQuery.of(context).size.width,
                      content:
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 3,),
                              Icon(Icons.handshake_outlined),
                              SizedBox(width: 5,),
                              Text("Updated Successfully",style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),textAlign: TextAlign.center,)
                            ],),
                        ),
                      ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.transparent,elevation: 0,));
              }
              else{ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    width: MediaQuery.of(context).size.width,
                    content:
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 3,),
                            Icon(Icons.warning_rounded),
                            SizedBox(width: 5,),
                            Text("Successfully",style: GoogleFonts.signikaNegative(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),textAlign: TextAlign.center,)
                          ],),
                      ),
                    ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.transparent,elevation: 0,));}
              Navigator.of(context).pop();
              },
            child: Text("Save",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Stack(
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                          color: Colors.black45
                      ),
                      child: _file==null?ClipRRect(child: Image.network("https://tse1.mm.bing.net/th?id=OIP.VwDAQZfumkNyo17xbrePTgHaHa&pid=Api&P=0&h=180",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(75)),):CircleAvatar(backgroundImage: MemoryImage(_file!),radius: 30,),
                  ),
                  Positioned(
                      left: 100,
                      top: 100,
                      child: IconButton(
                          onPressed: ()=>_selectImage(context),
                          icon: Icon(Icons.add_circle,color: Colors.white,size: 40,)
                      )
                  ),
                ],
              ),
              Spacer(),
              Text("Update Your Bio",style: TextStyle(color: Colors.white),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child:Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.w600),
                    controller: bioController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Write a Bio',
                      hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent
                    ),
                  ),
                )
              ),
              Spacer(),
            ],
          ),
        ),
      )
    );
  }
  pickImage({required ImageSource source}) async{
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file1 = await _imagePicker.pickImage(source: source);

    if(_file1 != null) return await _file1.readAsBytes();
    print("No Image Selected");
  }
}
