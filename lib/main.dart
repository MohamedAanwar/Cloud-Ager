import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Screens/Welcomescreen.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweathercubit.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweatherstates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWathearCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWathearCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWathearCubit>(context)
                          .weathermodel
                          ?.weatherStateName),
                ),
              ),
              home: const SplashView(),
            );
          },
        );
      }),
    );
  }
}

getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition == 'Sunny ' || condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Clear ' ||
      condition == 'Clear' ||
      condition == 'Partly cloudy') {
    return Color(0xff66bbdd);
  } else if (condition == 'Blizzard ' ||
      condition == 'Patchy Snow Possible ' ||
      condition == 'Patchy Sleet Possible ' ||
      condition == 'Patchy Freezing Drizzle Possible ' ||
      condition == 'Blowing Snow ') {
    return Colors.blue;
  } else if (condition == 'Freezing Fog ' ||
      condition == 'Fog ' ||
      condition == 'Heavy Cloud ' ||
      condition == 'Mist ' ||
      condition == 'Fog ') {
    return Colors.blueGrey;
  } else if (condition == 'Patchy Rain Possible ' ||
      condition == 'Heavy Rain' ||
      condition == 'Showers	' ||
      condition == 'Patchy rain nearby') {
    return Colors.blue;
  } else if (condition == 'Overcast ' || condition == 'Overcast') {
    return Color(0xffc3bdab);
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Moderate or heavy snow with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
