import 'package:flutter/material.dart';
import 'package:flutteruilogin/amtiss/ProgressHUD.dart';
import 'package:flutteruilogin/amtiss/apiservice/api_service.dart';
import 'package:flutteruilogin/amtiss/models/login_model.dart';

class LoginAmtiss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginAmtissState();
  }
}

class LoginAmtissState extends State {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formStateKey = GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3);
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ]),
                  child: Form(
                    key: formStateKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          //onsaved
                          onSaved: (input) => requestModel.email = input,
                          validator: (input) => !input.contains("@")
                              ? "Email Id should be Valid"
                              : null,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          obscureText: hidePassword,
                          keyboardType: TextInputType.text,
                          //onsaved
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) => input.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color:
                                  Theme.of(context).accentColor.withOpacity(.4),
                              icon: hidePassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                this.isApiCallProcess = true;
                              });
                              ApiService().login(requestModel).then((value) {
                                setState(() {
                                  this.isApiCallProcess = false;
                                });
                                if (value.token.isNotEmpty) {
                                  final snackBar = SnackBar(
                                      content: Text("Login Successful"));
                                  scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                } else {
                                  final snackBar =
                                      SnackBar(content: Text(value.error));
                                  scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                }
                              });
                              print(requestModel.toJson());
                            }
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formStateKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
