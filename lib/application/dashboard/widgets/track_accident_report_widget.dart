import 'package:flutter/material.dart';

class TrackAccidentReportWidget extends StatelessWidget {
  final String reportId;
  final String date;
  final String reportStatus;

  const TrackAccidentReportWidget(
      {super.key,
      required this.reportId,
      required this.date,
      required this.reportStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Report status: ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 175.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: reportStatus.toLowerCase() == 'submitted'
                        ? Colors.green.shade300
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: reportStatus.toLowerCase() == 'submitted'
                            ? Colors.green.shade300.withOpacity(0.6)
                            : Colors.grey.shade300.withOpacity(0.6),
                        offset: const Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Text(
                    reportStatus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
