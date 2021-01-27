import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/widgets/login_text_form_field.dart';
import 'package:flutter_ui/widgets/my_btn.dart';
import '../blocs/pages/login/bloc.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc = new LoginBloc();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '', _senha = '';

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains('@')) {
      _email = email;
      return null;
    }
    return 'Email invalido';
  }

  String _validateSenha(String senha) {
    if (senha.isNotEmpty && senha.length > 4) {
      _senha = senha;
      return null;
    }
    return 'Senha invalida';
  }

  _submit() async {
    final bool ehValido = _formKey.currentState.validate();
    if (ehValido) {
      _loginBloc.add(LoginByPassword(context: context, email: _email, password: _senha));
    }
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height - padding.top - padding.bottom,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 60, bottom: 10),
                              child: Image.network(
                                'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
                                width: 280,
                                color: Color(0xff0D47A1),
                              ),
                            ),
                            Text(
                              'Flutter UI & UX',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 330, minHeight: 200),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                LoginTextFormField(
                                  iconData: Icons.email_outlined,
                                  validator: _validateEmail,
                                  hintText: 'exemplo@gmail.com',
                                  labelText: 'E-mail',
                                  initialValue: 'eve.holt@reqres.in',
                                ),
                                SizedBox(height: 20),
                                LoginTextFormField(
                                  iconData: Icons.lock_outlined,
                                  validator: _validateSenha,
                                  hintText: '*********',
                                  labelText: 'Senha',
                                  initialValue: 'cityslicka',
                                  obscureText: true,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Esqueci minha senha',
                                          style: TextStyle(
                                              color: Color(0xff0D47A1)),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xff0D47A1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                MyBtn(
                                  fullWidth: true,
                                  label: 'ENTRAR',
                                  onPressed: _submit,
                                  backgroundColor: Color(0xff304FFE),
                                  textColor: Colors.white,
                                ),
                                SizedBox(height: 35),
                                Text('Iniciar com'),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyBtn(
                                        fullWidth: true,
                                        label: 'FACEBOOK',
                                        onPressed: () {},
                                        backgroundColor: Color(0xff0D47A1),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: MyBtn(
                                        fullWidth: true,
                                        label: 'GOOGLE',
                                        onPressed: () {},
                                        backgroundColor: Color(0xffF50057),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (_, state) {
                  if (state.fetching) {
                    return Positioned.fill(
                      child: Container(
                        color: Colors.white70,
                        child: Center(
                          child: CupertinoActivityIndicator(radius: 15),
                        ),
                      ),
                    );
                  } 
                  return Container();
                },
                condition: (prevState, newState) => prevState.fetching != newState.fetching,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
