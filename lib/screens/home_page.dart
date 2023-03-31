// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sac_app/utils/color.dart' as color;
import 'package:sac_app/widgets/home_screen_card.dart';

import 'card_screen.dart';

class HomePage extends StatefulWidget {
  List<String> items = [
    'Cricket',
    'Football',
    'Volleyball',
    'Basketball',
    'Atheletics',
    'Weightlifting'
  ];

  List<String> dates = ['Upcoming Events', 'Past Events'];

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = 'All';
  List<String> _filteredContent = [];

  String _selctedDatesFilter = 'All';
  List<String> _filteredDates = [];

  // void _filterContent(String? selectedItem) {
  //   setState(() {
  //     _selectedItem = selectedItem!;
  //     _filteredContent =
  //         _content.where((content) => content.contains(selectedItem)).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = _selectedFilter == 'All'
        ? widget.items
        : widget.items.where((item) => item.contains(_selectedFilter)).toList();

    List<String> filteredDates = _selctedDatesFilter == 'All'
        ? widget.dates
        : widget.dates.where((item) => item.contains(_selectedFilter)).toList();

    List<String> dropdownFilters =
        ['All'] + widget.items.map((item) => item).toSet().toList()
          ..sort();

    List<String> dropdownDatesFilters =
        ['All'] + widget.dates.map((item) => item).toSet().toList()
          ..sort();

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('sportsCard')
              .where('title', isEqualTo: _selectedFilter)
              .where('date',
                  isGreaterThanOrEqualTo: _selctedDatesFilter == 'Past Events'
                      ? DateTime.now().subtract(Duration(days: 1))
                      : DateTime.now())
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('No data found.'),
              );
            }
            if (snapshot.hasData) {
              var documents = snapshot.data!.docs;
              return Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sports Intramurals",
                      style: TextStyle(
                        fontSize: 18,
                        color: color.AppColor.homeColorIcon,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: DropdownButtonFormField<String>(
                        value: _selectedFilter,
                        onChanged: (String? value1) {
                          setState(() {
                            _selectedFilter = value1!;
                          });
                        },
                        items: dropdownFilters
                            .map<DropdownMenuItem<String>>((String value) =>
                                DropdownMenuItem<String>(
                                    value: value, child: Text(value)))
                            .toList(),
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Sports',
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: 180,
                      child: DropdownButtonFormField<String>(
                        value: _selctedDatesFilter,
                        onChanged: (String? value2) {
                          setState(() {
                            _selectedFilter = value2!;
                          });
                        },
                        items: dropdownDatesFilters
                            .map<DropdownMenuItem<String>>((String value) =>
                                DropdownMenuItem<String>(
                                    value: value, child: Text(value)))
                            .toList(),
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Date',
                        ),
                      ),
                    ),
                  ],
                ),
                // DropdownButton<String>(
                //   value: _selectedItem,
                //   items: _items.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: _filterContent,
                // ),
                Expanded(
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) => Container(
                      child: HomeScreenCard(
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    ),
                  ),
                ),
              ]);
            }
            return Column(children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sports Intramurals",
                    style: TextStyle(
                      fontSize: 18,
                      color: color.AppColor.homeColorIcon,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: _selectedFilter,
                onChanged: (String? value1) {
                  setState(() {
                    _selectedFilter = value1!;
                  });
                },
                items: dropdownFilters
                    .map<DropdownMenuItem<String>>((String value) =>
                        DropdownMenuItem<String>(
                            value: value, child: Text(value)))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Sports',
                ),
              ),
            ]);
          }),
    );
  }
}
