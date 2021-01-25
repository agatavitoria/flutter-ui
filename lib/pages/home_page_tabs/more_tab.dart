import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/pages/login_page.dart';
import 'package:flutter_ui/utils/dialogs.dart';
import 'package:flutter_ui/widgets/avatar.dart';
import 'package:flutter_ui/widgets/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  _confirm() async {
    final isOk = await Dialogs.confirm(
      context,
      title: "ATENÇÃO",
      body: 'Tem certeza que deseja sair da sua conta?',
    );

    if (isOk) _logOut();
  }

  _setEmail() {
    Dialogs.inputEmail(
      context,
      label: 'Informe o Email', 
      placeholder: 'example@gmail.com',
      onOk: (String text) {
        print(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              color: Color(0xfff8f8f8),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(size: 150),
                  SizedBox(height: 20),
                  Text('Bem Vindo,'),
                  Text(
                    "Darwin Morocho",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icon/email.svg',
              label: 'Email',
              rightContent: Text('darwin@test.com', style: TextStyle(color: Color(0xffaaaaaa))),
              onPressed: _setEmail,
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icon/security.svg',
              label: 'Configurações de Privacidade',
              rightContent: SvgPicture.asset('assets/icon/right-arrow.svg', width: 20,),
              onPressed: () {},
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icon/bell.svg',
              label: 'Notificações',
              rightContent: Text("ATIVADO", style: TextStyle(color: Color(0xffaaaaaa))),
              onPressed: () {},
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icon/logout.svg',
              label: 'Finalizar Sessão',
              onPressed: _confirm,
            ),
          ],
        ),
      ),
    );
  }
}
