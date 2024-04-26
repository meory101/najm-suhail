import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData? icon;
  final String data;

  const CardWidget({super.key, this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 0.3),
            blurRadius: 0.3,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 75.0,
            color: Colors.grey,
          ),
          Container(
            width: 3.0,
            height: 75.0,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            color: Colors.green,
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
