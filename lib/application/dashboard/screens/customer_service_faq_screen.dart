import 'package:flutter/material.dart';

import '../widgets/customer_service_faq_widget.dart';
import 'customer_service_faq_answer_screen.dart';

class CustomerServiceFAQScreen extends StatefulWidget {
  const CustomerServiceFAQScreen({super.key});

  @override
  State<CustomerServiceFAQScreen> createState() =>
      _CustomerServiceFAQScreenState();
}

class _CustomerServiceFAQScreenState extends State<CustomerServiceFAQScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          CustomerServiceFAQWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CustomerServiceFAQAnswerScreen(
                        question:
                            'Can i move the vehicle from the accident site if traffic is obstructed?',
                        answer:
                            'The traffic accident has to be photographed from different angles with a mobile phone or using the Najm app (inform - photograph - move). Vehicles must be moved to the nearest safe point to eliminate traffic congestion and not to change the accident scence.',
                      ),
                    ));
              },
              data:
                  'Can i move the vehicle from the accident site if traffic is obstructed?'),
          const SizedBox(
            height: 10.0,
          ),
          const CustomerServiceFAQWidget(
              data: 'What are the procedures after reporting an accident?'),
          const SizedBox(
            height: 10.0,
          ),
          const CustomerServiceFAQWidget(
              data:
                  'What are some other traffic accidents cases, to name a few that Najm deals with?'),
          const SizedBox(
            height: 10.0,
          ),
          const CustomerServiceFAQWidget(
              data:
                  'I am not satisfied with the compensation amount. Can i check with Najm company regarding this issue?'),
          const SizedBox(
            height: 10.0,
          ),
          const CustomerServiceFAQWidget(
              data:
                  'What if received a message about a car plate that is not mine?'),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
