import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';


class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {

  late int currentIndex;
  @override
  // to take initial value of the note color
  void initState(){
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2, // 35*2 because of the circle avatar radius
      child: ListView.builder(
        itemCount :kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return  Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 5.0),
            child:  GestureDetector(
              onTap: (){
                currentIndex = index;
                widget.note.color =kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isSelect: currentIndex == index,
              ),
            ),
          );
        },

      ),
    );
  }
}
