import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class custom_text_form_field extends StatelessWidget {

  var validator;
  var controller;
  var keyboardType;
  var onchange;
  Icon? suffixIcon;
  Icon? prefixIcon;
  bool? enableed;
  String? hint;
  bool? phone = false;
  custom_text_form_field(
      {this.validator,
        this.enableed,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.keyboardType,
      this.onchange,
      this.hint,
      this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (phone == true)
          ? EdgeInsetsDirectional.only(top: 15)
          : EdgeInsetsDirectional.only(top: 15, bottom: 10),
      child: TextFormField(

        maxLength: (phone == true) ? 11 : null,
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onchange,
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        controller: controller,
        decoration: InputDecoration(
          enabled: enableed==null?true:enableed!,
          fillColor: Color(0xff1f1f21),
          hintText: hint,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(color: Colors.transparent),
          contentPadding: const EdgeInsets.all(20),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
        ),
      ),
    );
  }
}
