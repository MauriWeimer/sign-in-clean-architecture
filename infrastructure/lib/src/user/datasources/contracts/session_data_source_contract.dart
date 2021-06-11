import '../../dtos/contact/contact_dto.dart';

abstract class SessionDataSourceContract {
  Future<void> signUp(String email, String password);
  Future<ContactDTO?> signIn(String email, String password);
  Future<ContactDTO?> signInWithGoogle();
}
