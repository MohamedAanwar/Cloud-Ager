import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 85,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/me.jpg"),
          ),
        ),
        Text(
          "Mohamed Anwar",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 32,
              fontFamily: 'Pacifico'),
        ),
        Text(
          "FLUTTER DEVELOPER",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Divider(
          color: Colors.black,
          thickness: 2,
          indent: 60,
          endIndent: 60,
          height: 20,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(
              Icons.phone,
              size: 32,
              color: Colors.black,
            ),
            title: Text(
              "(+20) 1100106132",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(
              Icons.email,
              size: 32,
              color: Colors.black,
            ),
            title: Text(
              "moahamedanwar082@gmail.com",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
