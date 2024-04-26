import 'package:flutter/material.dart';

class CustomerServiceFAQWidget extends StatelessWidget {
  final Function()? onTap;
  final String data;

  const CustomerServiceFAQWidget({super.key, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75.0,
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
            Expanded(
              child: Text(
                data,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
