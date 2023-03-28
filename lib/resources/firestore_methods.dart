// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sac_app/resources/storage_methods.dart';
import 'package:sac_app/model/card.dart';
import 'package:sac_app/widgets/dropdown.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadSportsCard(
    String description,
    String cardId,
    String title,
    String venue,
    String team1,
    String team2,
    date,
    time,
  ) async {
    String res = "Some error occurred";
    try {
      String cardId = const Uuid().v1(); // creates unique id based on time
      SportsCard card = SportsCard(
        description: description,
        cardId: cardId,
        title: title,
        venue: venue,
        team1: team1,
        team2: team2,
        date: date,
        time: time,
      );
      _firestore.collection('sportsCard').doc(cardId).set(
            card.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
