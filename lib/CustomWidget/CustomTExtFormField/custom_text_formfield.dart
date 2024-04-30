

import 'package:flutter/material.dart';




class CustomTextFormFieldd extends StatefulWidget {
  CustomTextFormFieldd({super.key,
    required this.maxline,
    required this.height,
    required this.hintext,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.onChanged,
    this.suffix,


  });

  String ?  hintext;
  int ? maxline;
  double ?height;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  late bool obscureText;
  Widget? suffix;
  TextInputType? keyboardType;
  @override
  State<CustomTextFormFieldd> createState() => _CustomTextFormFielddState();
}


class _CustomTextFormFielddState extends State<CustomTextFormFieldd> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      child: TextFormField(
        keyboardType:widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter  numbers only";
          } else {
            return null;
          }
        },
        // final TextEditingController? controller;
        controller: widget.controller,
        maxLines: widget.maxline,
        decoration: InputDecoration(
            suffixIcon: widget.suffix,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color:Colors.grey,
                width: 2.0,
              ),
            ),
            hintText: "${widget.hintext}",
            errorStyle: TextStyle(
              fontSize: 0.1,
            ),
            contentPadding: EdgeInsets.only(left: 10,right: 0,top: 0,bottom: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            )
        ),
      ),
    );
  }
}