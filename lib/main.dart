import 'package:flutter/material.dart';
import 'package:islami/Home/HomeScreen.dart';
import 'package:islami/SplashScreen.dart';
import 'package:islami/SuraDetails/SuraDetails.dart';
import 'package:islami/hadethDetails/HadethDetails.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());

}

class MyThemeData{
  static Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static Color accentColor = Color.fromARGB(255, 36, 36, 36);
  static Color primaryColorDark = Color(0xff141A2E);
  static Color accentColorDark = Color(0xffFACC1D);
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale('en'),
      theme: ThemeData(
        primaryColor: MyThemeData.primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MyThemeData.accentColor)
      ),
      darkTheme: ThemeData(
        primaryColor: MyThemeData.primaryColorDark,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MyThemeData.accentColorDark)
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        SplashScreen.ROUTE_NAME: (context)=> SplashScreen(),
        HomeScreen.ROUTE_NAME: (context)=> HomeScreen(),
        SuraDetails.Route_Name: (context)=> SuraDetails(),
        HadethDetails.ROUTE_NAME: (context)=> HadethDetails(),
      },
      initialRoute: SplashScreen.ROUTE_NAME,
    );
  }
}