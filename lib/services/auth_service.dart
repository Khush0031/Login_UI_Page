
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
//  Google Sign In
   signInWithGoogle()async{
//  begin interactive sign in process
final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//obtain auth detailfrom google
 final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//create new credential for user
// ignore: non_constant_identifier_names
final Credential = GoogleAuthProvider.credential(
      accessToken:gAuth.accessToken,
  idToken: gAuth.idToken,
);

// finally Let's Sign In

return await FirebaseAuth.instance.signInWithCredential(Credential);
}
}