import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  @override
  _YoutubePlayerViewState createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'PKGguGUwSYE',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
