import 'package:flutter/material.dart';
import 'package:islami/Home/ahadeth.dart';
import 'package:islami/Home/quran.dart';
import 'package:islami/Home/radio.dart';
import 'package:islami/Home/tasbeh.dart';
import 'package:islami/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {

  static String ROUTE_NAME = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.islami, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: MyThemeData.accentColor,
          )),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: MyThemeData.primaryColor),
          child: BottomNavigationBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            currentIndex: selectedIndex,
            selectedItemColor: MyThemeData.accentColor,
            showUnselectedLabels: false,
            iconSize: 35,
            items: [
              BottomNavigationBarItem(
                  label: 'quran',
                  icon: ImageIcon(AssetImage('assets/images/moshaf_blue.png'))),
              BottomNavigationBarItem(
                  label: 'ahadeth',
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png'))),
              BottomNavigationBarItem(
                  label: 'tasbeh',
                  icon: ImageIcon(AssetImage('assets/images/sebha.png'))),
              BottomNavigationBarItem(
                  label: 'radio',
                  icon: ImageIcon(AssetImage('assets/images/radio.png')))
            ],
          ),
        ),
        body: getMain(),
      ),
    );
  }
  Widget getMain(){
    if (selectedIndex == 0){
      return quran();
    }else if (selectedIndex == 1){
      return ahadeth();
    }else if (selectedIndex == 2){
      return tasbeh();
    }else{
      return radio();
    }
}
}
