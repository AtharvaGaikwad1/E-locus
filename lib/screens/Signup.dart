// ignore: file_names
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';

class SignP extends StatefulWidget {
  @override
  State<SignP> createState() => _SignPState();
}

class _SignPState extends State<SignP> {
  final myController = TextEditingController();

  final emailcontro = TextEditingController();

  final passcontro = TextEditingController();

  final confpasscontro = TextEditingController();

  Map<String, String> _authdata = {
    'email': '',
    'password': "",
  };

  late String phoneno;
  late String isemail;

  bool isemailtr = false;

  void GotoLogin(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return OtpScreen(myController.text);
    }));
  }

  late var _invalidno = false;

  late var _invalidemail = false;

  late var _passwordsmatch = false;
  late var _passwordssec = false;

  @override
  void dispose() {
    // TODO: implement dispose

    myController.dispose();
    emailcontro.dispose();
    passcontro.dispose();
    confpasscontro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bag.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/baloon.png'))),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 165,
                      child: Container(
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.blueGrey,
                          ))),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                                errorText: null,
                                border: InputBorder.none,
                                hintText: "Phone number",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 200, 1),
                              blurRadius: 20,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.blueGrey,
                          ))),
                          child: TextField(
                            controller: emailcontro,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText:
                                    isemailtr ? null : 'enter a valid email',
                                hintText: "Email id",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.blueGrey,
                          ))),
                          child: TextField(
                            controller: passcontro,
                            obscureText: true,
                            decoration: InputDecoration(
                                errorText: _passwordssec
                                    ? 'Enter a secure password'
                                    : null,
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.blueGrey,
                          ))),
                          child: TextField(
                            obscureText: true,
                            controller: confpasscontro,
                            decoration: InputDecoration(
                                errorText: _passwordsmatch
                                    ? 'passwords dont match'
                                    : null,
                                border: InputBorder.none,
                                hintText: " Confirm password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () async => {
                        setState(() {
                          if (confpasscontro.text == passcontro.text) {
                            _passwordsmatch = false;
                          } else {
                            _passwordsmatch = true;
                          }
                          if (passcontro.text.length < 6) {
                            _passwordssec = true;
                          }
                          isemail = emailcontro.text;
                          phoneno = myController.text;
                          // isphonetr = phoneno.isPhone();
                          isemailtr = isemail.isEmail();
                        }),
                        _authdata['email'] = emailcontro.text,
                        _authdata['password'] = passcontro.text,
                        await Provider.of<Auth>(context, listen: false)
                            .signUp(emailcontro.text, passcontro.text),
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 2),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Submit ',
                            style: TextStyle(
                                fontFamily: 'ReadexPro-Light',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: Text(
                            "forgot Password ?",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => GotoLogin(context),
                          child: Text(
                            "Already a  user ? Signin",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
