import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/dashboard/widgets/report_widget.dart';
import 'package:flutter_application_2/main.dart';

import '../widgets/track_accident_report_widget.dart';

const List<TrackAccidentReportWidget> trackReportAccidentList = [
  TrackAccidentReportWidget(
    reportId: '3275',
    date: '12/6/2023',
    reportStatus: 'Submitted',
  ),
  TrackAccidentReportWidget(
    reportId: '9370',
    date: '4/1/2023',
    reportStatus: 'Under processing',
  ),
];

class TrackAccidentReportScreen extends StatefulWidget {
  const TrackAccidentReportScreen({super.key});

  @override
  State<TrackAccidentReportScreen> createState() =>
      _TrackAccidentReportScreenState();
}

class _TrackAccidentReportScreenState extends State<TrackAccidentReportScreen> {
  var ReportsList;

  getMyReposts() async {
    ReportsList = FirebaseFirestore.instance
        .collection('reports')
        .where(
          Filter.or(
            Filter("userid2", isEqualTo: prefs!.getString('id')),
            Filter(
              "userid1",
              isEqualTo: prefs!.getString('id'),
            ),
          ),
        )
        .snapshots();
    setState(() {});
  }

  @override
  void initState() {
    getMyReposts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ReportsList,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return TrackAccidentReportWidget(
                      reportId: snapshot.data.docs[index].reference.id,
                      date: '${snapshot.data.docs[index].data()['date']}',
                      reportStatus:
                          '${snapshot.data.docs[index].data()['status']}',
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5.0),
                  itemCount: snapshot.data.docs.length,
                )
              : const Center(
                  child: Text(
                    'No reports found',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                );
        });
  }
}
