import 'package:flutter/material.dart';
import 'package:weatherapp/components/daysweather.dart';
import 'package:weatherapp/components/hoursweather.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.wm});
  final WeatherModel wm;

  @override
  Widget build(BuildContext context) {
    List<Hours> hours = wm.gethous();
    List<Days> days = wm.getdays();
    String max = wm.maxtemp.round().toString();
    String min = wm.mintemp.round().toString();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [getThemeColor(wm.weatherStateName), Colors.white]),
      ),
      child: Column(
        children: [
          Text(
            wm.cityname,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Updated at : ${getupdatedtime().toString()}",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "WorkSans"),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Spacer(),
              Image.network(
                "https:${wm.image}",
              ),
              Spacer(),
              Text(
                "${wm.temp.round().toString()}°",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    fontFamily: "ProtestGuerrilla"),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "H: $max°",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "WorkSans"),
                  ),
                  Text(
                    "L: $min°",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "WorkSans"),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            wm.weatherStateName,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          Container(
              margin: EdgeInsets.all(16),
              height: 140,
              color: getThemeColor(wm.weatherStateName).withOpacity(0.5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hours.length,
                itemBuilder: (context, index) {
                  return HoursWeather(
                      htime: hours[index].hourtime,
                      himage: hours[index].hourimage,
                      hdegree: hours[index].temphour.round().toString());
                },
              )),
          Expanded(
            child: Container(
              color: getThemeColor(wm.weatherStateName).withOpacity(0.5),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return DaysWeather(
                      daydate: days[index].daydate,
                      dayimage: days[index].dayimage,
                      daymintemp: days[index].mintemo,
                      daymaxtemp: days[index].maxtemp);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  String getupdatedtime() {
    if (DateTime.parse(wm.date).hour >= 12) {
      return "${DateTime.parse(wm.date).hour - 12}PM";
    } else {
      return "${DateTime.parse(wm.date).hour}AM";
    }
  }
}
