import 'package:chattingapp/common/common.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
 
  /// Returns the Identity JWT
  Future<String>? getIdToken({bool forceRefresh = false}) {
    return _firebaseAuth.currentUser?.getIdToken(forceRefresh);
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> createNewUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser!.updateDisplayName(name);
      await _firebaseAuth.currentUser!.updatePhotoURL(
          'https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png');

      await getIdToken(forceRefresh: true);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> signInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      //Begin interacting sign in process
      final googleUser = await googleSignIn.signIn();

      //Check if user accepted the sign in process
      if (googleUser == null) {
        throw const LogInWithGoogleFailure(
          'Google Sign In has been'
          'cancelled by the user',
        );
      }

      //Obtain auth details from user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //create a new credential for user
      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        GoogleSignIn.standard().signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
