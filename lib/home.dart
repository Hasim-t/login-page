// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('sign out'),
                        content: Text("you want sign out"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                singout(context);
                              },
                              child: Text('yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (ctx, index) {
          if (index % 2 == 0) {
            return ListTile(
              title: Text('girl'),
              subtitle: Text('Message'),
              leading: ClipRRect(
                child: Image.asset(
                  'asset/girl.jpg',
                ),
              ),
              trailing: Text('12:0$index'),
            );
          } else {
            return ListTile(
              title: Text('Boy'),
              subtitle: Text('Message'),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('asset/boy.jpg'),
              ),
              trailing: Text('12:0$index'),
            );
          }
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: 10,
      )),
    );
  }

  singout(BuildContext context) async {
    final sharedPrifs = await SharedPreferences.getInstance();
    sharedPrifs.clear();


    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => loging()), (route) => false);
  }
}
