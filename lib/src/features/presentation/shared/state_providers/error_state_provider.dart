import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:flutter/material.dart';

abstract class ErrorStateProviderDelegate {
  void setFailure({required BuildContext context, required Failure value});
}

class ErrorStateProvider extends ChangeNotifier with ErrorStateProviderDelegate {
  late Failure _failure;

  @override
  void setFailure({required BuildContext context, required Failure value}) {
    _failure = value;
    _showAlert(context: context, message: _failure.toString());

    notifyListeners();
  }

  _showAlert({required BuildContext context, required String message}) async {
    await alertWidget(
      context: context,
      image: const AssetImage("assets/errorIcon.png"),
      title: "Error",
      body: message,
      buttonLabel: "Close",
      onButtonPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
