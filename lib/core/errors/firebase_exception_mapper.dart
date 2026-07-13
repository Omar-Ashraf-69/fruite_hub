class FirebaseExceptionMapper {
  const FirebaseExceptionMapper._();

  static String mapAuthException(String code) {
    switch (code) {
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';

      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

      case 'user-disabled':
        return 'تم تعطيل هذا الحساب.';

      case 'user-not-found':
        return 'لا يوجد حساب بهذا البريد الإلكتروني.';

      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';

      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مستخدم بالفعل.';

      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً.';

      case 'network-request-failed':
        return 'يرجى التحقق من اتصالك بالإنترنت.';

      case 'too-many-requests':
        return 'تمت المحاولة عدة مرات. يرجى المحاولة لاحقاً.';

      case 'operation-not-allowed':
        return 'هذه العملية غير متاحة حالياً.';

      case 'requires-recent-login':
        return 'يرجى تسجيل الدخول مرة أخرى ثم إعادة المحاولة.';

      default:
        return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
    }
  }

  static String mapFirestoreException(String code) {
    switch (code) {
      case 'permission-denied':
        return 'ليس لديك صلاحية لتنفيذ هذه العملية.';

      case 'not-found':
        return 'البيانات المطلوبة غير موجودة.';

      case 'already-exists':
        return 'البيانات موجودة بالفعل.';

      case 'unavailable':
        return 'الخدمة غير متاحة حالياً.';

      case 'deadline-exceeded':
        return 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.';

      case 'cancelled':
        return 'تم إلغاء العملية.';

      case 'resource-exhausted':
        return 'تم تجاوز الحد المسموح به.';

      default:
        return 'حدث خطأ أثناء التعامل مع قاعدة البيانات.';
    }
  }

  static String mapStorageException(String code) {
    switch (code) {
      case 'object-not-found':
        return 'الملف غير موجود.';

      case 'unauthorized':
        return 'ليس لديك صلاحية للوصول إلى هذا الملف.';

      case 'canceled':
        return 'تم إلغاء العملية.';

      case 'quota-exceeded':
        return 'تم تجاوز الحد المسموح به للتخزين.';

      case 'retry-limit-exceeded':
        return 'فشلت العملية. يرجى المحاولة مرة أخرى.';

      case 'invalid-checksum':
        return 'الملف تالف.';

      default:
        return 'حدث خطأ أثناء رفع أو تنزيل الملف.';
    }
  }
}