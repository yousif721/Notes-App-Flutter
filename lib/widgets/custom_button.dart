import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,  this.isLoading = false }) : super(key: key);

  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent,
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child:  Center(
          child: isLoading ? const SizedBox(height: 25,width: 25,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
                :const Text(
              "Add Note",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
            ),),
        ),

      ),
    );
  }
}