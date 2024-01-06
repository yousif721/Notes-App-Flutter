import 'package:flutter/material.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
    const NotesView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return  Scaffold (
          floatingActionButton:FloatingActionButton(
            onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ) ,
                  context: context,
                  builder: (context){
                    return  const AddNoteBottomSheet();
                  });
              },
              backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.add)
          ),
          body: const NotesViewBody(),
        );

    }
  }




