import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAuthcode {
  // ignore: non_constant_identifier_names
  Signinwithgoogle() async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleauth =
        await googleuser?.authentication;
    GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
  }
}
