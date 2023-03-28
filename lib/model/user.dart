import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String password;

  const User({
    required this.email,
    required this.uid,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'password': password,
        'uid': uid,
        'email': email,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      password: snapshot['password'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
