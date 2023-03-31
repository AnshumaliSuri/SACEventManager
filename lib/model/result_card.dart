import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultCard {
  final String resultCardId;
  final String title;
  final date;
  // final String description;
  final String team1;
  final String team2;
  final String result;

  const ResultCard({
    required this.resultCardId,
    required this.title,
    required this.date,
    // required this.description,
    required this.team1,
    required this.team2,
    required this.result,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'resultCardId': resultCardId,
        'team1': team1,
        'team2': team2,
        'result': result,
        // 'description': description,
      };

  static ResultCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ResultCard(
      title: snapshot['title'],
      resultCardId: snapshot['resultCardId'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      result: snapshot['result'],
      // description: snapshot['description'],
    );
  }
}
