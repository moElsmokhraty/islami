import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'dart:math';


class tasbeh extends StatefulWidget {

  @override
  State<tasbeh> createState() => _tasbehState();
}

class _tasbehState extends State<tasbeh> {
  int counter = 0;

  String tasbeha = 'سبحان الله';

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              InkWell(
                onTap: onTasbehaClicked,
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
                  child: Transform.rotate(
                    angle: pi/180*angle,
                      child: Image.asset('assets/images/bodySebha.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.05),
                child: Image.asset('assets/images/headSebha.png'),
              )
            ],
          ),
          SizedBox(height: 10,),
          Expanded(child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('Tasbeh Count',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xffB7935F),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Text('$counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Text('$tasbeha',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
              ),
            ],
          ))
        ],
      ),
    );
  }
  void onTasbehaClicked(){
    setState(() {
      counter++;
      angle += 30;
    if (counter == 33){
      tasbeha = 'الحمد لله';
    }else if(counter == 66) {
      tasbeha = 'لا اله الا الله';
    }else if(counter > 99) {
      counter = 0;
      tasbeha = 'سبحان الله';
    }
    });
  }
}