// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sac_app/admin/admin_page.dart';
import 'package:sac_app/model/card.dart';
import 'package:sac_app/providers/user_provider.dart';
import 'package:sac_app/resources/auth_method.dart';
import 'package:sac_app/resources/firestore_methods.dart';
import 'package:sac_app/responsive/mobile_screen_layout.dart';
import 'package:sac_app/utils/utils.dart';
import 'package:sac_app/widgets/dropdown.dart';
import 'package:date_field/date_field.dart';
import 'package:sac_app/widgets/text_field_input.dart';
import 'package:sac_app/widgets/dropdown.dart';
import 'package:uuid/uuid.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController _venue = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _team1 = TextEditingController();
  TextEditingController _team2 = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  bool _isLoading = false;
  // DateTime selectedDateTime = DateTime.now();
  late DateTime _selectedDateTime = DateTime.now();
  late DateTime _selectedTime = DateTime.now();

  void uploadEvent() async {
    setState(() {
      _isLoading = true;
    });
    String res = 'success';

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminPage()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  String cardId = const Uuid().v1();
  void postCard() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadSportsCard(
          _description.text,
          cardId,
          _title.text,
          _venue.text,
          _team1.text,
          _team2.text,
          _selectedDateTime,
          _selectedTime);

      if (res == "success") {
        setState(() {
          _isLoading = true;
        });
        showSnackBar('posted', context);
      } else {
        setState(() {
          _isLoading = true;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _venue.dispose();
    _description.dispose();
    _dateController.dispose();
    _team1.dispose();
    _team2.dispose();
    _title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dropDownValue1 = 'All';
    String dropDownValue2 = 'CSE';
    String dropDownValue3 = 'CSE';
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 45,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: DropdownButtonFormField<String>(
                  value: dropDownValue1,
                  items: <String>[
                    'All',
                    'Cricket',
                    'Football',
                    'Volleyball',
                    'Basketball',
                    'Atheletics',
                    'Weightlifting'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue1) {
                    _title.text = newValue1!;
                    setState(() {
                      dropDownValue1 = newValue1;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Sports',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: DropdownButtonFormField<String>(
                  // Step 3.
                  value: dropDownValue2,
                  // Step 4.
                  items: <String>['CSE', 'ECE', 'EE', 'ME', 'CE', 'ARCH']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue2) {
                    _team1.text = newValue2!;
                    setState(() {
                      dropDownValue2 = newValue2;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Team1',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: DropdownButtonFormField<String>(
                  // Step 3.
                  value: dropDownValue3,
                  // Step 4.
                  items: <String>['CSE', 'ECE', 'EE', 'ME', 'CE', 'ARCH']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue3) {
                    _team2.text = newValue3!;
                    setState(() {
                      dropDownValue3 = newValue3;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Team2',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                child: DateTimeField(
                  onDateSelected: (DateTime value) {
                    setState(() {
                      _selectedDateTime = value;
                    });
                  },
                  selectedDate: _selectedDateTime,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // SizedBox(
              //   width: 300,
              //   child: TextFormField(
              //     controller: _timeController,
              //     onTap: () async {
              //       final currentTime = _selectedTime;
              //       final selectedTime = await showTimePicker(
              //         context: context,
              //         initialTime: currentTime,
              //       );
              //       if (selectedTime != null) {
              //         setState(() {
              //           _selectedTime = selectedTime;
              //           _timeController.text = selectedTime.format(context);
              //         });
              //       }
              //     },
              //     decoration: InputDecoration(
              //       labelText: 'Time',
              //       border: OutlineInputBorder(),
              //     ),
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter a time';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFieldInput(
                  textEditingController: _venue,
                  hintText: 'Enter Venue',
                  textInputType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: TextFieldInput(
                  textEditingController: _description,
                  hintText: 'Enter Description',
                  textInputType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => postCard(),
                child: Container(
                  // child: _isLoading
                  //     ? const Center(
                  //         child: CircularProgressIndicator(color: Colors.white))
                  child: const Text('Upload'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
