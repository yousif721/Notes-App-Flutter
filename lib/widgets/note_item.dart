import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';

import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:(context){
              return  EditNoteView(note:note);
            })
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:   Text( note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle:   Padding(
                  padding: const EdgeInsets.only(top :16.0, bottom: 10),
                  child: Text( note.content,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,

                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: (){
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(note.date,
                  style:const TextStyle(
                    color:Colors.black38,
                  ),

                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
