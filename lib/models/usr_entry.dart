import 'package:firebase_database/firebase_database.dart';

// user entry
class UserEntry {
  String id, name, registration;

  UserEntry(
      this.id,
      this.name,
      this.registration
      );

  UserEntry.fromSnapShot(DataSnapshot snapshot):
        id = snapshot.key,
        name = snapshot.value["name"],
        registration = snapshot.value["registration"];

  toJson() {
    return {
      "id": id,
      "name": name,
      "registration": registration
    };
  }
}