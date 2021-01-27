import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show required;

abstract class LoginEvents {}

class LoginByPassword extends LoginEvents {
  final BuildContext context;
  final String email, password;

  LoginByPassword({@required this.email, @required this.password, @required this.context});
}

class LoginByFacebook extends LoginEvents {}

class LoginByGoogle extends LoginEvents {}
