import 'package:flutter/material.dart';

import '../widgets/search_note_body.dart';

class SearchNote extends StatelessWidget {
  const SearchNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 4),
        child: SearchNoteBody(),
      ),
    );
  }
}