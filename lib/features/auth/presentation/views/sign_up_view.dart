import 'package:firebase_course/core/services/get_it_service.dart';
import 'package:firebase_course/core/widgets/custom_app_bar.dart';
import 'package:firebase_course/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'انشاء حساب'),
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                

              },
              builder: (context, state) {
                return const SignUpViewBody();
              },
            );
          },
        ),
      ),
    );
  }
}
