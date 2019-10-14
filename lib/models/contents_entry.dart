import 'package:firebase_database/firebase_database.dart';

// contents entry
class ContentsEntry {
  String id, title, description, teacherId, updateDate;

  ContentsEntry(
      this.title,
      this.description,
      this.teacherId,
      this.updateDate
      );

  ContentsEntry.fromSnapShot(DataSnapshot snapshot):
        id = snapshot.key,
        title = snapshot.value["title"],
        description = snapshot.value["description"],
        teacherId = snapshot.value["teacher"],
        updateDate = snapshot.value["update"];

  toJson() {
    return {
      "title": title,
      "description": description,
      "description": description,
      "teacherId": teacherId,
      "update": updateDate,
    };
  }
}