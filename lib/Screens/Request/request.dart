// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bloodforlife/Screens/Reminder/reminder.dart';
import 'package:bloodforlife/Screens/Request/create_request.dart';
import 'package:bloodforlife/widgets/custom_text.dart';
import 'package:bloodforlife/widgets/reminder_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GenderGroup { male, female }

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Get.to(CreateRequest());
          },
          label: CustomText(
            name: 'Request Blood',
            color: Colors.white,
            fontsize: 20,
          ),
          // child: Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group,
              size: 40,
            ),
            SizedBox(height: screenHeight / 25),
            CustomText(
              name: 'Blood Requests Not Available',
              fontsize: 20,
              color: Colors.red,
            ),
            SizedBox(height: screenHeight / 25),
            CustomText(
              name:
                  'It means no one need blood in your area \n or no one made a request yet',
              fontsize: 19,
              color: Colors.teal,
            ),
            SizedBox(height: screenHeight / 18),
            GestureDetector(
              onTap: () {},
              child: ReminderContainer(
                Color.fromARGB(255, 187, 17, 5),
                Colors.red,
                height: screenHeight / 14,
                width: screenWidth / 2.5,
                child: CustomText(
                  name: 'Reload',
                  color: Colors.white,
                  fontsize: 25,
                ),
              ),
            ),
          ],
        )
        // Padding(
        //   padding: EdgeInsets.all(12),
        //   child: ListView.separated(
        //     itemBuilder: (BuildContext context, index) {
        //       return SizedBox(
        //         height: MediaQuery.of(context).size.height/3,
        //         child: Card(
        //           margin: EdgeInsets.all(12),
        //           elevation: 8,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: const [
        //                   Text('Name of Patient'),
        //                   Text('Gender'),
        //                 ],
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: const [
        //                   Text('Relation with patient'),
        //                   Text('Patient Case'),
        //                   Text('Blood Group : O-'),
        //                 ],
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: const [
        //                   Text('Relation with patient'),
        //                   Text('Patient Case'),
        //                   Text('Blood Group : O-'),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //     separatorBuilder: (BuildContext context, index) {
        //       return Divider();
        //     },
        //     itemCount: 5,
        //   ),
        // ),
        );
  }
}
