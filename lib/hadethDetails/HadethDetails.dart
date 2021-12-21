import 'package:flutter/material.dart';
import 'package:islami/Home/Home.widgets/HadethTitle.dart';
import 'package:islami/Home/ahadeth.dart';

import '../main.dart';

class HadethDetails extends StatefulWidget {

  static String ROUTE_NAME = 'HadethDetails';


  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
              title: Text(args.title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: MyThemeData.accentColor,
              )),
            ),
            body: Container(
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
                  child: Text(args.hadethContent[index],
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
                itemCount: args.hadethContent.length,
              ),
            )));
  }
}
