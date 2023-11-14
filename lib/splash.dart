import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    checkuserLoggedIn();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "asset/instagram.jpeg",
        fit: BoxFit.fill,
      )),
    );
  }


  Future<void> gotologinpage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return loging();
    }));
  }

  Future<void> checkuserLoggedIn() async {
    final sherwdprf = await SharedPreferences.getInstance();
    // sherwdprf.setBool(SAVE_KEY_NAME, true);
    final _userloggedIn = sherwdprf.getBool(SAVE_KEY_NAME);
    if (_userloggedIn == null || _userloggedIn == false) {
      gotologinpage();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return ScreenHome();
      }));
    }
  }
}
