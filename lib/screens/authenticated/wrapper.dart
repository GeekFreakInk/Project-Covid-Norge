import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:Covid_Norge/models/user.dart';
import 'package:Covid_Norge/screens/authentication/sign_in.dart';
import 'home/userProfile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
  
    // check if we have a valid user, return different widget according to that
    // check if we have a valid user (user signed in), return different widget dependant on that
    if (user == null) {
      return SignIn();
    } else {
      return Profile();
    }
    
  }
}