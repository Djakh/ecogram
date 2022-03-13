
import 'package:ecogram/repositories.dart/repo_set/exception.dart';

class AjaxState {
  bool fetching = false;
  Exception exception;

  AjaxState({
    this.fetching = false,
    this.exception,
  });

  bool get isRepositoryException => exception is RepositoryException;

  RepositoryException get repositoryException =>
      exception as RepositoryException;

  bool get hasException => exception != null;

  bool hasError(String key) {
    return isRepositoryException && repositoryException.errors.containsKey(key);
  }

  String getError(String key) {
    return repositoryException.errors[key][0];
  }
}
