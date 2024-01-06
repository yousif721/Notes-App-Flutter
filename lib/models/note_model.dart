import 'package:hive/hive.dart';
part 'note_model.g.dart'; //.g generate

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}

//  NoteModel({
   // required this.title,
   // required this.content,
   // required this.date,
  //  required this.color,
 // });
//}
