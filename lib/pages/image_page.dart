import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';

class ImagePageArgs {
  final String username;
  final bool isActive;

  ImagePageArgs({@required this.username, @required this.isActive});
}

class ImagePage extends StatefulWidget {
  static String routeName = 'images';

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final ImagePageArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
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
              ),
              Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 1000,
                    itemBuilder: (_, index) {
                      return Container(
                        color: Colors.black12,
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                      );
                    },
                  ),
                  //-------- quando trabalha com menos elementos
                  // child: GridView.count(
                  //   crossAxisCount: 3,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10,
                  //   children: List.generate(50, (index) {
                  //     return Container(
                  //       color: Colors.black12,
                  //       alignment: Alignment.center,
                  //       child: Text("${index+1}"),
                  //     );
                  //   }),
                  // ),
                  // ----------- IMAGENS
                  //   Center(
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         width: 300,
                  //         height: 300,
                  //         color: Colors.blue,
                  //         child: CachedNetworkImage(
                  //           imageUrl: 'https://image.freepik.com/vetores-gratis/modelo-realista-de-carnaval-brasileiro_52683-54251.jpg',
                  //           fit: BoxFit.cover,
                  //           placeholder: (_, __) {
                  //             return Center(
                  //               child: CupertinoActivityIndicator(
                  //                 radius: 15,
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //       Positioned(
                  //         top: 140,
                  //         right: 20,
                  //         child: Text('OLA MUNDO', style: TextStyle(fontSize: 20, color: Colors.white),),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
