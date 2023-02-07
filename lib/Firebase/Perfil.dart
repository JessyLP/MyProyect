import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil {
  final String? name;
  final int? age;
  final List<DocumentReference>? rooms;
  final String uid;


  Perfil({
    this.name="",
    this.age=0,
    this.rooms = const[],
    this.uid=""
  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
        name: data?['name'],
        age: data?['age'],
        rooms: data?['rooms'] is Iterable ? List.from(data?['rooms']) : null,
        uid: snapshot.id

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != 0) "age": age,
      if (rooms!.isNotEmpty) "rooms": rooms,

    };
  }
}