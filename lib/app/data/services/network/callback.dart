import 'package:project_counselling/app/data/enums/failstate.dart';

abstract class ApiResponse<T> {
  void onSuccess(T response);
  void onFailure(String errorMessage, String? responseData, {FailedState failAPIState = FailedState.NONE});
}

class ApiCallback<T> implements ApiResponse<T> {
  final Function(T) onSuccessCallback;
  final Function(String, String?, {FailedState? failAPIState}) onFailureCallback;

  ApiCallback({
    required this.onSuccessCallback,
    required this.onFailureCallback,
  });

  @override
  void onSuccess(T response) {
    onSuccessCallback(response);
  }

  @override
  void onFailure(String errorMessage, String? responseData, {FailedState failAPIState = FailedState.NONE}) {
    onFailureCallback(errorMessage, responseData, failAPIState: failAPIState);
  }
}