import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/api/account_api.dart';
import 'package:flutter_ui/api/youtube_api.dart';
import 'package:flutter_ui/models/play_list.dart';
import 'package:flutter_ui/models/youtube_video.dart';
import 'package:flutter_ui/pages/home_page_widgets/home_tab_shimmer.dart';
import 'package:flutter_ui/pages/home_page_widgets/new_videos.dart';
import 'package:flutter_ui/pages/home_page_widgets/top_play_lists.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  AccountAPI _accountAPI = AccountAPI();
  YouTubeAPI _youTubeAPI =
      new YouTubeAPI(apiKey: "your api key");
  List<dynamic> _users = [];
  List<PlayList> _playLists = [];
  final List<YouTubeVideo> _newVideos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final users = await _accountAPI.getUsers(1);
    final List<PlayList> playLists = await _youTubeAPI.getPlayLists("UCwXdFgeE9KYzlDdR7TG9cMw");
    final List<YouTubeVideo> newVideos = await _youTubeAPI.getNewVideos("UCwXdFgeE9KYzlDdR7TG9cMw");
    setState(() {
      _users.addAll(users);
      _playLists.addAll(playLists);
      _newVideos.addAll(newVideos);
      _isLoading = false;
    });
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          height: 110,
          child: ListView.builder(
            itemBuilder: (_, index) {
              final dynamic item = _users[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 80),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: item['avatar'],
                            placeholder: (_, __) => CupertinoActivityIndicator(
                              radius: 15,
                            ),
                          ),
                        ),
                      ),
                      Text(item['first_name'])
                    ],
                  ),
                ),
              );
            },
            itemCount: _users.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        TopPlayLists(items: _playLists),
        SizedBox(height: 10),
        NewVideos(items: _newVideos),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _isLoading ? HomeTabShimmer() : _body(),
      ],
    );
  }
}
