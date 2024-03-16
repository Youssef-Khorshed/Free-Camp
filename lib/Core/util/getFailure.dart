import 'constant.dart';
import 'failure.dart';

String getfailure({required Failure failure}) {
  switch (failure.runtimeType) {
    case CashFailure:
      {
        return apifailure;
      }
    case InternetFailure:
      {
        return internetfailure;
      }
    case ApiFailure:
      {
        return apifailure;
      }
    case AuthFailure:
      {
        return apifailure;
      }
    default:
      {
        return unexpectedfailure;
      }
  }
}
