import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/add_note_cubit.dart';

import '../constant.dart';


class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelect, required this.color}) : super(key: key);

  final bool isSelect;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelect ?    CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
      ),
      )
      :  CircleAvatar(
      radius: 40,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex=0;

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
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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