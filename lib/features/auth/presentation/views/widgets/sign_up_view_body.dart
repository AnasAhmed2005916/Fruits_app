import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/widgets/custom_button.dart';
import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:firebase_course/core/widgets/password_field.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/have_account.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/terms_and_coditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 25),
              TermsAndCoditions(),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignUpCubit>().createUserWithEmailAndPassword(
                      email,
                      password,
                      userName,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'انشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              const HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
