import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/AppBar/story_appbar.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/music_play_list.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_edit_tools.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/text_drag_matrix.dart';
import 'package:fill_store_bb/app/screen/story/viewmodel/story_viewmodel.dart';
import 'package:fill_store_bb/app/screen/story/widgets/filter_model.dart';
import 'package:fill_store_bb/app/screen/story/widgets/v_draggble_text_item.dart';
import 'package:fill_store_bb/app/screen/story/widgets/video_add_text.dart';
import 'package:fill_store_bb/app/screen/story/widgets/video_music_list.dart';
import 'package:fill_store_bb/app/screen/story/widgets/video_story_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  const VideoPlayerScreen({required this.videoPath, super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoController;
  String videoPath = "";
  bool isMuted = false; // Add mute state

  ColorFilter currentFilter = ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0, // Red
    0.0, 1.0, 0.0, 0.0, 0.0, // Green
    0.0, 0.0, 1.0, 0.0, 0.0, // Blue
    0.0, 0.0, 0.0, 1.0, 0.0, // Alpha
  ]);
  bool isBokehSelected = false;
  int selectedToolIndex = 0;

  @override
  void initState() {
    videoPath = widget.videoPath;
    super.initState();
    _initializeVideo();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void _initializeVideo() {
    videoController = VideoPlayerController.file(File(videoPath))
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        videoController.play();
      });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
    videoController.setVolume(isMuted ? 0.0 : 1.0); // Mute or unmute the video
  }

  void onEffectSelected(String effect) {
    setState(() {
      final selectedFilter =
          filters.firstWhere((filter) => filter.name == effect);
      currentFilter = selectedFilter.colorFilter;
      isBokehSelected = selectedFilter.isBokehSelected;
    });
  }

  void onEffectTap(int index) {
    setState(() {
      selectedToolIndex = index;
    });
    print(selectedToolIndex);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<StoryViewModel>();

    return Scaffold(
      appBar: StoryAppbarView(
        leading: IconButton(
          icon: Icon(
            isMuted ? Icons.volume_off : Icons.volume_up,
            color: Colors.white,
          ),
          onPressed: _toggleMute, // Handle mute/unmute action
        ),
        title: "Story Paylaş",
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AppBarBack(),
          ),
          IconButton(
            icon: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: _toggleMute, // Handle mute/unmute action
          ),
        ],
      ),
      backgroundColor: const Color(0xff231F1F),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: DeviceConfig.screenWidth,
                height: DeviceConfig.screenHeight! * 0.80,
                child: ColorFiltered(
                  colorFilter: currentFilter,
                  child: Observer(builder: (_) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        VideoPlayer(videoController),
                        ...viewModel.addedTexts.map(
                          (textItem) => VideoDraggableTextItem(
                            textItem: textItem,
                            viewModel: viewModel,
                          ),
                        ),
                        if (selectedToolIndex == 1 && isBokehSelected)
                          BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ),
              selectedToolIndex != 0
                  ? SizedBox()
                  : StoryTools(onEffectTap: onEffectTap),
              if (selectedToolIndex == 1)
                Positioned(
                  bottom: DeviceConfig.screenHeight! * 0.1,
                  child: EffectSelection(
                    onEffectSelected: onEffectSelected,
                    videoPath: widget.videoPath,
                  ),
                ),
              if (selectedToolIndex == 2)
                Positioned(
                    bottom: DeviceConfig.screenHeight! * 0.1,
                    child: VideoTextListed()),
              if (selectedToolIndex == 2)
                Observer(
                  builder: (context) {
                    return viewModel.showDeleteButton
                        ? Center(
                            child: Container(
                              key: viewModel.deleteButtonKey,
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                color: viewModel.isDeleteButtonActive
                                    ? Colors.red.withOpacity(0.5)
                                    : Colors.transparent,
                              ),
                              child: SvgPicture.asset(
                                "assets/profil/delete_sembol.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
              if (selectedToolIndex == 3)
                Positioned(
                  top: DeviceConfig.screenHeight! * 0.53,
                  child: MusicSelection(
                    onEffectSelected: onEffectSelected,
                    videoPath: videoPath,
                  ),
                ),
            ],
          ),
          Spacer(),
        ],
      ),
      bottomSheet: selectedToolIndex != 0
          ? Container(
              width: DeviceConfig.screenWidth!,
              height: DeviceConfig.screenHeight! * 0.15,
              color: const Color(0xff231F1F),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedToolIndex = 0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: DeviceConfig.screenWidth! * 0.1,
                    height: DeviceConfig.screenHeight! * 0.01,
                    decoration:
                        BoxDecoration(color: cTextGrey, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/profil/tick.svg",
                      width: 5,
                      height: 5,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              width: DeviceConfig.screenWidth!,
              height: DeviceConfig.screenHeight! * 0.15,
              color: const Color(0xff231F1F),
              child: Wrap(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Arkadaşlarını etiketle",
                      style: Tstyle.subStyle(textSize: 14, color: cWhite),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      children: [
                        Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(251, 251, 251, 0.5),
                          ),
                          child: Icon(
                            Icons.add,
                            color: cWhite,
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: DeviceConfig.screenWidth! * 0.4,
                          height: DeviceConfig.screenHeight! * 0.060,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF327037).withOpacity(0.9),
                                const Color(0xff5FD669),
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                          child: Text(
                            "Paylaş",
                            style:
                                Tstyle.headStyle(textSize: 14, color: cWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class StoryTools extends StatelessWidget {
  final Function(int) onEffectTap;
  const StoryTools({required this.onEffectTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(18, 18, 18, 0.34),
            borderRadius: BorderRadius.circular(10)),
        width: DeviceConfig.screenWidth! * 0.9,
        height: DeviceConfig.screenHeight! * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onEffectTap(1),
              child: WrappedTools(
                index: 1,
                toolsAssets: 'assets/profil/post_effect.svg',
                toolsType: "Efektler",
              ),
            ),
            SizedBox(width: 34),
            GestureDetector(
              onTap: () => onEffectTap(2),
              child: WrappedTools(
                index: 2,
                toolsAssets: 'assets/profil/post_text.svg',
                toolsType: "Metin Ekle",
              ),
            ),
            SizedBox(width: 34),
            GestureDetector(
              onTap: () => onEffectTap(3),
              child: WrappedTools(
                index: 3,
                toolsAssets: 'assets/profil/post_music.svg',
                toolsType: "Müzik",
              ),
            ),
            SizedBox(width: 34),
            GestureDetector(
              onTap: () {
                Navigation.push(page: StoryTimerSet());
              },
              child: WrappedTools(
                index: 4,
                toolsAssets: 'assets/profil/post_timer.svg',
                toolsType: "Zamanlayıcı",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicSelection extends StatefulWidget {
  final String videoPath;
  final Function(String) onEffectSelected;

  const MusicSelection({
    required this.onEffectSelected,
    required this.videoPath,
    super.key,
  });

  @override
  State<MusicSelection> createState() => _MusicSelectionState();
}

class _MusicSelectionState extends State<MusicSelection> {
  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  List<Map<String, dynamic>> musicList = [];
  String? selectedMusicPath;
  Future<List<Map<String, dynamic>>> fetchSongs() async {
    final response = await http.get(
      Uri.parse('https://api.deezer.com/artist/5618818/top?limit=10'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List tracks = data['data'];
      return tracks.map((track) {
        return {
          "musicName": track["title"],
          "musicOwn": track["artist"]["name"],
          "musicPath": track["preview"],
          "musicPhoto": track["album"]["cover_medium"]
        };
      }).toList();
    } else {
      throw Exception("Şarkılar yüklenemedi.");
    }
  }

  void loadSongs() async {
    try {
      final songs = await fetchSongs();
      setState(() {
        musicList = songs;
      });
    } catch (e) {
      print("Şarkılar yüklenemedi: $e");
    }
  }

  void _onMusicSelected(String musicPath) {
    setState(() {
      selectedMusicPath = musicPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceConfig.screenWidth!,
      height: DeviceConfig.screenHeight! * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: musicList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: VideoMusicList(
              musicName: musicList[index]["musicName"]!,
              musicOwn: musicList[index]["musicOwn"]!,
              musicPath: musicList[index]["musicPath"]!,
              musicPhoto: musicList[index]["musicPhoto"]!,
              isSelected: musicList[index]["musicPath"] == selectedMusicPath,
              onMusicSelected: _onMusicSelected,
            ),
          );
        },
      ),
    );
  }
}

class EffectSelection extends StatelessWidget {
  final String videoPath;
  final Function(String) onEffectSelected;

  const EffectSelection({
    required this.onEffectSelected,
    required this.videoPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 59,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return GestureDetector(
              onTap: () {
                onEffectSelected(filter.name);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 59,
                  height: 59,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: filter.filterAsset.isEmpty
                        ? filter.c
                        : null, // Use color if filterAsset is empty
                  ),
                  child: filter.filterAsset.isEmpty
                      ? (filter.name == 'Default'
                          ? Icon(
                              Icons.block,
                              color: cWhite,
                              size: 24,
                            ) // Show block icon only for Default filter
                          : null) // No icon for other filters
                      : Image.asset(
                          filter.filterAsset,
                          fit: BoxFit.fill,
                        ),
                ),
              ));
        },
      ),
    );
  }
}

// void applyBokehEffect(String inputPath, Function(String) onComplete) async {
//   final dir = await getTemporaryDirectory();
//   final outputPath = '${dir.path}/fi215_video.mp4';
//   String command = '-i $inputPath -vf "'
//       'gblur=sigma=5, ' // Bokeh efekti
//       'colorchannelmixer=rr=0.7:rg=0.2:rb=0.1:gr=0.1:gg=0.8:gb=0.1:br=0.1:bg=0.2:bb=0.7, ' // Soğuk tonlar (Oslo efekti)
//       'curves=preset=increase_contrast, ' // Kontrast artırma
//       'eq=saturation=0.8:brightness=0.05' // Doygunluk ve parlaklık ayarları
//       '" -c:v mpeg4 -b:v 2000k -c:a copy $outputPath';
//   print("Running command: $command");

//   FFmpegKit.execute(command).then((session) async {
//     final returnCode = await session.getReturnCode();
//     if (returnCode!.isValueSuccess()) {
//       onComplete(outputPath);
//     } else {
//       final failStackTrace = await session.getFailStackTrace();
//       print("FFmpeg işlemi başarısız oldu: $returnCode");
//       print("Hata mesajı: $failStackTrace");
//       print("Giriş yolu: $inputPath");
//       print("Çıkış yolu: $outputPath");
//     }
//   });
// }
