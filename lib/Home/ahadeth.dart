import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Home.widgets/HadethTitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';

  List<Hadeth> allAhadeth = [];

class ahadeth extends StatefulWidget {


  @override
  State<ahadeth> createState() => _ahadethState();
}

class _ahadethState extends State<ahadeth> {
  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty)readHadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset('assets/images/hadethLogo.png')
        ),
        SizedBox(height: 5,),
        Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: MyThemeData.primaryColor,
                )
            ),
            child: Text(AppLocalizations.of(context)!.hadeth, textAlign: TextAlign.center, style:
            TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: MyThemeData.accentColor,
            ),)),
        Expanded(
            flex: 7,
            child: ListView.separated(
              reverse: false,
                itemBuilder: (context, index){
                  return HadethTitle(allAhadeth[index]);
                },
                itemCount: allAhadeth.length,
                separatorBuilder: (context,index){
                  return Container(
                    color: MyThemeData.primaryColor,
                    width: 2,
                    height: 2,
                  );
                })
        )],
    );
  }
}
  void readHadethFile() async {
    String allAhadethContent = await rootBundle.loadString('assets/content/ahadeth.txt');
    List<String> AllAhadeth = allAhadethContent.split('#\r\n');
    for(int i = 0;i <= AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      List<String> singleHadethLines = hadeth.split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      allAhadeth.add(Hadeth(title, singleHadethLines));
    }
  }

class Hadeth{
  String title;
  List<String> hadethContent;
  Hadeth(this.title, this.hadethContent);
}