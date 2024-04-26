import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Functions {
  static void showLoaderFunction({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (_context) => Center(
        child: Container(
          height: 75.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.green,
                offset: Offset(0.0, 0.0),
                blurRadius: 7.5,
                spreadRadius: 0.75,
              ),
            ],
          ),
          child: LoadingAnimationWidget.hexagonDots(
            color: Colors.green,
            size: 50.0,
          ),
        ),
      ),
    );
  }

  static void showDialogFunction(
      {required BuildContext context,
      required String data,
      Function()? onTapYes}) {
    showDialog(
      context: context,
      builder: (_context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 275.0, horizontal: 35.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(0.0, 0.0),
                blurRadius: 3.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(_context);
                          if (onTapYes != null) {
                            onTapYes();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                offset: const Offset(0.0, 1.0),
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Yes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(_context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                offset: const Offset(0.0, 1.0),
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      barrierColor: Colors.transparent,
    );
  }

  static Future<DateTime?> showDatePickerFunction(
      {required BuildContext context}) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      builder: (_, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return selectedDate;
  }
}
