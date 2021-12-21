import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Home.widgets/SuraName.dart';

import '../main.dart';

class SuraDetails extends StatefulWidget {
  static String Route_Name = 'Sura Details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List <String> SuraLines = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =  ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (SuraLines.isEmpty){
      readSuraFile('assets/content/'+args.index.toString()+'.txt');

    }
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
                  iconTheme: IconThemeData(
                    color: MyThemeData.accentColor
                  ),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(args.Sura, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MyThemeData.accentColor,
                  )),
                ),
                body: getMainView()));
  }

  void readSuraFile(String SuraFile) async{
    String SuraContent = await rootBundle.loadString(SuraFile);
    SuraLines = SuraContent.split('\n');
    setState(() {

    });
  }

  Widget getMainView(){
    if (SuraLines.isEmpty){
      return Center(
          child: CircularProgressIndicator()
      );
    }else{
      return Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height*.05
        ),
        decoration: BoxDecoration(
          color:  Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.circular(25)
        ),
        child: ListView.separated(itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.all(10),
            child: Text(SuraLines[index],
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          );
        },
          separatorBuilder: (context,index){
            return Container(
              color: MyThemeData.primaryColor,
              width: 2,
              height: 2,
            );
          },
          itemCount: SuraLines.length,
        ),
      );
    }
  }
}