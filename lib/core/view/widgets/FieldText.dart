import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../palette.dart';

class Fieldtext extends StatelessWidget {
  final bool obsec;
  final String hint;
  final Widget? inp;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  Fieldtext(
      {this.obsec = true,
      this.hint = '',
      this.inp,
      this.onSave,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: TextFormField(
            onSaved: onSave,
            validator: validator,
            obscureText: obsec,
            decoration: InputDecoration(
              suffixIcon: inp,
              // IconButton(
              //   icon: Icon(Icons.visibility_off, color: kTextFieldHintTextColor),
              //   onPressed: () {},
              // ),
              hintText: hint,
              hintStyle: TextStyle(
                  color: kTextFieldHintTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                  color: kTextFieldsBorderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                  color: kBlue,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(20.28, 25, 10, 24),
            ),
            cursorColor: kBlue,
          ),
        ),
      ],
    );
  }
}
