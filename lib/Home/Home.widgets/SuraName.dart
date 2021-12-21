import 'package:flutter/material.dart';
import 'package:islami/SuraDetails/SuraDetails.dart';

class SuraName extends StatelessWidget {

  String Sura;
  int index;
  SuraName(this.Sura, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.Route_Name,
        arguments: SuraDetailsArgs(Sura, index+1));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(Sura, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}

class SuraDetailsArgs{
  String Sura;
  int index;
  SuraDetailsArgs(this.Sura, this.index);
}
