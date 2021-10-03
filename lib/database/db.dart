import 'dart:async';
import '../class/job_class.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fb;

class DBFirebase {
  DBFirebase();

  Future<fb.Firestore> initializeFirebase() async {
    initializeApp(
      apiKey: "AIzaSyCcOafjJuf-mM3EnU1bjQ8EO4eeCFvqwwU",
      authDomain: "prueba-4c14e.firebaseapp.com",
      databaseURL: "https://prueba-4c14e-default-rtdb.firebaseio.com",
      projectId: "prueba-4c14e",
      storageBucket: "prueba-4c14e.appspot.com",
      appId: "1:110198186312:web:580f3e1a9033570837137d",
    );

    fb.Firestore store = firestore();

    return store;
  }

  Future<List<Job>> get(String table) async {
    fb.Firestore store = firestore();
    fb.CollectionReference ref = store.collection(table);

    List<Job> l = [];

    final r = await ref.get();
    for (var i = 0; i < r.size; i++) {
      final aux = Job(
        r.docs[i].id,
        r.docs[i].data()["company"],
        r.docs[i].data()["type"],
        r.docs[i].data()["position"],
        r.docs[i].data()["ubication"],
        r.docs[i].data()["category"],
        r.docs[i].data()["description"],
        r.docs[i].data()["email"],
      );
      l.add(aux);
    }
    return l;
  }

  set(
    String table,
    String id,
    String company,
    String type,
    String position,
    String ubication,
    String category,
    String description,
    String email,
  ) {
    fb.Firestore store = firestore();
    fb.CollectionReference ref = store.collection(table);
    ref.doc().set({
      "company": company,
      "type": type,
      "position": position,
      "ubication": ubication,
      "category": category,
      "description": description,
      "email": email,
    });
  }

  update(
    String table,
    String id,
    String company,
    String type,
    String position,
    String ubication,
    String category,
    String description,
    String email,
  ) {
    fb.Firestore store = firestore();
    fb.CollectionReference ref = store.collection(table);
    ref.doc(id).set({
      "company": company,
      "type": type,
      "position": position,
      "ubication": ubication,
      "category": category,
      "description": description,
      "email": email,
    });
  }

  delete(
    String table,
    String id,
  ) {
    fb.Firestore store = firestore();
    fb.CollectionReference ref = store.collection(table);
    ref.doc(id).delete();
  }

  deleteAll(
    String table,
  ) async {
    fb.Firestore store = firestore();
    fb.CollectionReference ref = store.collection(table);

    final r = await ref.get();
    for (var i = 0; i < r.size; i++) {
      ref.doc(r.docs[i].id).delete();
    }
  }
}
