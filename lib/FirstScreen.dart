import 'package:flutter/material.dart';

import 'SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(title: Text('First Page')),
        body: Center(
          child: Container(
              width: 150,
          height: 50,
          color: Colors.white,
          child: Center(
            child: GestureDetector(
              onTap: () {
                // print('tapped');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(
                  newAppBarName: "Notice",
                   
                  ),
                  ),
                  );
              },
              child: Text('Go to Second Page'))),
          ),
        ),
       
       
      

    );
  }
}