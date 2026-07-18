import 'package:fruit_hub/generated/l10n.dart';

class FirestoreExceptionMapper {
  static String map(String code) {
    switch (code) {
      case 'permission-denied':
        return S.current.permission_denied;

      case 'unavailable':
        return S.current.no_internet_connection_message;

      case 'not-found':
        return S.current.data_not_found;

      case 'cancelled':
        return S.current.operation_cancelled;

      case 'deadline-exceeded':
        return S.current.request_timeout;

      default:
        return S.current.unexpected_error;
    }
  }
}