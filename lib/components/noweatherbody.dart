import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/SearchPage.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        child: Container(
          margin: EdgeInsets.all(20),
          child: Image.asset("assets/images/search.jpg"),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Center(
        child: DefaultTextStyle(
          style: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'BreeSerif'),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Search for a City 🔍'),
              TypewriterAnimatedText('Search for a City 🔍'),
              TypewriterAnimatedText('Search for a City 🔍'),
              TypewriterAnimatedText('Search for a City 🔍'),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      )
      //     Text(
      //   "Search for a City 🔍",
      //   style: TextStyle(
      //       fontSize: 30, fontWeight: FontWeight.w500, fontFamily: 'BreeSerif'),
      // )
    ]);
  }
}
