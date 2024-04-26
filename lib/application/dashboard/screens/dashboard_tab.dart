import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/Report%20Accident%20pages/primaryquestion.dart';
import 'package:flutter_application_2/application/authentication/screens/login_screen.dart';
import 'package:flutter_application_2/application/dashboard/screens/chat.dart';
import 'package:flutter_application_2/application/dashboard/screens/track_accident_report_screen.dart';
import 'package:flutter_application_2/main.dart';

import '../../../utils/functions.dart';
import '../widgets/card_widget.dart';
import 'customer_service_faq_screen.dart';
import 'my_reports_screen.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  Functions.showDialogFunction(
                    context: context,
                    data: 'Do you want to report an accident?',
                    onTapYes: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(
                        builder: (context) => firstreportpage(),
                      ));
                    },
                  );
                },
                child: const CardWidget(
                    icon: Icons.car_crash, data: 'Report accident')),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackAccidentReportScreen(),
                    ));
              },
              child: const CardWidget(
                  icon: Icons.event_repeat_outlined,
                  data: 'Track accident Report'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  Functions.showDialogFunction(
                    context: context,
                    data: 'Do you want to start a new chat?',
                    onTapYes: () async {
                      // showAdaptiveDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       backgroundColor: Colors.transparent,
                      //       title: Center(
                      //         child: SizedBox(
                      //           height: 20,
                      //           width: 20,
                      //           child: CircularProgressIndicator(
                      //             color: Colors.green,),
                      //         ),
                      //       ),
                      //     );
                      //   });
                      var admin = await FirebaseFirestore.instance
                          .collection('users')
                          .where('roleid', isEqualTo: 'admin')
                          .get();

                      var r1 = await FirebaseFirestore.instance
                          .collection('rooms')
                          .where('userid2', isEqualTo: prefs!.getString('id'))
                          .where('userid1',
                              isEqualTo: admin.docs[0].reference.id)
                          .get();
                      var r2 = await FirebaseFirestore.instance
                          .collection('rooms')
                          .where('userid1', isEqualTo: prefs!.getString('id'))
                          .where('userid2',
                              isEqualTo: admin.docs[0].reference.id)
                          .get();

                      if (r1.docs.isEmpty && r2.docs.isEmpty) {
                        print('empty');

                        return await FirebaseFirestore.instance
                            .collection('rooms')
                            .add({
                          'userid1': admin.docs[0].data()['id'],
                          'userid2': prefs!.getString('id'),
                        }).then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Chat(admnID: admin.docs[0].reference.id);
                              },
                            ),
                          );
                        }).onError((error, stackTrace) {
                          Navigator.of(context).pop();
                        });
                      } else {
                        Navigator.of(context).pop();

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Chat(admnID: admin.docs[0].reference.id);
                            },
                          ),
                        );
                      }
                    },
                  );
                },
                child: const CardWidget(
                    icon: Icons.headset_mic, data: 'Start a live chat')),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyReportsScreen(),
                      ));
                },
                child: const CardWidget(
                    icon: Icons.book_outlined, data: 'My reports')),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerServiceFAQScreen(),
                      ));
                },
                child: const CardWidget(
                    icon: Icons.chat, data: 'Customer service FAQ')),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    prefs!.clear();
                    Functions.showDialogFunction(
                      context: context,
                      data: 'Are you sure to logout?',
                      onTapYes: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false);
                      },
                    );
                  },
                  child: Container(
                    width: 125.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.shade200.withOpacity(0.6),
                          offset: const Offset(0.0, 1.0),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
