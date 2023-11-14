// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loging extends StatefulWidget {
  loging({super.key});

  @override
  State<loging> createState() => _logingState();
}

class _logingState extends State<loging> {
  final _username = TextEditingController();

  final _password = TextEditingController();
  bool _isdataMatch = true;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/insta png.png'),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "username"),
                validator: (value) {
                  // if (_isdataMatch) {
                  //   return null;
                  // } else {
                  //   return 'error';
                  // }
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  // if (_isdataMatch) {
                  //   return null;
                  // } else {
                  //   return 'error';
                  // }
                  if (value == null || value.isEmpty) {
                    return "value is empty";
                  } else {
                    return null;
                  }
                },
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "password"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: !_isdataMatch,
                      child: Text(
                        'User name password desnot match',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checklog(context);
                        } else {
                          
                        }
                        // checklog(context);
                      },
                      icon: Icon(Icons.check),
                      label: Text("login")),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void checklog(BuildContext context) async {
    final _usernamecon = _username.text;
    final passwordcon = _password.text;
    if (_usernamecon == 'hashim' && passwordcon == '1234') {
      //gp to home

      final SharedPrifs = await SharedPreferences.getInstance();
      await SharedPrifs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar( 
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            duration: Duration(seconds: 1),
            content: Text('user name password desenot match')));
    }
  }
}
