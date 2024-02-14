import 'package:flutter/material.dart';

class ListTileCat extends StatelessWidget {
  const ListTileCat(
      {super.key, required this.text, required this.ic, required this.ontop});
  final String text;
  final Icon ic;
  final Function() ontop;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontop,
      leading: ic,
      title: Text(
        text,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
