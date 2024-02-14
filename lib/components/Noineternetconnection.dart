import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/no.png",
            width: 300,
            height: 300,
          ),
        ),
        Text(
          "No Internet connection",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Check your connection, then refresh the page",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 18,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () async {
              ConnectivityResult result =
                  await Connectivity().checkConnectivity();
              if (result == ConnectivityResult.none) {
                var sna = SnackBar(
                  backgroundColor: Colors.blue,
                  content: Row(
                    children: [
                      Icon(
                        Icons.signal_wifi_connected_no_internet_4_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Please check connection and try again!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(sna);
              }
            },
            child: Text(
              'Resfresh',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
