import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatefulWidget {
  final String decisionPercentage;
  final String reasoning;

  const ReportDetailsScreen(
      {super.key, required this.decisionPercentage, required this.reasoning});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Decision percentage:',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '${widget.decisionPercentage}% Fault',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'Reasoning:',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '${widget.reasoning}',
              maxLines: 10,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
