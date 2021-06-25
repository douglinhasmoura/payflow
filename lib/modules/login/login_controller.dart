import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSign(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response.displayName.toString(),
        photoUrl: response.photoUrl
      );

      authController.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
