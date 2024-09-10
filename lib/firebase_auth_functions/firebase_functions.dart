// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/login.dart';
import 'package:google_sign_in/google_sign_in.dart';



// REGISTER / SIGN UP FUNCTION
createUserWithEmailAndPassword(
    String emailAddress, String password, BuildContext context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User Created Successfully'),
          backgroundColor: Colors.lightGreen,
          ));
    } else {}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.'),
          backgroundColor: Colors.red,
          ));
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The account already exists for that email.'),
          backgroundColor: Colors.red,
          ));
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


// LOGIN FUNCTION
signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
    User? user = credential.user;
    if (user!=null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successfully'),
          backgroundColor: Colors.lightGreen,
          ));
    } else {
      
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email.'),
          backgroundColor: Colors.red,
          ));
      print('No user found for that email.');
    } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong password provided for that user.'),
          backgroundColor: Colors.red,
          ));
      print('Wrong password provided for that user.');
    }
  }
}

// LOG OUT FUNCTION
signOut (BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
}

// GOOGLE SIGN IN FUNCTION
class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<String?> signInwithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // ignore: use_rethrow_when_possible
      throw e;
    }
    return null;
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
} 