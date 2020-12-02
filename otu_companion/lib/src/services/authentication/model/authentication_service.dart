import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword({String email, String password}) async
  {
    try
    {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseAuthException catch(e)
    {
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword({String email, String password}) async
  {
    try
    {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseAuthException catch(e)
    {
      return false;
    }
  }

  Future<void> signOut() async
  {
    await _firebaseAuth.signOut();
  }
}