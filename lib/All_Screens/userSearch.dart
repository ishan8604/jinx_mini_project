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
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: TextFormField(
                  controller: searchUser,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined,color: Theme.of(context).colorScheme.onPrimary,size:30 ,),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      suffixIcon: IconButton(icon: Icon(Icons.cancel_outlined,color: Theme.of(context).colorScheme.onPrimary,size:20 ,),onPressed: (){setState(() {
                        searchUser.clear();
                      });},),
                      filled: true,
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
        child: Text("Search Your Favourite One's",style: GoogleFonts.habibi(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15),),
      ),
    );
  }
}
