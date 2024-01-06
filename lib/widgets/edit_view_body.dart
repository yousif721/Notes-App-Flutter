import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import '../models/note_model.dart';
import '../notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

    final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

   String? title , content;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric( vertical : 35,horizontal: 15),
      child: Column(
          children:  [
            CustomAppBar(title: 'Edit Note',
            onPressed: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: Icons.check),

            const SizedBox(height: 20),
            CustomTextField(
              hint: widget.note.title,
              onChanged:(value){
                title =value;
              }
            ),

            const SizedBox(height: 15),
            CustomTextField(
                hint: widget.note.content,
                maxLines: 5,
                onChanged:(value){
                  content =value;
                }
            ),

            const SizedBox(height: 15),
             EditNoteColorsList(note: widget.note),

          ],
      ),
    );
  }
}
