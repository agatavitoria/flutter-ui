import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/youtube_video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class YouTubeVideoItem extends StatelessWidget {
  final YouTubeVideo item;

  YouTubeVideoItem({@required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        FlutterYoutube.playYoutubeVideoByUrl(
          apiKey: "your api key",
          videoUrl: "https://www.youtube.com/watch?v=${item.videoId}",
          autoPlay: true,
          fullScreen: true,
        );
      },
      padding: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 12 / 3,
        child: Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: item.banner,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Text(
                          item.description,
                          style: TextStyle(fontWeight: FontWeight.w300),
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
