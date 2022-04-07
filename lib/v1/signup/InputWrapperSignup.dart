import 'package:flutter/material.dart';

import 'ButtonSignup.dart';
import 'InputFieldSignup.dart';


class InputWrapperSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10
              ),
            ),
            child: InputFieldSignup(),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Sign In",
            style: TextStyle(
                color: Colors.grey
            ),),
          SizedBox(height: 10,),
          ButtonSignup()
        ],
      ),);
  }

}