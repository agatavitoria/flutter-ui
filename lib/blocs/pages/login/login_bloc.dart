import 'package:flutter/widgets.dart';
import 'package:flutter_ui/api/account_api.dart';
import 'package:flutter_ui/pages/home-page.dart';
import 'package:flutter_ui/utils/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_events.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  AccountAPI _accountAPI = new AccountAPI();

  @override
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginByPassword) {
      yield* _submitByPassword(event);
    } else if (event is LoginByGoogle) {
    } else if (event is LoginByFacebook) {}
  }

  Stream<LoginState> _submitByPassword(LoginByPassword event) async* {
    yield this.state.copyWith(fetching: true);

    bool isOk = await _accountAPI.login(event.email, event.password);
    if (isOk) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("wasLogin", true);
      Navigator.pushReplacementNamed(event.context, HomePage.routeName);
    } else {
      final intents = this.state.intents + 1;
      yield this.state.copyWith(fetching: false, intents: intents == 3 ? 0 : intents);
      await Dialogs.alert(
        event.context,
        title: 'ERROR',
        body: intents == 3
            ? 'Será enviado um alerta ao email ${event.email}'
            : 'E-mail ou senha incorretos!',
        okText: 'Ok!',
      );
    }
  }
}
