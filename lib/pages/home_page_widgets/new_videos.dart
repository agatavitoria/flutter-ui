import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/youtube_video.dart';
import 'package:flutter_ui/widgets/youtube_video_item.dart';

class NewVideos extends StatelessWidget {
  final List<YouTubeVideo> items;

  NewVideos({@required this.items}) : assert(items != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        final YouTubeVideo item = items[index];
        return YouTubeVideoItem(item: item);
      }),
    );
  }
}
