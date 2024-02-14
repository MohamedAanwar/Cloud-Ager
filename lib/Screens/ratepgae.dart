import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rate Us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'How would you rate our app?',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.star,
                      color: _rating >= 1 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.star,
                      color: _rating >= 2 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.star,
                      color: _rating >= 3 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.star,
                      color: _rating >= 4 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.star,
                      color: _rating >= 5 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'You rated us: $_rating',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
