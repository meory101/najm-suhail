import 'package:flutter/material.dart';

class MyReportsScreenButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final bool isActive;
  final String data;

  const MyReportsScreenButtonWidget(
      {super.key, this.onTap, required this.isActive, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.black.withOpacity(0.5)
              : Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? Colors.black.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              offset: const Offset(0.0, 1.0),
              blurRadius: 0.5,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
