import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';
import '../utils/fake_list.dart';

class PostPage extends StatefulWidget {
  static final routeName = 'posts';
  
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/860/860790.svg',
                rightIcon: 'https://image.flaticon.com/icons/svg/1370/1370907.svg',
                onLeftClick: () => Navigator.pop(context),
                onRightClick: () {
                  setState(() {
                    _data.add("item ${DateTime.now()}");
                    // _data.insert(_data.length - 1, "item before ${DateTime.now()}");
                  });
                },
              ),
              Expanded(
                // QUANDO FOR TRABALHAR COM LISTAS GRANDES, É INDICADO USAR LISTVIEW.BUILDER
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    final String item = _data[position];
                    return ListTile(
                      leading: Icon(Icons.watch),
                      title: Text(item),
                      subtitle: Text("subtitle"),                      
                      onLongPress: () {
                        setState(() {
                          _data.removeAt(position);
                        });
                      },
                    );
                  },
                  itemCount: _data.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}