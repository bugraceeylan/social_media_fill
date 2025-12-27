// import 'package:fill_store_bb/app/constant/assets_text.dart';
// import 'package:fill_store_bb/app/constant/color.dart';
// import 'package:fill_store_bb/app/get_it/get_it.dart';
// import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/post_view.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/shadow_line.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_day_words.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_posts.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_about.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_details.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_level.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_profile_photo.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_selected_followers.dart';
// import 'package:fill_store_bb/app/screen/profile/widgets/user_share_photos.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

// class UserProfile extends StatelessWidget {
//   const UserProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//         final viewModel = getIt.get<ProfileViewModel>();

//     return  Observer(
//       builder: (context) => SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UserProfilePhoto(
//                   viewModel: viewModel,
//                   onPressed: () => viewModel.pickUserPhotos(),
//                   images: viewModel.selectedUserPhoto?.path,
//                 ),
//                 const UserAboutProfile(
//                   name: "Onur",
//                   surname: "Aydin",
//                   userAbout: "Müzik ruhun gıdasıdır,ben de onun elçisiyim.🎸",
//                   userName: "onur.aydin1415",
//                   userTitle: "Müzisyen",
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: UserLevel(),
//                 ),
//               ],
//             ),
//             const AspectRatio(aspectRatio: 181 / 11),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 UserProfileDetails(
//                   head: "Takip Edilen",
//                   body: "627",
//                   typeGo: UserSelectedFollowers(),
//                 ),
//                 UserProfileDetails(
//                   head: "Takipçi",
//                   body: "1.789.269",
//                   typeGo: UserSelectedFollowers(),
//                 ),
//                 UserProfileDetails(
//                   head: "Paylaşım",
//                   body: "436",
//                   typeGo: UserSelectedFollowers(),
//                 ),
//               ],
//             ),
//             const AspectRatio(aspectRatio: 181 / 4),
//             Divider(
//               height: 1,
//               color: Colors.grey.shade600,
//             ),
//             Observer(
//               builder: (context) => UserPosts(
//                 onPressed: () => viewModel.pickPhotos(),
//                 postLenght: viewModel.selectedPhotos.length,
//                 postList: viewModel.selectedPhotos,
//               ),
//             ),
//             const AspectRatio(aspectRatio: 181 / 4),
//             Center(
//               child: GestureDetector(
//                 onTap: () =>
//                     viewModel.showUpdateDayWordsBottomSheet(context, viewModel),
//                 child: UserDayWords(viewModel: viewModel),
//               ),
//             ),
//             const AspectRatio(aspectRatio: 181 / 4),
//             const PageShadowLine(),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Text(
//                 "Paylaşımlarım",
//                 style: TextStyle(
//                   color: cBlack,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: UserSharePhotos(),
//             ),
//             const AspectRatio(aspectRatio: 181 / 11),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: UserPostContanier(
//                 viewModel: viewModel,
//                 postLikeCount: '631',
//                 postUserName: 'ahucetin90',
//                 postShareTime: '1s önce',
//                 postCommentCount: '156',
//                 postUserCount: 102,
//                 postAbout: loremParis,
//                 postContent: "assets/profil/post.jpg",
//                 postUserPhoto: viewModel.selectedUserPhoto?.path ?? "",
//                 commentOnShow: () => viewModel.commentPopUp(context, viewModel),
//               ),
//             ),
//             const AspectRatio(aspectRatio: 181 / 100),
//             const AspectRatio(aspectRatio: 181 / 100),
//             const AspectRatio(aspectRatio: 181 / 100),
//           ],
//         ),
//       ),
//     );
//   }
// }