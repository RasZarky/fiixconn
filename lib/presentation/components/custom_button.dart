import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;


  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor = Colors.white,
    this.textColor = const Color(0xFF003366),
    this.borderColor =  const Color(0xFFE5E7EB),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: borderColor )),
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: textColor,
              ),
            )),
      ),
    );
  }
}