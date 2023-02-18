import 'package:delivery_app/src/features/presentation/shared/state_providers/error_state_provider.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:flutter/material.dart';
import 'loading_view.dart';

class BaseView {
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

abstract class BaseViewModel {
  void initState({required LoadingStateProvider loadingState});
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
}
