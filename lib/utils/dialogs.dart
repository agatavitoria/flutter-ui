import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> alert(BuildContext context,
      {String title, String body, String okText = 'Aceitar'}) async {
    final Completer<void> c = Completer();
    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: body != null ? Text(body) : null,
          actions: [
            CupertinoDialogAction(
              child: Text(okText),
              onPressed: () {
                Navigator.pop(context);
                c.complete();
              },
            ),
          ],
        );
      },
    );

    return c.future;
  }

  static Future<bool> confirm(
    BuildContext context, {
    String title,
    String body,
    String confirmText = 'Aceitar',
    String cancelText = 'Cancelar',
  }) {
    final Completer<bool> c = Completer();

    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            child: CupertinoActionSheet(
              title: title != null
                  ? Text(
                      title,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  : null,
              message: body != null
                  ? Text(
                      body,
                      style: TextStyle(fontSize: 16),
                    )
                  : null,
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    c.complete(true);
                  },
                  child: Text(
                    confirmText,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  c.complete(false);
                },
                child: Text(
                  cancelText,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        });

    // showDialog(
    //   context: context,
    //   barrierDismissible: false, //bloquei clique fora do alert
    //   builder: (_) {
    //     return AlertDialog(
    //       title: title != null ? Text(title) : null,
    //       content: body != null ? Text(body) : null,
    //       actions: [
    //         FlatButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //             c.complete(true);
    //           },
    //           child: Text(
    //             confirmText,
    //             style: TextStyle(
    //               fontSize: 17,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //         ),
    //         FlatButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //             c.complete(false);
    //           },
    //           child: Text(
    //             cancelText,
    //             style: TextStyle(
    //               color: Colors.red,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );

    return c.future;
  }

  static void input(BuildContext context, {String label, String placeholder, @required void Function(String) onOk}) {
    String text = '';    

    showCupertinoDialog(context: context, builder: (_) {
      return CupertinoAlertDialog(
        title: label != null ? Text(label) : null,
        content: CupertinoTextField(
          onChanged: (String _text) {
            text = _text;
          },
          placeholder: placeholder,
        ),
        actions: [
          CupertinoButton(
            child: Text('Aceitar'), 
            onPressed: () {
              Navigator.pop(context);
              onOk(text);
            },
          ),
        ],
      );
    });
  }

  static void inputEmail(BuildContext context, {String label, String placeholder, @required void Function(String) onOk}) {
    showCupertinoDialog(context: context, builder: (_) {
      return CupertinoAlertDialog(
        title: label != null ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(label),
        ) : null,
        content: InputEmail(
          placeholder: placeholder,
          onOk: (text) {
            if (onOk != null) {
              onOk(text);
            }
          },
        ),
      );
    });
  }
}


class InputEmail extends StatefulWidget {
  final String placeholder;
  final void Function(String) onOk;

  const InputEmail({Key key, this.placeholder, @required this.onOk}) : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  String _email = '';

  bool _validate() {
    return _email.contains("@");
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _validate();

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTextField(
            placeholder: widget.placeholder,
            onChanged: (texto) {
              _email = texto;
              _validate();
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: FlatButton(
                  onPressed: () => Navigator.pop(context), 
                  child: Text('Cancelar', style: TextStyle(color: Colors.red)),
                ),
              ),
              Expanded(
                  child: FlatButton(
                  onPressed: isValid ? () {
                    Navigator.pop(context);
                    widget.onOk(_email);
                  } : null, 
                  child: Text('Aceitar', style: TextStyle(color: isValid? Colors.blue : Colors.black45)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}