

import 'package:ecogram/bloc/base/ajax.dart';

class SimpleGetState<T> extends AjaxState {
  T data;
  Map<String, dynamic> params;

  SimpleGetState({
    this.data,
    this.params,
    bool fetching = false,
    Exception exception,
  }) : super(fetching: fetching, exception: exception);

  void reset() {
    this.data = null;
    this.exception = null;
    this.fetching = false;
  }
}
