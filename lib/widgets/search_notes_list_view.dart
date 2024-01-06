import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../models/note_model.dart';

class SearchNotesListView extends StatelessWidget {
  const SearchNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          //fetch filtered notes list
          List<NoteModel> filteredNoteList =
          BlocProvider.of<NotesCubit>(context).filteredNoteList!;
          return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredNoteList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: filteredNoteList[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}