import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../notes_cubit/notes_cubit.dart';
import '../views/search_note.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';


class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override

  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric( vertical : 15,horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height:30),
           CustomAppBar(title:  'Notes',
             icon: Icons.search,
             onPressed: (){
             Navigator.push(context,MaterialPageRoute(
                   builder:(context) {
                     return const SearchNote();
                   },
             ),
             );
             },
           ),
           const Expanded(
               child: NotesListView()),
        ],
      ),
    );
  }
}

