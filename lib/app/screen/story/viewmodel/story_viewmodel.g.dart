// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryViewModel on _StoryViewModelBase, Store {
  late final _$obtextAtom =
      Atom(name: '_StoryViewModelBase.obtext', context: context);

  @override
  String get obtext {
    _$obtextAtom.reportRead();
    return super.obtext;
  }

  @override
  set obtext(String value) {
    _$obtextAtom.reportWrite(value, super.obtext, () {
      super.obtext = value;
    });
  }

  late final _$isBokehSelectedAtom =
      Atom(name: '_StoryViewModelBase.isBokehSelected', context: context);

  @override
  bool get isBokehSelected {
    _$isBokehSelectedAtom.reportRead();
    return super.isBokehSelected;
  }

  @override
  set isBokehSelected(bool value) {
    _$isBokehSelectedAtom.reportWrite(value, super.isBokehSelected, () {
      super.isBokehSelected = value;
    });
  }

  late final _$selectedToolIndexAtom =
      Atom(name: '_StoryViewModelBase.selectedToolIndex', context: context);

  @override
  int get selectedToolIndex {
    _$selectedToolIndexAtom.reportRead();
    return super.selectedToolIndex;
  }

  @override
  set selectedToolIndex(int value) {
    _$selectedToolIndexAtom.reportWrite(value, super.selectedToolIndex, () {
      super.selectedToolIndex = value;
    });
  }

  late final _$videoControllerAtom =
      Atom(name: '_StoryViewModelBase.videoController', context: context);

  @override
  VideoPlayerController get videoController {
    _$videoControllerAtom.reportRead();
    return super.videoController;
  }

  bool _videoControllerIsInitialized = false;

  @override
  set videoController(VideoPlayerController value) {
    _$videoControllerAtom.reportWrite(
        value, _videoControllerIsInitialized ? super.videoController : null,
        () {
      super.videoController = value;
      _videoControllerIsInitialized = true;
    });
  }

  late final _$cameraControllerAtom =
      Atom(name: '_StoryViewModelBase.cameraController', context: context);

  @override
  CameraController? get cameraController {
    _$cameraControllerAtom.reportRead();
    return super.cameraController;
  }

  @override
  set cameraController(CameraController? value) {
    _$cameraControllerAtom.reportWrite(value, super.cameraController, () {
      super.cameraController = value;
    });
  }

  late final _$initializeCameraFutureAtom = Atom(
      name: '_StoryViewModelBase.initializeCameraFuture', context: context);

  @override
  Future<void> get initializeCameraFuture {
    _$initializeCameraFutureAtom.reportRead();
    return super.initializeCameraFuture;
  }

  bool _initializeCameraFutureIsInitialized = false;

  @override
  set initializeCameraFuture(Future<void> value) {
    _$initializeCameraFutureAtom.reportWrite(
        value,
        _initializeCameraFutureIsInitialized
            ? super.initializeCameraFuture
            : null, () {
      super.initializeCameraFuture = value;
      _initializeCameraFutureIsInitialized = true;
    });
  }

  late final _$videoControllerCamAtom =
      Atom(name: '_StoryViewModelBase.videoControllerCam', context: context);

  @override
  VideoPlayerController? get videoControllerCam {
    _$videoControllerCamAtom.reportRead();
    return super.videoControllerCam;
  }

  @override
  set videoControllerCam(VideoPlayerController? value) {
    _$videoControllerCamAtom.reportWrite(value, super.videoControllerCam, () {
      super.videoControllerCam = value;
    });
  }

  late final _$isRecordingAtom =
      Atom(name: '_StoryViewModelBase.isRecording', context: context);

  @override
  bool get isRecording {
    _$isRecordingAtom.reportRead();
    return super.isRecording;
  }

  @override
  set isRecording(bool value) {
    _$isRecordingAtom.reportWrite(value, super.isRecording, () {
      super.isRecording = value;
    });
  }

  late final _$isVideoRecordedAtom =
      Atom(name: '_StoryViewModelBase.isVideoRecorded', context: context);

  @override
  bool get isVideoRecorded {
    _$isVideoRecordedAtom.reportRead();
    return super.isVideoRecorded;
  }

  @override
  set isVideoRecorded(bool value) {
    _$isVideoRecordedAtom.reportWrite(value, super.isVideoRecorded, () {
      super.isVideoRecorded = value;
    });
  }

  late final _$videoPathAtom =
      Atom(name: '_StoryViewModelBase.videoPath', context: context);

  @override
  String? get videoPath {
    _$videoPathAtom.reportRead();
    return super.videoPath;
  }

  @override
  set videoPath(String? value) {
    _$videoPathAtom.reportWrite(value, super.videoPath, () {
      super.videoPath = value;
    });
  }

  late final _$timerAtom =
      Atom(name: '_StoryViewModelBase.timer', context: context);

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_StoryViewModelBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$addTextToolsAtom =
      Atom(name: '_StoryViewModelBase.addTextTools', context: context);

  @override
  TextEditingController get addTextTools {
    _$addTextToolsAtom.reportRead();
    return super.addTextTools;
  }

  @override
  set addTextTools(TextEditingController value) {
    _$addTextToolsAtom.reportWrite(value, super.addTextTools, () {
      super.addTextTools = value;
    });
  }

  late final _$addedTextsAtom =
      Atom(name: '_StoryViewModelBase.addedTexts', context: context);

  @override
  ObservableList<TextItem> get addedTexts {
    _$addedTextsAtom.reportRead();
    return super.addedTexts;
  }

  @override
  set addedTexts(ObservableList<TextItem> value) {
    _$addedTextsAtom.reportWrite(value, super.addedTexts, () {
      super.addedTexts = value;
    });
  }

  late final _$editTextControlAtom =
      Atom(name: '_StoryViewModelBase.editTextControl', context: context);

  @override
  TextEditingController get editTextControl {
    _$editTextControlAtom.reportRead();
    return super.editTextControl;
  }

  @override
  set editTextControl(TextEditingController value) {
    _$editTextControlAtom.reportWrite(value, super.editTextControl, () {
      super.editTextControl = value;
    });
  }

  late final _$editingTextItemAtom =
      Atom(name: '_StoryViewModelBase.editingTextItem', context: context);

  @override
  TextItem? get editingTextItem {
    _$editingTextItemAtom.reportRead();
    return super.editingTextItem;
  }

  @override
  set editingTextItem(TextItem? value) {
    _$editingTextItemAtom.reportWrite(value, super.editingTextItem, () {
      super.editingTextItem = value;
    });
  }

  late final _$showDeleteButtonAtom =
      Atom(name: '_StoryViewModelBase.showDeleteButton', context: context);

  @override
  bool get showDeleteButton {
    _$showDeleteButtonAtom.reportRead();
    return super.showDeleteButton;
  }

  @override
  set showDeleteButton(bool value) {
    _$showDeleteButtonAtom.reportWrite(value, super.showDeleteButton, () {
      super.showDeleteButton = value;
    });
  }

  late final _$isDeleteButtonActiveAtom =
      Atom(name: '_StoryViewModelBase.isDeleteButtonActive', context: context);

  @override
  bool get isDeleteButtonActive {
    _$isDeleteButtonActiveAtom.reportRead();
    return super.isDeleteButtonActive;
  }

  @override
  set isDeleteButtonActive(bool value) {
    _$isDeleteButtonActiveAtom.reportWrite(value, super.isDeleteButtonActive,
        () {
      super.isDeleteButtonActive = value;
    });
  }

  late final _$deleteButtonKeyAtom =
      Atom(name: '_StoryViewModelBase.deleteButtonKey', context: context);

  @override
  GlobalKey<State<StatefulWidget>> get deleteButtonKey {
    _$deleteButtonKeyAtom.reportRead();
    return super.deleteButtonKey;
  }

  @override
  set deleteButtonKey(GlobalKey<State<StatefulWidget>> value) {
    _$deleteButtonKeyAtom.reportWrite(value, super.deleteButtonKey, () {
      super.deleteButtonKey = value;
    });
  }

  late final _$selectedTextStyleAtom =
      Atom(name: '_StoryViewModelBase.selectedTextStyle', context: context);

  @override
  TextStyle? get selectedTextStyle {
    _$selectedTextStyleAtom.reportRead();
    return super.selectedTextStyle;
  }

  @override
  set selectedTextStyle(TextStyle? value) {
    _$selectedTextStyleAtom.reportWrite(value, super.selectedTextStyle, () {
      super.selectedTextStyle = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_StoryViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$fontStylesAtom =
      Atom(name: '_StoryViewModelBase.fontStyles', context: context);

  @override
  List<TextStyle> get fontStyles {
    _$fontStylesAtom.reportRead();
    return super.fontStyles;
  }

  @override
  set fontStyles(List<TextStyle> value) {
    _$fontStylesAtom.reportWrite(value, super.fontStyles, () {
      super.fontStyles = value;
    });
  }

  late final _$initializeCameraAsyncAction =
      AsyncAction('_StoryViewModelBase.initializeCamera', context: context);

  @override
  Future<void> initializeCamera() {
    return _$initializeCameraAsyncAction.run(() => super.initializeCamera());
  }

  late final _$startRecordingAsyncAction =
      AsyncAction('_StoryViewModelBase.startRecording', context: context);

  @override
  Future<void> startRecording() {
    return _$startRecordingAsyncAction.run(() => super.startRecording());
  }

  late final _$stopRecordingAsyncAction =
      AsyncAction('_StoryViewModelBase.stopRecording', context: context);

  @override
  Future<void> stopRecording() {
    return _$stopRecordingAsyncAction.run(() => super.stopRecording());
  }

  late final _$_StoryViewModelBaseActionController =
      ActionController(name: '_StoryViewModelBase', context: context);

  @override
  void onDragEnd(Offset offset, TextItem textItem) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.onDragEnd');
    try {
      return super.onDragEnd(offset, textItem);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDragStart() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.onDragStart');
    try {
      return super.onDragStart();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDragUpdate(Offset offset, TextItem textItem) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.onDragUpdate');
    try {
      return super.onDragUpdate(offset, textItem);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startEditing(TextItem textItem) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.startEditing');
    try {
      return super.startEditing(textItem);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishEditing() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.finishEditing');
    try {
      return super.finishEditing();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTextStyle(TextStyle style) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.setSelectedTextStyle');
    try {
      return super.setSelectedTextStyle(style);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addText() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.addText');
    try {
      return super.addText();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String formatTime(int seconds) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.formatTime');
    try {
      return super.formatTime(seconds);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializeVideoPlayer() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.initializeVideoPlayer');
    try {
      return super.initializeVideoPlayer();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializeVideo() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.initializeVideo');
    try {
      return super.initializeVideo();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEffectSelected(String effect) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.onEffectSelected');
    try {
      return super.onEffectSelected(effect);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEffectTap(int index) {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.onEffectTap');
    try {
      return super.onEffectTap(index);
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obtext: ${obtext},
isBokehSelected: ${isBokehSelected},
selectedToolIndex: ${selectedToolIndex},
videoController: ${videoController},
cameraController: ${cameraController},
initializeCameraFuture: ${initializeCameraFuture},
videoControllerCam: ${videoControllerCam},
isRecording: ${isRecording},
isVideoRecorded: ${isVideoRecorded},
videoPath: ${videoPath},
timer: ${timer},
seconds: ${seconds},
addTextTools: ${addTextTools},
addedTexts: ${addedTexts},
editTextControl: ${editTextControl},
editingTextItem: ${editingTextItem},
showDeleteButton: ${showDeleteButton},
isDeleteButtonActive: ${isDeleteButtonActive},
deleteButtonKey: ${deleteButtonKey},
selectedTextStyle: ${selectedTextStyle},
selectedIndex: ${selectedIndex},
fontStyles: ${fontStyles}
    ''';
  }
}
