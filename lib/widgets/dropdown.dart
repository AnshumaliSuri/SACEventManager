// // ignore_for_file: prefer_const_constructors, prefer_final_fields

// import 'package:flutter/material.dart';
// import 'package:sac_app/resources/firestore_methods.dart';

// TextEditingController _title = TextEditingController();
// TextEditingController _team1 = TextEditingController();
// TextEditingController _team2 = TextEditingController();

// class DropdownLists1 extends StatefulWidget {
//   const DropdownLists1({super.key});

//   @override
//   State<DropdownLists1> createState() => _DropdownListsState();
// }

// class _DropdownListsState extends State<DropdownLists1> {
//   String dropDownValue1 = 'All';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: dropDownValue1,
//       items: <String>[
//         'All',
//         'Cricket',
//         'Football',
//         'Volleyball',
//         'Basketball',
//         'Atheletics',
//         'Weightlifting'
//       ].map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: TextStyle(fontSize: 20),
//           ),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         _title.text = newValue!;
//         setState(() {
//           dropDownValue1 = newValue;
//         });
//       },
//       decoration: InputDecoration(
//         filled: true,
//         labelText: 'Sports',
//       ),
//     );
//   }
// }

// class DropdownList2 extends StatefulWidget {
//   const DropdownList2({super.key});

//   @override
//   State<DropdownList2> createState() => _DropdownList2State();
// }

// class _DropdownList2State extends State<DropdownList2> {
//   String dropDownValue2 = 'CSE';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       // Step 3.
//       value: dropDownValue2,
//       // Step 4.
//       items: <String>['CSE', 'ECE', 'EE', 'ME', 'CE', 'ARCH']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: TextStyle(fontSize: 20),
//           ),
//         );
//       }).toList(),
//       // Step 5.
//       onChanged: (String? newValue) {
//         _team1.text = dropDownValue2;
//         setState(() {
//           dropDownValue2 = newValue!;
//         });
//       },
//       decoration: InputDecoration(
//         filled: true,
//         labelText: 'Team1',
//       ),
//     );
//   }
// }

// class DropdownList3 extends StatefulWidget {
//   const DropdownList3({super.key});

//   @override
//   State<DropdownList3> createState() => _DropdownList3State();
// }

// class _DropdownList3State extends State<DropdownList3> {
//   String dropDownValue3 = 'CSE';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       // Step 3.
//       value: dropDownValue3,
//       // Step 4.
//       items: <String>['CSE', 'ECE', 'EE', 'ME', 'CE', 'ARCH']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: TextStyle(fontSize: 20),
//           ),
//         );
//       }).toList(),
//       // Step 5.
//       onChanged: (String? newValue) {
//         _team2.text = dropDownValue3;
//         setState(() {
//           dropDownValue3 = newValue!;
//         });
//       },
//       decoration: InputDecoration(
//         filled: true,
//         labelText: 'Team2',
//       ),
//     );
//   }
// }

// class DropdownList4 extends StatefulWidget {
//   const DropdownList4({super.key});

//   @override
//   State<DropdownList4> createState() => _DropdownList4State();
// }

// class _DropdownList4State extends State<DropdownList4> {
//   String dropDownValue4 = 'All';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       // Step 3.
//       value: dropDownValue4,
//       // Step 4.
//       items: <String>['All', 'Today', 'Upcoming', 'Past']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: TextStyle(fontSize: 20),
//           ),
//         );
//       }).toList(),
//       // Step 5.
//       onChanged: (String? newValue) {
//         setState(() {
//           dropDownValue4 = newValue!;
//         });
//       },
//       decoration: InputDecoration(
//         filled: true,
//         labelText: 'Date',
//       ),
//     );
//   }
// }
