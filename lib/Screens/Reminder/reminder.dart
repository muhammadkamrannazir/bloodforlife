// ignore_for_file: prefer_const_constructors

import 'package:bloodforlife/widgets/custom_text.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../../widgets/reminder_container.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Card(
                margin: EdgeInsets.all(10),
                elevation: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    CustomText(
                      name: 'Reminder',
                      fontsize: 30,
                      color: Colors.teal,
                    ),
                    CustomText(
                      name:
                          "*By Setting reminder your contract\n information would not show in donors\n list for next 3 months.*",
                      fontsize: 20,
                      color: Colors.teal,
                    ),
                    Divider(
                      indent: 40,
                      endIndent: 40,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    ReminderContainer(
                      Colors.white,
                      Colors.grey,
                      height: screenHeight / 13,
                      width: screenWidth / 1.2,
                      child: DateTimePicker(
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Last Donated Date',
                        icon: Icon(
                          Icons.date_range,
                          size: 30,
                        ),
                        onChanged: (val) => (val),
                        validator: (val) {
                          (val);
                          return null;
                        },
                        onSaved: (val) => (val),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    GestureDetector(
                      onTap: () {},
                      child: ReminderContainer(
                        Color.fromARGB(255, 136, 11, 3),
                        Color.fromARGB(255, 136, 11, 3),
                        height: screenHeight / 13,
                        width: screenWidth / 1.2,
                        child: CustomText(
                          name: 'Submit',
                          color: Colors.white,
                          fontsize: 20,
                        ),
                      ),
                    ),
                    // SizedBox(height: screenHeight * 0.020),
                    // CustomText(
                    //   name: 'LAST DONATED DATE',
                    //   fontsize: 20,
                    //   color: Colors.grey,
                    // ),
                    // CustomText(
                    //   name: 'dd - mm - yyyy',
                    //   fontsize: 18,
                    //   color: Colors.teal,
                    // ),
                    SizedBox(height: screenHeight * 0.030),
                    CustomText(
                      name: 'NOW YOU CAN DONATE ON',
                      fontsize: 20,
                      color: Colors.grey,
                    ),
                    ReminderContainer(
                      Colors.white,
                      Colors.red,
                      height: screenHeight / 13,
                      width: screenWidth / 2,
                      child: CustomText(
                        name: 'dd - mm - yyyy',
                        color: Colors.red,
                        fontsize: 18,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.030),
                  ],
                ),
              ),
              CustomText(
                name: 'Donation History',
                fontsize: 30,
                color: Colors.teal,
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
