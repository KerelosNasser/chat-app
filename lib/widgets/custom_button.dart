import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    this.width = 200.0, // Default width if not specified
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, // text color
            backgroundColor: Colors.green, // background color
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
