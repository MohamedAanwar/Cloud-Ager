import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weatherapp/Screens/SearchPage.dart';

import 'package:weatherapp/Screens/infopage.dart';
import 'package:weatherapp/Screens/ratepgae.dart';
import 'package:weatherapp/components/Noineternetconnection.dart';
import 'package:weatherapp/components/errormessge.dart';
import 'package:weatherapp/components/listtilecat.dart';
import 'package:weatherapp/components/noweatherbody.dart';
import 'package:weatherapp/components/watherbody.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweathercubit.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweatherstates.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Colors.white,
            ),
          ),
          title: const Row(
            children: [
              Text(
                "Cloud",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              Text(
                "Ager",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Cloud",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                            fontFamily: "ProtestGuerrilla"),
                      ),
                      Text(
                        "Ager",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                            fontFamily: "ProtestGuerrilla"),
                      ),
                    ],
                  ),
                ),
                ListTileCat(
                  text: "Developer Info",
                  ic: Icon(Icons.person_pin_rounded,
                      size: 35, color: Colors.white70),
                  ontop: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Info()));
                  },
                ),
                ListTileCat(
                  text: 'Share App',
                  ic: Icon(
                    Icons.share_sharp,
                    size: 35,
                    color: Colors.white70,
                  ),
                  ontop: () {
                    Share.share("check out my app https://shorturl.at/tGRTX",
                        subject: 'Cloud Ager© Copyright Mohamed Anwar');
                  },
                ),
                ListTileCat(
                  text: 'Rating',
                  ic: Icon(
                    Icons.rate_review_rounded,
                    size: 35,
                    color: Colors.white70,
                  ),
                  ontop: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RatingPage()));
                  },
                ),
                ListTileCat(
                  text: 'Search City',
                  ic: Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.white70,
                  ),
                  ontop: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile) {
                // connected to mobile data
                return connectionsuccesswidget();
              } else if (result == ConnectivityResult.wifi) {
                // connected to wifi
                return connectionsuccesswidget();
              } else {
                print("no internet");
                // no internet
                return NoInternetConnection();
              }
            } else {
              // loading
              print("ffffffffffffffffffffffffffffffffffffff");
              return NoInternetConnection();
            }
          },
        ));
  }
}

class connectionsuccesswidget extends StatelessWidget {
  const connectionsuccesswidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWathearCubit, WeatherState>(
        builder: (context, state) {
      if (state is WeatherInitialState) {
        return NoWeatherBody();
      } else if (state is WeatherLoadedState) {
        return WeatherBody(wm: state.weathermodel);
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/OIP.jpg",
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ErrorMessage(),
          ],
        );
      }
    });
  }
}

Widget loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
