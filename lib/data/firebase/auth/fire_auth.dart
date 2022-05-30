import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  static User get user {
    if (FirebaseAuth.instance.currentUser == null) {
      throw "User not found.";
    }
    return FirebaseAuth.instance.currentUser!;
  }

  static Future<User?> createAccount(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw 'User not found.';
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }

  static Future<User> signInUser(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw ('User not found.');
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      }
      throw "Authentication failed.";
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static String get userName {
    if (user.displayName == null) {
      throw "User name not available.";
    }
    return user.displayName!;
  }

  static String get userEmail {
    if (user.email == null) {
      throw "User email not available.";
    }
    return user.email!;
  }

  static String get userImage {
    if (user.email == null) {
      throw "User profile picture not available.";
    }
    return user.photoURL!;
  }

  static Future updateUserName({required String name}) async {
    try {
      await user.updateDisplayName(name);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future updateUserImage({required String image}) async {
    try {
      await user.updatePhotoURL(image);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      e.toString();
    }
  }

  static Future changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await signInUser(email: userEmail, password: currentPassword);
      await user.updatePassword(newPassword);
    } catch (e) {
      e.toString();
    }
  }
}
