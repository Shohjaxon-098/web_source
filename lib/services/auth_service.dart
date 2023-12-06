import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_source/model/toast.dart';

class FireBaseAuthService extends ChangeNotifier{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseException catch (e) {
      if (e.code == "email-already-use") {
        showToast(message: "Bu emaildan avval foydalanilgan.");
      } else {
        showToast(message: "Xatolik yuz berdi: ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        showToast(message: "Noto`g`ri email yoki parol.");
      } else {
        showToast(message: "Xatolik yuz berdi:${e.code}");
      }
    }
    return null;
  }
}
