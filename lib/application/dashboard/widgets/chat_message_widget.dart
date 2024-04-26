import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String data;

  const ChatMessageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0.0, 1.0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Text(
                        data,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
