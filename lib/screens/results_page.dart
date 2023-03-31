// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sac_app/model/result_card.dart';
import 'package:sac_app/utils/color.dart' as color;
import 'package:sac_app/widgets/results_card.dart';

class ResultsPage extends StatefulWidget {
  List<String> items = [
    'Cricket',
    'Football',
    'Volleyball',
    'Basketball',
    'Atheletics',
    'Weightlifting'
  ];

  List<String> dates = ['Upcoming Events', 'Past Events'];

  ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String _selectedFilter = 'All';
  List<String> _filteredContent = [];

  String _selctedDatesFilter = 'All';
  List<String> _filteredDates = [];

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
          stream: _selectedFilter == 'All' && _selctedDatesFilter == 'All'
              ? FirebaseFirestore.instance.collection('resultCard').snapshots()
              : FirebaseFirestore.instance
                  .collection('resultCard')
                  .where('title', isEqualTo: _selectedFilter)
                  .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
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
                      "Results",
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
                      child: ResultsCardWidget(
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
                    "Results",
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
