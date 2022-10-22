// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  int group = 0;
  String? _relation;
  String? _blood;
  String? _caseOf;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Creating a Request Form',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Patient's Full Name",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              //--------------------------------gender
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.female,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Required for:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          const Text(
                            'Male',
                          ),
                          Radio(
                              value: 1,
                              groupValue: group,
                              onChanged: (int? T) {
                                setState(() {
                                  (T);
                                  group = T!;
                                });
                              }),
                          const Text(
                            'Female',
                          ),
                          Radio(
                              value: 2,
                              groupValue: group,
                              onChanged: (int? T) {
                                setState(() {
                                  (T);
                                  group = T!;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              //--------------------------------relation with patient
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.groups,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        items: <String>[
                          'Mother',
                          'Father',
                          'Sister',
                          'Brother',
                          'Son',
                          'Daughter',
                          'Wife',
                          'Husband',
                          'Other',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _relation,
                        hint: const Text(
                          'Your relation with patient',
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() => _relation = newValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              //--------------------------------blood group
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.bloodtype,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        // value: _item,
                        items: <String>[
                          'A+',
                          'A-',
                          'B+',
                          'B-',
                          'O+',
                          'O-',
                          'AB+',
                          'AB-',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _blood,
                        hint: const Text(
                          "Patients' Blood group",
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() => _blood = newValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              //--------------------------------Operation type
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.bolt_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: _caseOf,
                        items: <String>[
                          'Surgery',
                          'Operation',
                          'Accident',
                          'Other',
                        ].map<DropdownMenuItem<String>>((String caseOf) {
                          return DropdownMenuItem<String>(
                            value: caseOf,
                            child: Text(caseOf),
                          );
                        }).toList(),
                        hint: const Text(
                          "Patients' Case",
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() => _caseOf = newValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_hospital),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Hospital",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "City",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Location",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(BottomBar());
                  },
                  child: Text(
                    'Post Request',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
