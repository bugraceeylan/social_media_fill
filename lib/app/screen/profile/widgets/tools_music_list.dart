import 'dart:convert';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/music_play_list.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/music_search_song.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ToolsMusicList extends StatefulWidget {
  const ToolsMusicList({super.key});

  @override
  State<ToolsMusicList> createState() => _ToolsMusicListState();
}

class _ToolsMusicListState extends State<ToolsMusicList> {
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

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  void _loadSongs() async {
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
    return Wrap(
      children: [
        const AspectRatio(aspectRatio: 181 / 11),
        const Center(child: SearchSong()),
        const AspectRatio(aspectRatio: 181 / 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Popüler Sesler",
            style: Tstyle.headStyle(textSize: 16, color: cWhite),
          ),
        ),
        musicList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: DeviceConfig.screenWidth!,
                height: DeviceConfig.screenHeight!,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), 

                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 30,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10),
                  itemCount: musicList.length,
                  itemBuilder: (context, index) {
                    return MusicPlayList(
                      musicName: musicList[index]["musicName"]!,
                      musicOwn: musicList[index]["musicOwn"]!,
                      musicPath: musicList[index]["musicPath"]!,
                      musicPhoto: musicList[index]["musicPhoto"]!,
                      isSelected:
                          musicList[index]["musicPath"] == selectedMusicPath,
                      onMusicSelected: _onMusicSelected,
                    );
                  },
                ),
              ),
      ],
    );
  }
}
