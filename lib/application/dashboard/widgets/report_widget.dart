import 'package:flutter/material.dart';

import '../screens/report_details_screen.dart';

class ReportWidget extends StatelessWidget {
  final String reportId;
  final String date;
  final String location;
  final String decisionPercentage;
  final String reasoning;

  const ReportWidget(
      {super.key,
      required this.reportId,
      required this.date,
      required this.location,
      required this.decisionPercentage,
      required this.reasoning});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (decisionPercentage != '' && reasoning != '') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportDetailsScreen(
                  decisionPercentage: decisionPercentage,
                  reasoning: reasoning,
                ),
              ));
        }
      },
      child: Container(
        height: 125.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Icon(
                    Icons.book_outlined,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 1.0,
                    height: 50.0,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report id: $reportId',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Date: $date',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Location: ',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on_outlined),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
