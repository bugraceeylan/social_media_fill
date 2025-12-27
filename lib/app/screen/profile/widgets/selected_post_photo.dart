import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/text_drag_matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class SelectedPostPhoto extends StatefulWidget {
  final String postPhoto;
  final Key photoKey;
  final Key deletButtonKey;

  const SelectedPostPhoto({
    super.key,
    required this.postPhoto,
    required this.photoKey,
    required this.deletButtonKey,
  });

  @override
  _SelectedPostPhotoState createState() => _SelectedPostPhotoState();
}

class _SelectedPostPhotoState extends State<SelectedPostPhoto> {
  final viewModel = getIt.get<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        key: widget.photoKey,
        children: [
          Container(
            width: double.infinity,
            height: DeviceConfig.screenHeight! * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                colorFilter: viewModel.selectedEffect,
                fit: BoxFit.cover,
                image: AssetImage(widget.postPhoto),
              ),
            ),
          ),
          ...viewModel.addedTexts.map(
            (textItem) => DraggableTextItem(
              textItem: textItem,
              viewModel: viewModel,
            ),
          ),
          Observer(
            builder: (context) {
              return viewModel.showDeleteButton
                  ? Center(
                      child: Container(
                        key: widget.deletButtonKey,
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
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
          )
        ],
      );
    });
  }
}
