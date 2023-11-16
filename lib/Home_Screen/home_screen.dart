import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jinx/All_Screens/addPost.dart';
import 'package:jinx/All_Screens/feed.dart';
import 'package:jinx/All_Screens/notification.dart';
import 'package:jinx/All_Screens/userProfile.dart';
import 'package:jinx/All_Screens/userSearch.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  int _page = 0;
  late PageController pagecontroller;

  void initState() {
    super.initState();
    pagecontroller = PageController();
  }
  void navigationTapped(int page) {
    pagecontroller.jumpToPage(page);
  }
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: PageView(
        children: [
              feed(),
              userSearch(),
              addPost(),
              notification(),
              userProfile()
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: pagecontroller,
        onPageChanged: onPageChanged,
      ),
        bottomNavigationBar: CupertinoTabBar(
            height: height*0.1,
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            activeColor: Colors.red,

            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: _page == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                    size: _page == 0 ? 35:30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                    color: _page == 1
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                    size: _page == 1 ? 35:30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: _page == 2
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                    size: _page == 2 ? 35:30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outline,
                    color: _page == 3
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                    size: _page == 3 ? 35:30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.circle_outlined,
                    color: _page == 4
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                    size: _page == 4 ? 35:30,
                  ),
                  backgroundColor: Colors.red),
            ],
            onTap: navigationTapped,
          ),
    );

  }
}
