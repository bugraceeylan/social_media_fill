import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_text_list.dart';
import 'package:fill_store_bb/app/screen/story/widgets/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'story_viewmodel.g.dart';

class StoryViewModel = _StoryViewModelBase with _$StoryViewModel;

abstract class _StoryViewModelBase with Store {
  @observable
  String obtext = "";
  @observable
  bool isBokehSelected = false;
  @observable
  int selectedToolIndex = 0;

  @observable
  late VideoPlayerController videoController;
  @observable
  CameraController? cameraController;
  @observable
  late Future<void> initializeCameraFuture;
  @observable
  VideoPlayerController? videoControllerCam;
  @observable
  bool isRecording = false;
  @observable
  bool isVideoRecorded = false;
  @observable
  String? videoPath = "";
  @observable
  Timer? timer;
  @observable
  int seconds = 0;
  @observable
  TextEditingController addTextTools = TextEditingController();
  @observable
  ObservableList<TextItem> addedTexts = ObservableList<TextItem>();
  @observable
  @observable
  TextEditingController editTextControl = TextEditingController();
  @observable
  TextItem? editingTextItem;
  @observable
  bool showDeleteButton = false;
  @observable
  bool isDeleteButtonActive = false;
  @observable
  GlobalKey deleteButtonKey = GlobalKey();
  @observable
  TextStyle? selectedTextStyle;
  @observable
  int selectedIndex = 0;
  ColorFilter currentFilter = ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0, // Red
    0.0, 1.0, 0.0, 0.0, 0.0, // Green
    0.0, 0.0, 1.0, 0.0, 0.0, // Blue
    0.0, 0.0, 0.0, 1.0, 0.0, // Alpha
  ]);
  @action
  void onDragEnd(Offset offset, TextItem textItem) {
    showDeleteButton = false;
    final renderBox =
        deleteButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final deleteButtonPosition = renderBox.localToGlobal(Offset.zero);
      final deleteButtonSize = renderBox.size;

      // If the dragged item is within the delete button area, remove it
      if (offset.dy > deleteButtonPosition.dy &&
          offset.dy < deleteButtonPosition.dy + deleteButtonSize.height &&
          offset.dx > deleteButtonPosition.dx &&
          offset.dx < deleteButtonPosition.dx + deleteButtonSize.width) {
        // Remove the text item
        addedTexts.remove(textItem);
        print("Text item removed!");
      }
    }
  }

  @action
  void onDragStart() {
    if (selectedIndex == 1) {
      // index 1 değişecek
      showDeleteButton = false;
    } else {
      showDeleteButton = true;
    }
  }

  @action
  void onDragUpdate(Offset offset, TextItem textItem) {
    if (selectedIndex == 1) {
      // index değişecek
    } else {
      textItem.dx = offset.dx;
      textItem.dy = offset.dy;
      final renderBox =
          deleteButtonKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final deleteButtonPosition = renderBox.localToGlobal(Offset.zero);
        final deleteButtonSize = renderBox.size;

        if (offset.dy > deleteButtonPosition.dy &&
            offset.dy < deleteButtonPosition.dy + deleteButtonSize.height &&
            offset.dx > deleteButtonPosition.dx &&
            offset.dx < deleteButtonPosition.dx + deleteButtonSize.width) {
          if (!isDeleteButtonActive) {
            isDeleteButtonActive = true;
          }
        } else {
          if (isDeleteButtonActive) {
            isDeleteButtonActive = false;
          }
        }
      }
    }
  }

  @action
  void startEditing(TextItem textItem) {
    if (selectedIndex == 1) {
    } else {
      editingTextItem = textItem;
      editTextControl.text = textItem.text;
    }
  }

  @action
  void finishEditing() {
    if (editingTextItem != null) {
      editingTextItem!.text = editTextControl.text;
      editingTextItem = null;
    }
  }

  @action
  void setSelectedTextStyle(TextStyle style) {
    print("Önce: $selectedTextStyle");
    selectedTextStyle = style;
    print("Sonra: $selectedTextStyle");
  }

  @action
  void addText() {
    if (selectedTextStyle != null) {
      print("Metin ekleniyor...");

      addedTexts.add(TextItem(
        text: "Metin...", // Varsayılan metin
        dx: 50,
        dy: 100,
        scale: 1,
        textStyle: selectedTextStyle!,
        key: UniqueKey(), // Benzersiz key
      ));

      print("Metin Eklendi: ${addedTexts.length}");
    }
  }

  @action
  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

      cameraController = CameraController(frontCamera, ResolutionPreset.high);
      await cameraController!.initialize();
    } catch (e) {
      debugPrint("Kamera başlatma hatası: $e");
    }
  }

  @action
  void startTimer() {
    timer?.cancel();
    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
    });
  }

  @action
  void stopTimer() {
    timer?.cancel();
  }

  @action
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @action
  Future<void> startRecording() async {
    print("asd");
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }
    try {
      final recordedFile = await cameraController!.startVideoRecording();
      isRecording = true;
      startTimer();
    } catch (e) {
      debugPrint("Kayıt başlatma hatası: $e");
    }
  }

  @action
  Future<void> stopRecording() async {
    if (cameraController == null || !cameraController!.value.isRecordingVideo) {
      return;
    }
    try {
      final file = await cameraController!.stopVideoRecording();
      isRecording = false;
      isVideoRecorded = true;
      videoPath = file.path;
      stopTimer();
      initializeVideoPlayer();
    } catch (e) {
      debugPrint("Kayıt durdurma hatası: $e");
    }
  }

  @action
  void initializeVideoPlayer() {
    if (videoPath == null) return;
    videoControllerCam = VideoPlayerController.file(File(videoPath!))
      ..setLooping(true)
      ..initialize().then((_) {
        videoController.play();
      });
  }

  @action
  void initializeVideo() {
    videoController = VideoPlayerController.file(File(videoPath!))
      ..setLooping(true)
      ..initialize().then((_) {
        videoController.play();
      });
  }

  @action
  void onEffectSelected(String effect) {
    final selectedFilter =
        filters.firstWhere((filter) => filter.name == effect);
    currentFilter = selectedFilter.colorFilter;
    isBokehSelected = selectedFilter.isBokehSelected;
  }

  @action
  void onEffectTap(int index) {
    selectedToolIndex = index;
  }

  @observable
  List<TextStyle> fontStyles = [
    GoogleFonts.aBeeZee(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.aDLaMDisplay(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.moonDance(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.mrsSaintDelafield(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.indieFlower(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.abhayaLibre(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.aboreto(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.abrilFatface(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.abyssinicaSil(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.aclonica(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.acme(fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.actor(fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.adamina(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.adventPro(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.afacad(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
    GoogleFonts.agbalumo(
        fontSize: 24, color: cWhite, fontWeight: FontWeight.w400),
  ];
}
