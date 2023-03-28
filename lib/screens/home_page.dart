// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sac_app/utils/color.dart' as color;
import 'package:sac_app/widgets/home_screen_card.dart';

import 'card_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedItem = "All";

  List<String> _items = ['All', 'Item 2', 'Item 3', 'Item 4'];

  List<String> _content = [
    'Content for Item 1',
    'Content for Item 2',
    'Content for Item 3',
    'Content for Item 4',
  ];

  List<String> _filteredContent = [];

  @override
  void initState() {
    super.initState();
    _filteredContent = _content;
  }

  void _filterContent(String? selectedItem) {
    setState(() {
      _selectedItem = selectedItem!;
      _filteredContent =
          _content.where((content) => content.contains(selectedItem)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('sportsCard').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
              DropdownButton<String>(
                value: _selectedItem,
                items: _items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: _filterContent,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: HomeScreenCard(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  ),
                ),
              ),
            ]);
          }),
    );
  }
}
