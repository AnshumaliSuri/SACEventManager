import 'package:flutter/material.dart';
import 'package:sac_app/model/result_card.dart';
import 'package:sac_app/utils/color.dart' as color;
import 'package:sac_app/widgets/results_card.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
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
      body: Column(children: [
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
            itemCount: _filteredContent.length,
            itemBuilder: (context, index) => Container(
              child: ResultsCardWidget(),
            ),
          ),
        ),
      ]),
    );
  }
}
