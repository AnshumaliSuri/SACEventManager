import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SportsCard {
  final String description;

  final String cardId;
  final String title;
  final date;
  final time;
  final String venue;
  final String team1;
  final String team2;

  const SportsCard({
    required this.description,
    required this.cardId,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.team1,
    required this.team2,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'cardId': cardId,
        'venue': venue,
        'team1': team1,
        'team2': team2,
      };

  static SportsCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return SportsCard(
      title: snapshot['title'],
      description: snapshot['description'],
      cardId: snapshot['postId'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      time: snapshot['time'],
      venue: snapshot['venue'],
    );
  }
}
