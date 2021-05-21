import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intern/screens/news.dart';
import 'package:intern/screens/signIn.dart';
import 'package:intern/widgets/Divider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  navigatetoSignIn() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/bg.jpg",
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 100, 0, 50),
            child: Text(
              "Welcome!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 450.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xff000080),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown[200],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown[250]),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Email: ",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown[200],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown[250]),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Password:",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown[200],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown[250]),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Re-enter Password:",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                            child: Container(
                              height: 50.0,
                              width: 100.0,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onSurface: Colors.white,
                              shadowColor: Colors.yellow,
                              elevation: 20.0,
                              animationDuration: Duration(milliseconds: 200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () {
                              navigatetoSignIn();
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height - 100,
                            right: 0,
                            left: 0,
                            child: Column(
                              children: [
                                Text(
                                  "Or Sign Up With",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(125, 0, 0, 0),
                                          child: Image.asset(
                                            "assets/google.png",
                                            height: 50,
                                            width: 50,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Image.asset(
                                      "assets/fb.png",
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Have an account?"),
                                      TextButton(
                                        onPressed: () {
                                          navigatetoSignIn();
                                        },
                                        child: Text("Sign In"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
