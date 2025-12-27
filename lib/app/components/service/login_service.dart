import 'dart:ui';

import 'package:fill_store_bb/app/components/domain/local/local_data_source.dart';
import 'package:fill_store_bb/app/components/domain/remote/remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRemoteDatasourceImpl remoteDatasource = UserRemoteDatasourceImpl();
  final UserLocalDatasourceImpl localDatasource = UserLocalDatasourceImpl();

  Future<void> loginUser({
    required String emailOrUsername,
    required String password,
    required void Function(String error) onError,
    required VoidCallback onSuccess,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: emailOrUsername,
        password: password,
      );

      final userId = credential.user!.uid;

      final user = await remoteDatasource.currentUser(userId);

      await localDatasource.create(user);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError("Kullanıcı bulunamadı.");
      } else if (e.code == 'wrong-password') {
        onError("Şifre hatalı.");
      } else {
        onError("Hata: ${e.message}");
      }
    } catch (e) {
      onError("Hata oluştu: $e");
    }
  }
}
