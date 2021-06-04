import '../../dtos/contact/contact_dto.dart';

abstract class SessionDataSourceContract {
  Future<ContactDTO?> signInWithGoogle();
}
