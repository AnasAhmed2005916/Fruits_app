import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} state changed: ${change.currentState}');
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    super.onTransition(bloc, transition);
    print(
      '${bloc.runtimeType} state: ${transition.currentState} -> ${transition.nextState}',
    );
  }
}
