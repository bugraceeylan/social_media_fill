import 'dart:io';

import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EffectsList extends StatelessWidget {
  final String selectedPostPhotoEffect;

  const EffectsList({super.key, required this.selectedPostPhotoEffect});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<ProfileViewModel>();

    return Observer(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: viewModel.effectMatrices.keys.map((effect) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  viewModel
                      .setSelectedEffect(effect); // Seçilen efekti güncelle
                  viewModel.applyEffect(viewModel.effectMatrices[effect]!);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Observer(
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            width: 76,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                colorFilter: ColorFilter.matrix(
                                    viewModel.effectMatrices[effect]!),
                                fit: BoxFit.cover,
                                image: FileImage(File(selectedPostPhotoEffect)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        effect,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
