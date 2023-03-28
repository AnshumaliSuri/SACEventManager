import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultCard {
  final String uid;
  final String cardId;
  final String title;
  final date;
  final time;
  final String venue;
  final String team1;
  final String team2;

  final String result;

  const ResultCard({
    required this.uid,
    required this.cardId,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.team1,
    required this.team2,
    required this.result,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'uid': uid,
        'date': date,
        'time': time,
        'cardId': cardId,
        'venue': venue,
        'team1': team1,
        'team2': team2,
        'result': result,
      };

  static ResultCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ResultCard(
      title: snapshot['title'],
      uid: snapshot['uid'],
      cardId: snapshot['postId'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      time: snapshot['time'],
      venue: snapshot['venue'],
      result: snapshot['result'],
    );
  }
}
