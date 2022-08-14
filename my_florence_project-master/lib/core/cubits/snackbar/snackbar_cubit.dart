import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'snackbar_state.dart';

class SnackbarCubit extends Cubit<SnackbarState> {
  SnackbarCubit() : super(SnackbarState.initial());

  void showSnackbar(String input) {
    emit(state.copyWith(snackbarText: input, showSnackbar: true));
    emit(state.copyWith(showSnackbar: false));
  }
}
