import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class userSearch extends StatefulWidget {
  const userSearch({super.key});

  @override
  State<userSearch> createState() => _userSearchState();
}

class _userSearchState extends State<userSearch> {

  TextEditingController searchUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: TextFormField(
            style: TextStyle(color: Color.fromRGBO(216, 249, 217, 1.0)),
                  controller: searchUser,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined,color: Colors.white,size:30 ,),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(icon: Icon(Icons.cancel_outlined,color: Colors.white,size:20 ,),onPressed: (){setState(() {
                        searchUser.clear();
                      });},),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
            ),
            ),
          decoration: BoxDecoration(
              border: Border.all(width: 2,color: Color.fromRGBO(240, 240, 240, 1.0)),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
        ),
      ),
      body: Center(
        child: Text("Search Your Favourite One's",style: GoogleFonts.habibi(color: Color.fromRGBO(216, 249, 217, 1.0),fontWeight: FontWeight.bold,fontSize: 15),),
      ),
    );
  }
}
