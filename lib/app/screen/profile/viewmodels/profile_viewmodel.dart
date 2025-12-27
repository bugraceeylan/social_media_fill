import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fill_store_bb/app/components/domain/repo/user_repo.dart';
import 'package:fill_store_bb/app/components/hive/hive.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/core/result/success_data_result.dart';
import 'package:fill_store_bb/app/data/models/posts/post_model.dart';
import 'package:fill_store_bb/app/data/models/users/user_model.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/comment_send.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/comment_sheet.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/post_filters.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_text_list.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/user_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'profile_viewmodel.g.dart';

enum EffectType {
  none,
  blackWhite,
  sepia,
  blur,
  greyScale,
  vintage,
}

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  _ProfileViewModelBase() {
    init();
  }
  @observable
  XFile? selectedUserPhoto;

  @observable
  ObservableList<XFile> selectedPostPhoto = ObservableList<XFile>();
  @observable
  ImagePicker picker = ImagePicker();
  @observable
  TextEditingController commentsController = TextEditingController();
  @observable
  String dayWords = "BirGünherşeyÇokGüzelOlacak";
  @observable
  ObservableList<XFile> selectedPhotos = ObservableList<XFile>();
  @observable
  ColorFilter? selectedEffect;
  @observable
  bool showPostEffects = false;
  @observable
  String? selectedEffectKey;
  @observable
  TextEditingController addTextTools = TextEditingController();
  @observable
  ObservableList<TextItem> addedTexts = ObservableList<TextItem>();
  @observable
  TextStyle? selectedTextStyle;
  @observable
  GlobalKey photoKey = GlobalKey();
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
  bool? isfollowing;
  @observable
  UserModel userModel = userBox.values.first;
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController surNameController = TextEditingController();
  @observable
  TextEditingController userTagController = TextEditingController();
  @observable
  TextEditingController aboutController = TextEditingController();
  @observable
  TextEditingController selectedPostAbout = TextEditingController();
  @observable
  bool isFollowing = true;
  @observable
  bool isRequestSent = false;
  @observable
  bool isPrivate = false;
  @observable
  int userFollowerCount = 0;
  @observable
  int userFollowingCount = 0;
  @observable
  ObservableList<PostModel> userPosts = ObservableList<PostModel>();

  @action
  Future<void> fetchUserPosts(String userID) async {
    final result = await userRepository.getPostsByUserId(userID);
    if (result is SuccessDataResult<List<PostModel>>) {
      userPosts = ObservableList.of(result.data!);
    }
  }

  final userRepository = getIt.get<UserRepository>();
  @action
  Future<void> checkUserFollowStatus(String userID) async {
    final currentUserID = userModel.id!;
    final userDoc =
        await FirebaseFirestore.instance.collection("users").doc(userID).get();

    if (!userDoc.exists) return;

    final data = userDoc.data()!;
    final List<dynamic> followerIDs = data["followerIDs"] ?? [];
    final List<dynamic> followingIDs = data["followingIDs"] ?? [];

    final List<dynamic> followRequestIDs = data["followRequestIDs"] ?? [];
    final bool private = data["privateAcc"] ?? false;

    isPrivate = private;
    isFollowing = followerIDs.contains(currentUserID);
    isRequestSent = followRequestIDs.contains(currentUserID);
    userFollowerCount = followerIDs.length;
    userFollowingCount = followingIDs.length;
  }

  @action
  Future<void> toggleFollow(String userID) async {
    final currentUserID = userModel.id!;
    final userRef = FirebaseFirestore.instance.collection("users").doc(userID);
    final currentUserRef =
        FirebaseFirestore.instance.collection("users").doc(currentUserID);

    if (isPrivate) {
      isRequestSent = !isRequestSent;
      await userRef.update({
        'followRequestIDs': isRequestSent
            ? FieldValue.arrayUnion([currentUserID])
            : FieldValue.arrayRemove([currentUserID])
      });
    } else {
      isFollowing = !isFollowing;
      await userRef.update({
        'followerIDs': isFollowing
            ? FieldValue.arrayUnion([currentUserID])
            : FieldValue.arrayRemove([currentUserID])
      });
      await currentUserRef.update({
        'followingIDs': isFollowing
            ? FieldValue.arrayUnion([userID])
            : FieldValue.arrayRemove([userID])
      });
    }
  }

  @action
  void setUserModel(UserModel model) {
    userModel = model;
    nameController.text = model.name ?? "";
    surNameController.text = model.surName ?? "";
    userTagController.text = model.userTag ?? "";
    aboutController.text = model.about ?? "";
  }

  @action
  Future<void> updateUserProfile() async {
    userModel = userModel.copyWith(
      name: nameController.text,
      surName: surNameController.text,
      userTag: userTagController.text,
      about: aboutController.text,
    );

    await userRepository.update(userModel);
    await userRepository.localUpdate(userModel);

    print(userModel);
  }

  @action
  Future<void> init() async {
    await fetchUser();
  }

  @observable
  String? selectedMusicName; // Seçilen müzik adı

  @action
  void setSelectedMusic(String music) {
    selectedMusicName = music;
  }

  @action
  @action
  Future<void> fetchUser() async {
    var data = await userRepository.currentUser();
    userModel = data.data!;
    nameController.text = userModel.name ?? "";
    surNameController.text = userModel.surName ?? "";
    userTagController.text = userModel.userTag ?? "";
    aboutController.text = userModel.about ?? "";
  }

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
    if (selectedIndex == 0) {
      showDeleteButton = false;
    } else {
      showDeleteButton = true;
    }
  }

  @action
  void onDragUpdate(Offset offset, TextItem textItem) {
    if (selectedIndex == 0) {
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
    if (selectedIndex == 0) {
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
  void setSelectedEffect(String effectKey) {
    selectedEffectKey = effectKey;
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
  void updateTextItemPosition(TextItem textItem, double newDx, double newDy) {
    textItem.dx = newDx;
    textItem.dy = newDy;
  }

  @observable
  Map<String, List<double>> effectMatrices = {
    "Sepia": SEPIA_MATRIX,
    "Greyscale": GREYSCALE_MATRIX,
    "Vintage": VINTAGE_MATRIX,
    "Sweet": SWEET_MATRIX,
  };
  @action
  void toggleEffects() {
    showPostEffects = !showPostEffects;
  }

  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<void> applyEffect(List<double> effectMatrix) async {
    print("applyEffect çalıştı: $effectMatrix");
    selectedEffect = ColorFilter.matrix(effectMatrix);
    print(
        "Güncellenmiş selectedEffect: $selectedEffect"); // Güncelleme sonrası kontrol
  }

  @action
  Future<void> pickUserPhotos() async {
    final XFile? pickedFile = await picker.pickImage(
      // pickImage kullanıyoruz
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      selectedUserPhoto = pickedFile;
    }
  }

  @action
  Future<void> pickPhotos() async {
    final XFile? pickedFiles = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFiles != null) {
      selectedPhotos.add(pickedFiles); // Yeni fotoğraf ekleniyor
    }
  }

  @action
  Future<void> pickPostPhoto() async {
    final List<XFile> pickedFiles = await picker.pickMultiImage(
      limit: 3,
      imageQuality: 50,
    );

    if (pickedFiles != null) {
      selectedPostPhoto.addAll(pickedFiles); // Yeni fotoğraf ekleniyor
    }
  }

  @action
  Future<void> updateDayWords(String newWords) async {
    userModel = userModel.copyWith(
      dayWords: newWords,
    );

    await userRepository.update(userModel);
    await userRepository.localUpdate(userModel);

    print("Güncellenen DayWords: ${userModel.dayWords}");
  }

  @action
  void showPostOpt(BuildContext context, ProfileViewModel viewModel) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: cWhite,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Gönderi Detayları",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 25),
                ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffE2E1E1))),
                  onPressed: () {
                    Navigator.pop(context); // BottomSheet'i kapatır.
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/profil/trash.svg"),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Bu gönderiyi sil",
                          style: TextStyle(
                            color: cBlack,
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 8),
                ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffE2E1E1))),
                  onPressed: () {
                    Navigator.pop(context); // BottomSheet'i kapatır.
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          color: cBlack,
                          "assets/svg_assets/edit.svg",
                          theme: const SvgTheme(
                            currentColor: cBlack,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Bu gönderiyi düzenle",
                          style: TextStyle(
                            color: cBlack,
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 25),
              ],
            ),
          ),
        );
      },
    );
  }

  final List<Color> colors = const [
    Color.fromRGBO(22, 8, 189, 1),
    Color.fromRGBO(98, 189, 8, 1),
    Color.fromRGBO(64, 46, 64, 1),
    Color.fromRGBO(189, 8, 73, 1),
    Color.fromRGBO(206, 119, 18, 1),
    Color.fromRGBO(29, 117, 27, 1),
    Color.fromRGBO(26, 69, 134, 1),
    Color.fromRGBO(247, 195, 248, 1),
    Color.fromRGBO(251, 251, 251, 1),
    Color.fromRGBO(95, 214, 105, 1),
  ];
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
  @observable
  List<Map<String, String>> userComments = [
    {
      "userPhoto": 'assets/profil/userPhoto.png',
      "userName": 'asiyeyazici',
      "userComment": 'Müziğine bayıldım, her notası ayrı bir his taşıyor!',
      "commentLike": "51"
    }
  ];
  @action
  void addComment(String comment) {
    if (comment.isNotEmpty) {
      // Mevcut listeyi değiştirerek yenisini oluşturun
      userComments = List<Map<String, String>>.from(userComments)
        ..add({
          "userPhoto":
              'assets/profil/userPhoto.png', // Varsayılan profil fotoğrafı
          "userName": 'onurabi', // Mevcut kullanıcı adı
          "userComment": comment,
          "commentLike": "0"
        });
      commentsController.clear();
    }
  }

  @action
  void commentPopUp(BuildContext context, ProfileViewModel viewModel,
      String postID, String userName) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: cWhite,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CommentSheet(
          postID: postID,
          userName: userName,
        );
      },
    );
  }

  @action
  void showUpdateDayWordsBottomSheet(
      BuildContext context, ProfileViewModel viewModel) {
    final TextEditingController textController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: cWhite,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AspectRatio(aspectRatio: 181 / 11),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    const Text(
                      "Günün Sözü",
                      style: TextStyle(
                          color: cBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const AspectRatio(aspectRatio: 181 / 11),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(width: 1, color: cBlack)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "#",
                          style: TextStyle(
                            color: cBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          maxLength: 30, // 30 karakter sınırı
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r'\s')), // Boşluk karakterlerini engelle
                          ],
                          controller: textController,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            counterText: "", // Karakter sayacı gizlendi
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 9.9),
                            border: InputBorder.none,
                            hintText: viewModel.dayWords,
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 11),
                ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffE2E1E1))),
                  onPressed: () {
                    viewModel.updateDayWords(textController.text);
                    Navigator.pop(context);
                    print(userModel.dayWords);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Güncelle",
                      style: TextStyle(
                        color: cBlack,
                        fontSize: 16,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const AspectRatio(aspectRatio: 181 / 11),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShowModalAppbar extends StatelessWidget {
  final String title;
  const ShowModalAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(
          title,
          style: const TextStyle(
              color: cBlack, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Icon(
            Icons.close,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}

class CommentPopUp extends StatefulWidget {
  @override
  _CommentPopUpState createState() => _CommentPopUpState();
}

class _CommentPopUpState extends State<CommentPopUp> {
  final TextEditingController commentsController = TextEditingController();
  final List<Map<String, String>> userComments = [
    {
      "userPhoto": 'assets/profil/userPhoto.png',
      "userName": 'asiyeyazici',
      "userComment": 'Müziğine bayıldım, her notası ayrı bir his taşıyor!',
      "commentLike": "51"
    }
  ];

  void addComment(String comment) {
    if (comment.isNotEmpty) {
      setState(() {
        userComments.add({
          "userPhoto": 'assets/profil/userPhoto.png',
          "userName": 'currentUser',
          "userComment": comment,
          "commentLike": "0"
        });
        commentsController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ShowModalAppbar(title: 'Yorumlar'),
            SizedBox(
              width: DeviceConfig.screenWidth!,
              height: DeviceConfig.screenHeight! * 0.5,
              child: ListView.builder(
                itemCount: userComments.length,
                itemBuilder: (context, index) {
                  final comment = userComments[index];
                  return UserCommentList(
                    userPhoto: comment["userPhoto"]!,
                    userName: comment["userName"]!,
                    userComment: comment["userComment"]!,
                    commentLike: comment["commentLike"]!,
                  );
                },
              ),
            ),
            const AspectRatio(aspectRatio: 181 / 22),
            CommentSend(
              commentsController: commentsController,
              onSend: (String comment) {
                addComment(comment);
              },
              userName: '',
            ),
          ],
        ),
      ),
    );
  }
}
