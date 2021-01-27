import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/play_list.dart';
import 'package:flutter_ui/widgets/extras.dart';

class TopPlayLists extends StatefulWidget {
  final List<PlayList> items;

  TopPlayLists({@required this.items})
      : assert(items != null && items.length > 0);

  @override
  _TopPlayListsState createState() => _TopPlayListsState();
}

class _TopPlayListsState extends State<TopPlayLists> {
  ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print("build top playlist");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
          child: Text(
            'PARA FLUTTER DEVs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 9 / 5,
          child: Container(
            child: PageView(
              onPageChanged: (page) {
                _currentPage.value = page;
              },
              children: List.generate(widget.items.length, (index) {
                final PlayList item = widget.items[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: item.banner,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Extras.fromNow(item.publishedAt),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'Videos: ${item.itemCount}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (_, int value, w) {
            return Dots(count: widget.items.length, currentPage: value);
          },
        ),
      ],
    );
  }
}

class Dots extends StatelessWidget {
  final int count, currentPage;

  Dots({@required this.count, @required this.currentPage})
      : assert(count != null && count > 0),
        assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          return Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: currentPage == index ? Colors.black : Colors.black12,
              shape: BoxShape.circle
            ),
          );
        }),
      ),
    );
  }
}
