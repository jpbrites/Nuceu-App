import 'package:flutter/material.dart';
import 'package:nuceu/models/channel_model.dart';
import 'package:nuceu/models/video_model.dart';
import 'package:nuceu/themes/themes.dart';
import 'package:nuceu/services/api_service.dart';
import 'package:nuceu/view/widgets/navigation_drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  Channel? _channel;
  bool _isLoading = false;
  List<bool> listClicked = <bool>[];
  //bool clicked = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCKHhA5hN2UohhFDfNXB_cvQ');
    setState(() {
      _channel = channel;
    });
  }

  _buildVideo(
      {required Video video, required bool clicked, Function()? ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title!,
            style: Themes.latoBold(12),
          ),
          const SizedBox(height: 10.0),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: !clicked
                ? GestureDetector(
                    onTap: ontap,
                    child: Stack(
                      children: [
                        Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: NetworkImage(video.thumbnailUrl!),
                        ),
                        const Center(
                            child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 60,
                        ))
                      ],
                    ),
                  )
                : YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: video.id!,
                      flags: const YoutubePlayerFlags(
                        mute: false,
                        autoPlay: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
          ),
        ],
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video>? allVideos = _channel!.videos!..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Se Liga!',
          style: Themes.latoLight(20),
        ),
      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos!.length !=
                        int.parse(_channel!.videoCount!) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  listClicked.add(false);
                  if (index == 0) {
                    return const SizedBox(
                      height: 1,
                    );
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(
                    clicked: listClicked[index],
                    video: video,
                    ontap: () {
                      setState(() {
                        listClicked[index] = !listClicked[index];
                      });
                    },
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }
}

 /*onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlayVideoScreen(
                  id: video.id,
                  title: video.title!,
                ),
              ),
            ),*/