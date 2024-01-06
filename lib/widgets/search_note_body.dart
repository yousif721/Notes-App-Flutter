import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/search_notes_list_view.dart';

class SearchNoteBody extends StatefulWidget {
  const SearchNoteBody({
    super.key,
  });

  @override
  State<SearchNoteBody> createState() => _SearchNoteBodyState();
}

class _SearchNoteBodyState extends State<SearchNoteBody> {
  String? search;

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).filteredNoteList =
        BlocProvider.of<NotesCubit>(context).notes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        //get search word and search it
        CustomTextField(
          hint: "Search",
          onChanged: (value) {
            search = value;
            //if search variable is null send "" String to searchNote method
            BlocProvider.of<NotesCubit>(context).searchNote(search ?? "");
          },
        ),
        //show filtered notes list view
        const SearchNotesListView(),
      ],
    );
  }
}