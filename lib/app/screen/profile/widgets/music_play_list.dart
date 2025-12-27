import 'package:audioplayers/audioplayers.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/square_border_painter.dart';
import 'package:flutter/material.dart';

class MusicPlayList extends StatefulWidget {
  final String musicName;
  final String musicOwn;
  final String musicPath;
  final String musicPhoto;
  final bool isSelected;
  final Function(String) onMusicSelected;

  const MusicPlayList({
    super.key,
    required this.musicName,
    required this.musicOwn,
    required this.musicPath,
    required this.musicPhoto,
    required this.isSelected,
    required this.onMusicSelected,
  });

  @override
  _MusicPlayListState createState() => _MusicPlayListState();
}

class _MusicPlayListState extends State<MusicPlayList> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlay() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(widget.musicPath));
      widget.onMusicSelected(widget.musicPath);

      _audioPlayer.onPositionChanged.listen((Duration position) {
        if (mounted) {
          setState(() {
            progress = position.inMilliseconds / 30000;
          });
        }
      });
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(DeviceConfig.screenWidth! * 0.26,
                    DeviceConfig.screenHeight! * 0.11),
                painter: SquareBorderPainter(progress),
              ),
              Container(
                width: DeviceConfig.screenWidth! * 0.26,
                height: DeviceConfig.screenHeight! * 0.11,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.musicPhoto),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ],
          ),
          const AspectRatio(aspectRatio: 181 / 5),
          Text(
            widget.musicName,
            style: Tstyle.headStyle(textSize: 14, color: cWhite),
          ),
          Text(
            widget.musicOwn,
            style: Tstyle.headStyle(textSize: 14, color: cWhite),
          )
        ],
      ),
    );
  }
}
