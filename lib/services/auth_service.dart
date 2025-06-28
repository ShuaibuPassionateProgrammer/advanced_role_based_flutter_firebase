import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signup ({ required String name, required String email, required String password, required String role }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      );

      await _firestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
          "name": name.trim(),
          "email": email.trim(),
          "role": role.trim()
        });
    }
    catch (e) {
      return e.toString();
    }
  }
}