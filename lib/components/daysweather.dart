import 'package:flutter/material.dart';

class DaysWeather extends StatelessWidget {
  const DaysWeather(
      {super.key,
      required this.daydate,
      required this.dayimage,
      required this.daymintemp,
      required this.daymaxtemp});
  final String daydate;
  final String dayimage;
  final double daymintemp;
  final double daymaxtemp;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text("${flipday().day}-${flipday().month}-${flipday().year}",
                  style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              Spacer(),
              Image.network("https:${dayimage}"),
              Spacer(),
              Text(
                "${daymintemp.round().toString()}°",
                style: TextStyle(
                    fontFamily: "WorkSans",
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white60),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green, Colors.yellow])),
                width: 90,
                height: 5,
              ),
              Text("${daymaxtemp.round().toString()}°",
                  style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        )
      ],
    );
  }

  DateTime flipday() {
    return DateTime.parse(daydate);
  }
}
