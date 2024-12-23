// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// import '../models/useer_model.dart';



// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   // Get current user
//   User? get currentUser => _auth.currentUser;

//   // Sign up with email and password
//   Future<UserModel?> signUpWithEmailAndPassword({
//     required String email,
//     required String password,
//     required String name,
//     File? profileImage,
//   }) async {
//     try {
//       // Create user with email and password
//       final UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);

//       String? profileImageUrl;

//       // Upload profile image if provided
//       if (profileImage != null) {
//         profileImageUrl = await _uploadProfileImage(
//           userId: userCredential.user!.uid,
//           imageFile: profileImage,
//         );
//       }

//       // Create user model
//       final UserModel newUser = UserModel(
//         name: name,
//         email: email,
//         userId: userCredential.user!.uid,
//         profileImageUrl: profileImageUrl,
//       );

//       // Store user data in Firestore
//       await _storeUserData(userCredential.user!.uid, newUser);

//       return newUser;
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception('An unexpected error occurred: $e');
//     }
//   }

//   // Store user data in Firestore
//   Future<void> _storeUserData(String userId, UserModel user) async {
//     try {
//       await _firestore.collection('users').doc(userId).set({
//         ...user.toJson(),
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       throw Exception('Failed to store user data: $e');
//     }
//   }

//   // Upload profile image to Firebase Storage
//   Future<String> _uploadProfileImage({
//     required String userId,
//     required File imageFile,
//   }) async {
//     try {
//       final Reference storageRef =
//           _storage.ref().child('profile_images/$userId');
//       final UploadTask uploadTask = storageRef.putFile(imageFile);
//       final TaskSnapshot snapshot = await uploadTask;
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       throw Exception('Failed to upload profile image: $e');
//     }
//   }

//   // Handle Firebase Auth exceptions
//   String _handleAuthException(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'weak-password':
//         return 'The password provided is too weak.';
//       case 'email-already-in-use':
//         return 'An account already exists for this email.';
//       case 'invalid-email':
//         return 'The email address is not valid.';
//       default:
//         return 'Authentication error: ${e.message}';
//     }
//   }

//   // Sign in with email and password
//   Future<UserModel?> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final UserCredential userCredential = await _auth
//           .signInWithEmailAndPassword(email: email, password: password);

//       // Fetch user data from Firestore
//       final DocumentSnapshot userDoc = await _firestore
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .get();

//       if (userDoc.exists) {
//         return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
//       }
//       return null;
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception('An unexpected error occurred: $e');
//     }
//   }

//   // Sign out
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       throw Exception('Failed to sign out: $e');
//     }
//   }

//   // Reset password
//   Future<void> resetPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception('Failed to send password reset email: $e');
//     }
//   }

//   // Get user profile data
//   Future<UserModel?> getUserProfile(String userId) async {
//     try {
//       final DocumentSnapshot userDoc =
//           await _firestore.collection('users').doc(userId).get();

//       if (userDoc.exists) {
//         return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
//       }
//       return null;
//     } catch (e) {
//       throw Exception('Failed to fetch user profile: $e');
//     }
//   }
// }
