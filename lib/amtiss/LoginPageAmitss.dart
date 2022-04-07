import 'package:flutter/material.dart';

class LoginPageAmtiss extends StatelessWidget {
  bool checkedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, top: 111, right: 30),
              child: Image(
                  image: AssetImage(
                'assets/amtiss_logo.png',
              )),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 47),
              child: Text(
                "Please login to continue",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(51, 51, 51, 1),
                ),
              ),
            ),
            SizedBox(height: 42),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.topLeft,
                      child: Text("Company"),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 6),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: Colors.grey.shade100),
                        )),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.topLeft,
                      child: Text("Username"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 6),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey.shade100),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.topLeft,
                      child: Text("Password"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 6),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey.shade100),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register_v2');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
