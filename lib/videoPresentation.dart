import 'package:flutter/material.dart';
import 'package:video_url_validator/video_url_validator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPresentation extends StatefulWidget {
  const VideoPresentation({super.key});

  @override
  State<VideoPresentation> createState() => _VideoPresentationState();
}

class _VideoPresentationState extends State<VideoPresentation> {
  late YoutubePlayerController controller;
  late String youtubePath = "https://www.youtube.com/watch?v=_wGENReV6NQ";
  var validator = VideoURLValidator();
  late bool validatorStatus =
      validator.validateYouTubeVideoURL(url: youtubePath);

  @override
  void initState() {
    if (validatorStatus == true) {
      controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(youtubePath)!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('วิดิโอแนะนำตัว'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (validatorStatus == true)
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Color.fromARGB(255, 223, 101, 14),
                        handleColor: Color.fromARGB(255, 223, 101, 14),
                      ),
                    ),
                  ),
                ),
              if (validatorStatus == false) const Text("ไม่ม่มีวิดิโอนี้")
            ],
          ),
        )));
  }
}
