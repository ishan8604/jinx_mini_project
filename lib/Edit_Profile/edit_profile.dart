import 'package:flutter/material.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {

  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 22, 22, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [TextButton(onPressed: (){}, child: Text("Save",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))],
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
                      child: ClipRRect(child: Image.network("https://tse1.mm.bing.net/th?id=OIP.VwDAQZfumkNyo17xbrePTgHaHa&pid=Api&P=0&h=180",fit: BoxFit.cover,),borderRadius: BorderRadius.all(Radius.circular(75)),)
                  ),
                  Positioned(
                      left: 100,
                      top: 100,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.white,size: 40,))
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
                      hintText: '  Write a Bio',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w300),
                      border: InputBorder.none,
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
}
