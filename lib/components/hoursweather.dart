import 'package:flutter/material.dart';

class HoursWeather extends StatelessWidget {
  const HoursWeather(
      {super.key,
      required this.htime,
      required this.himage,
      required this.hdegree});
  final String htime;
  final String himage;
  final String hdegree;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          gethourtime(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: "WorkSans"),
        ),
        Image.network("https:${himage}", cacheHeight: 80),
        Text(
          "${hdegree}°",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: "WorkSans"),
        ),
        Spacer(),
      ],
    );
  }

  DateTime convertdatetime() {
    return DateTime.parse(this.htime);
  }

  String gethourtime() {
    if (convertdatetime().hour >= 12) {
      return "${convertdatetime().hour - 12}PM";
    } else {
      return "${convertdatetime().hour}AM";
    }
  }
}
