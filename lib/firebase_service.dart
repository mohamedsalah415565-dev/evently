import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore: (snapshot, _) =>
                EventModel.fromJson(snapshot.data()!),
            toFirestore: (event, _) => event.toJson(),
          );

  static CollectionReference<UserModel> getUserCollection() => FirebaseFirestore
      .instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  static Future<void> createEvent(EventModel event) async {
    final eventsCollection = getEventsCollection();
    final doc = eventsCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getEvents() async {
    final eventsCollection = getEventsCollection();
    final querySnapshot = await eventsCollection.orderBy('timestamp').get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Stream<List<EventModel>> streamEvents() {
    final eventsCollection = getEventsCollection();
    return eventsCollection
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  static Future<UserModel> register(
    String name,
    String email,
    String password,
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final user = credential.user!;
    final newUser = UserModel(id: user.uid, name: name, email: email);

    await getUserCollection().doc(user.uid).set(newUser);

    return newUser;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // Sign in existing user
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user!;

    // Fetch user data from Firestore
    final doc = await getUserCollection().doc(user.uid).get();
    if (!doc.exists) {
      throw Exception("User not found in database");
    }

    return doc.data()!;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
