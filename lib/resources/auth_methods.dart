import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_test/providers/user_provider.dart';
import "package:flutter_application_test/models/user.dart" as model;
import 'package:flutter_application_test/utils/utils.dart';

class AuthMethods {
  final _userRef = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> getCurrentUser(String? uid) async {
    if (uid != null) {
      final snap = await _userRef.doc(uid).get();
      return snap.data();
    }
    return null;
  }

  Future<bool> signUpUser(
    BuildContext context,
    String email,
    String username,
    String password,
  ) async {
    bool res = false;
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (cred.user != null) {
        model.User user = model.User(
          username: username.trim(),
          email: email.trim(),
          uid: cred.user!.uid,
        );
        await _userRef.doc(cred.user!.uid).set(user.toMap());
        if (!context.mounted) return false;
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return false;
      showSnackBar(context, e.message!);
    }
    return res;
  }

  Future<bool> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    bool res = false;
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cred.user != null) {
        final userData = await getCurrentUser(cred.user!.uid);
        if (!context.mounted) return false;
        Provider.of<UserProvider>(context, listen: false).setUser(
          model.User.fromMap(userData ?? {}),
        );
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return false;
      showSnackBar(context, e.message!);
    }
    return res;
  }
}