// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/card_screen.dart';

class ResultsCardWidget extends StatefulWidget {
  const ResultsCardWidget({super.key});

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
              const Text(
                'Card Title',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            const SizedBox(height: 8.0),
            Text(
              'Team1 VS Team2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'date',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Result',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
