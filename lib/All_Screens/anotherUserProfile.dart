import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class anotherUserProfile extends StatefulWidget {
  const anotherUserProfile({super.key});

  @override
  State<anotherUserProfile> createState() => _anotherUserProfileState();
}

class _anotherUserProfileState extends State<anotherUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text("Xyz",style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold,color: Color.fromRGBO(216, 249, 217, 1.0)),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_sharp,color: Color.fromRGBO(216, 249, 217, 1.0),))
        ],
      ),
      body: Container(
        color: Color.fromRGBO(23, 22, 22, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: CircleAvatar(radius: 50,)
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("_Xyz__",style: GoogleFonts.tajawal(fontWeight: FontWeight.w900,fontSize: 20,color: Theme.of(context).colorScheme.tertiary),),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text("2",style:GoogleFonts.oswald(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.onPrimary),),
                            Text("Posts",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("5",style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Followers",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("52",style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Following",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Text("Always there to help",style:GoogleFonts.heebo(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15)),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Container(
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              child: Text("Follow",style: TextStyle(color: Theme.of(context).colorScheme.background),)
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              child: Text("Message",style: TextStyle(color: Theme.of(context).colorScheme.background),)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    Divider(thickness: 2,color: Theme.of(context).colorScheme.onPrimary,),
                  ],
                ),
              ),
              Container(
                height: 360,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:GridView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
                        GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){print("Imag Tapped");},
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network("https://www.hollywoodreporter.com/wp-content/uploads/2012/12/img_logo_blue.jpg?w=681&h=383&crop=1",fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
