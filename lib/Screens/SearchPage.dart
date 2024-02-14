import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cuibts/getweathercubit/getweathercubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search City",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              ConnectivityResult result =
                  await Connectivity().checkConnectivity();
              if (result == ConnectivityResult.none) {
                Navigator.pop(context);
              } else {
                BlocProvider.of<GetWathearCubit>(context)
                    .getweather(cityname: value);
                Navigator.pop(context);
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(25),
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              hintText: "Enter city name",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
