import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:firebase_course/core/widgets/custom_button.dart';
import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:firebase_course/core/widgets/password_field.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),

              CustomTextFormField(
                hintText: 'البريد الالكترونى',
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email),
                onSaved: (value) {
                  email = value!;
                },
              ),

              const SizedBox(height: 16),

              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'نسيت كلمة المرور ؟',
                  style: AppTextStyles.font14Bold.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 33),

              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<SignInCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  }
                },
                text: 'تسجيل دخول',
              ),

              const SizedBox(height: 33),

              const DontHaveAccount(),

              const SizedBox(height: 35),

              OrDivider(),

              const SizedBox(height: 30),

              SocialLoginButton(
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 25,
                ),
              ),

              const SizedBox(height: 16),

              SocialLoginButton(
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                  size: 25,
                ),
              ),

              const SizedBox(height: 16),

              SocialLoginButton(
                title: 'تسجيل بواسطة ابل',
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
