// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/card_screen.dart';

class ResultsCardWidget extends StatefulWidget {
  final snap;
  const ResultsCardWidget({super.key, this.snap});

  @override
  State<ResultsCardWidget> createState() => _ResultsCardWidgetState();
}

class _ResultsCardWidgetState extends State<ResultsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 230,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Image.network(
                'https://picsum.photos/200',
                height: 100.0,
              ),
              SizedBox(
                width: 75,
              ),
              Text(
                widget.snap['title'],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  widget.snap['team1'],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'VS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.snap['team2'],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(widget.snap['date'].toDate()),
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.snap['result'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
