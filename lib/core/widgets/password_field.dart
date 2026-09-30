import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obsecureText: obsecureText,
      onSaved: widget.onSaved,
      hintText: ' كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obsecureText = !obsecureText;
          });
        },
        child: obsecureText
            ? Icon(Icons.remove_red_eye)
            : Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
