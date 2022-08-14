part of 'snackbar_cubit.dart';

class SnackbarState extends Equatable {
  final String snackbarText;
  final bool showSnackbar;
  const SnackbarState({
    required this.snackbarText,
    required this.showSnackbar,
  });

  factory SnackbarState.initial() {
    return const SnackbarState(snackbarText: '', showSnackbar: false);
  }

  @override
  List<Object> get props => [snackbarText, showSnackbar];

  @override
  String toString() =>
      'SnackBarState(snackbarText: $snackbarText, showSnackbar: $showSnackbar)';

  SnackbarState copyWith({
    String? snackbarText,
    bool? showSnackbar,
  }) {
    return SnackbarState(
      snackbarText: snackbarText ?? this.snackbarText,
      showSnackbar: showSnackbar ?? this.showSnackbar,
    );
  }
}
