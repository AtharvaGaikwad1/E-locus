import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/Signup.dart';
import '../providers/http_exception.dart';

class LogiPage extends StatefulWidget {
  @override
  State<LogiPage> createState() => _LogiPageState();
}

class _LogiPageState extends State<LogiPage> {
  void _showErrorDailog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("An error occured oops"),
              content: Text(message),
            ));
  }

  Map<String, String> _authdata = {
    'email': '',
    'password': "",
  };

  void GotoSignup(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return SignP();
    }));
  }

  final _mycontrolleremail = TextEditingController();

  final _mycontrollerpass = TextEditingController();

  late var _val = false;
  late var _pass_val = false;

  late String phone;
  late bool phonevalid;

  @override
  void dispose() {
    _mycontrolleremail.dispose();
    _mycontrollerpass.dispose();
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
                            'Login',
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
                            controller: _mycontrolleremail,
                            decoration: InputDecoration(
                                errorText: _val
                                    ? ' Please enter a valid email '
                                    : null,
                                border: InputBorder.none,
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
                            obscureText: true,
                            decoration: InputDecoration(
                                errorText:
                                    _pass_val ? 'Set a secure password' : null,
                                border: InputBorder.none,
                                hintText: "password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            controller: _mycontrollerpass,
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
                          // } on Exception catch (error) {

                          Future<void> fuc() async {
                            final Data _data =
                                await Provider.of<Auth>(context, listen: false)
                                    .SigIn(_mycontrolleremail.text,
                                        _mycontrollerpass.text);
                            var errmsg = _data.msg;
                            if (errmsg.contains("User not found")) {
                              _showErrorDailog(errmsg);
                            }
                          }

                          if (_mycontrolleremail.text.isEmpty) {
                            _val = true;
                            print('this is empty but not visbible');
                          } else {
                            _val = false;
                          }
                          if (_mycontrollerpass.text.isEmpty ||
                              (_mycontrollerpass.text.length) < 6) {
                            _pass_val = true;
                          } else {
                            _pass_val = false;
                          }
                          fuc();
                        }),
                        _authdata['email'] = _mycontrolleremail.text,
                        _authdata['password'] = _mycontrollerpass.text,
                        await Provider.of<Auth>(context, listen: false).SigIn(
                            _mycontrolleremail.text, _mycontrollerpass.text)
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
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _showErrorDailog("message"),
                          child: Text(
                            "forgot Password ?",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => GotoSignup(context),
                          child: Text(
                            "New User ? signup",
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
