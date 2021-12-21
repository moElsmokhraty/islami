import 'package:flutter/material.dart';
import 'package:islami/Home/ahadeth.dart';
import 'package:islami/SuraDetails/SuraDetails.dart';
import 'package:islami/hadethDetails/HadethDetails.dart';

class HadethTitle extends StatelessWidget {

  Hadeth hadeth;

  HadethTitle(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.ROUTE_NAME,
        arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(hadeth.title ,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}