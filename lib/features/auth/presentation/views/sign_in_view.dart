import 'package:firebase_course/core/services/get_it_service.dart';
import 'package:firebase_course/core/widgets/custom_app_bar.dart';
import 'package:firebase_course/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_in_cubit/sign_in_state.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'signIn';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'تسجيل دخول'),
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {}

            if (state is SignInFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is SignInLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const SigninViewBody();
          },
        ),
      ),
    );
  }
}
