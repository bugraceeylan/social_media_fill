import 'package:camera/camera.dart';
import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_edit_tools.dart';
import 'package:fill_store_bb/app/screen/story/widgets/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:io';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _cameraController;
  late Future<void> _initializeCameraFuture;
  VideoPlayerController? _videoController;
  bool isRecording = false;
  bool isVideoRecorded = false;
  String? videoPath;
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _initializeCameraFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

      _cameraController = CameraController(frontCamera, ResolutionPreset.high);
      await _cameraController!.initialize();
      setState(() {});
    } catch (e) {
      debugPrint("Kamera başlatma hatası: $e");
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _seconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  Future<void> _startRecording() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    try {
      final recordedFile = await _cameraController!.startVideoRecording();
      setState(() {
        isRecording = true;
      });
      _startTimer();
    } catch (e) {
      debugPrint("Kayıt başlatma hatası: $e");
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController == null ||
        !_cameraController!.value.isRecordingVideo) {
      return;
    }
    try {
      final file = await _cameraController!.stopVideoRecording();
      setState(() {
        isRecording = false;
        isVideoRecorded = true;
        videoPath = file.path;
      });
      _stopTimer();
      _initializeVideoPlayer();
    } catch (e) {
      debugPrint("Kayıt durdurma hatası: $e");
    }
  }

  void _initializeVideoPlayer() {
    if (videoPath == null) return;
    _videoController = VideoPlayerController.file(File(videoPath!))
      ..setLooping(true) // Enable looping
      ..initialize().then((_) {
        setState(() {});
        _videoController!.play();
      });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _videoController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231F1F),
      body: Center(
        child: isVideoRecorded && videoPath != null
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: DeviceConfig.screenWidth,
                    height: DeviceConfig.screenHeight! * 0.80,
                    decoration: BoxDecoration(),
                    child: VideoPlayer(_videoController!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVideoRecorded = false;
                              videoPath = null;
                            });
                          },
                          child: Container(
                            width: DeviceConfig.screenWidth! * 0.16,
                            height: DeviceConfig.screenHeight! * 0.059,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(35, 31, 31, 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              color: cWhite,
                              "assets/profil/trash.svg",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          width: DeviceConfig.screenWidth! * 0.16,
                          height: DeviceConfig.screenHeight! * 0.093,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(35, 31, 31, 0.5)
                                .withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/story/archive.svg",
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigation.push(
                                page: VideoPlayerScreen(videoPath: videoPath!));
                            setState(() {
                              isVideoRecorded = false;
                              videoPath = null;
                              _videoController?.dispose();
                            });
                          },
                          child: Container(
                            width: DeviceConfig.screenWidth! * 0.16,
                            height: DeviceConfig.screenHeight! * 0.059,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 251, 251, 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.check),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : FutureBuilder<void>(
                future: _initializeCameraFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Kamera başlatılamadı!",
                          style: TextStyle(color: Colors.white)),
                    );
                  } else {
                    return CameraPreview(
                      _cameraController!,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Spacer(flex: 4),
                              Center(
                                  child: Text(
                                _formatTime(_seconds),
                                style: Tstyle.headStyle(
                                    textSize: 14, color: cWhite),
                              )),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: AppBarBack(),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVideoRecorded = false;
                                      videoPath = null;
                                    });
                                  },
                                  child: Container(
                                    width: DeviceConfig.screenWidth! * 0.16,
                                    height: DeviceConfig.screenHeight! * 0.059,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(35, 31, 31, 0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      color: cWhite,
                                      "assets/profil/trash.svg",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      isRecording = !isRecording;
                                      if (isRecording) {
                                        _startTimer();
                                        _startRecording();
                                      } else {
                                        _stopTimer();
                                        _stopRecording();
                                      }
                                    });
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        width: isRecording
                                            ? DeviceConfig.screenWidth! * 0.26
                                            : DeviceConfig.screenWidth! * 0.16,
                                        height: isRecording
                                            ? DeviceConfig.screenHeight! * 0.12
                                            : DeviceConfig.screenHeight! *
                                                0.093,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(188, 234, 192, 1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: DeviceConfig.screenWidth! * 0.16,
                                        height:
                                            DeviceConfig.screenHeight! * 0.093,
                                        decoration: BoxDecoration(
                                          color: cPrimaryGreen,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.push(
                                        page: VideoPlayerScreen(
                                            videoPath: videoPath!));
                                  },
                                  child: Container(
                                    width: DeviceConfig.screenWidth! * 0.16,
                                    height: DeviceConfig.screenHeight! * 0.059,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(251, 251, 251, 0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.check),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
