import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red, // Background color for the container
        borderRadius:
            BorderRadius.circular(8.0), // Rounded corners for the container
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline, // Error icon
            color: Colors.white,
            size: 27, // Color of the error icon
          ),
          SizedBox(width: 8.0), // Spacer between icon and text
          Expanded(
            child: Text(
              'Invalid City, Please try again!', // Error message
              style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 21.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "BreeSerif" // Text size
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
