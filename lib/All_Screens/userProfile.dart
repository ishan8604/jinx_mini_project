import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text("Bhagyodaya Varshney",style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_sharp))
        ],
      ),
      body: Container(
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
                      Text("_bhagyodaya__varshney",style: GoogleFonts.tajawal(fontWeight: FontWeight.w900,fontSize: 20,color: Theme.of(context).colorScheme.tertiary),),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Text("75",style:GoogleFonts.oswald(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.onPrimary),),
                              Text("Posts",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("245",style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("Followers",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("360",style:GoogleFonts.oswald(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("Following",style:GoogleFonts.cormorantGaramond(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                      Spacer(),
                      Text("Always there to Help",style:GoogleFonts.heebo(color: Theme.of(context).colorScheme.tertiary,fontWeight: FontWeight.bold,fontSize: 15)),
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
                                child: Text("Edit Profile",style: TextStyle(color: Theme.of(context).colorScheme.background),)
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
                                child: Text("Share Profile",style: TextStyle(color: Theme.of(context).colorScheme.background),)
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
                height: 282,
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
