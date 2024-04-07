
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix__clone/screen/account.dart';
import 'package:netflix__clone/screen/home.dart';
import 'package:netflix__clone/screen/news&hot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  List<Widget> wedgetts = [Home(),NewsHot(),MyNetflix()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: wedgetts.elementAt(selectIndex),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          const BottomNavigationBarItem(
              label: 'News&Hot', icon: Icon(Icons.newspaper_rounded)),
          const BottomNavigationBarItem(
             
            label: 'My Netflix' , icon: Icon(Icons.person_outline_rounded))
        ],
        currentIndex: selectIndex,
        onTap: ontappforbottomNavigation,
        iconSize: 22,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedIconTheme: IconThemeData(
          color: Colors.white
        ),
        enableFeedback: false,
        fixedColor: Colors.white,
        
       type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
      

      ),
    );
  }

  ontappforbottomNavigation(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}