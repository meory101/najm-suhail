import 'package:flutter/material.dart';

class CustomerServiceFAQAnswerScreen extends StatefulWidget {
  final String question;
  final String answer;

  const CustomerServiceFAQAnswerScreen(
      {super.key, required this.question, required this.answer});

  @override
  State<CustomerServiceFAQAnswerScreen> createState() =>
      _CustomerServiceFAQAnswerScreenState();
}

class _CustomerServiceFAQAnswerScreenState
    extends State<CustomerServiceFAQAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.question,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.answer,
              maxLines: 9,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
