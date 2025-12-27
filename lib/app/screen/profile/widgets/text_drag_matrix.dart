import 'package:fill_store_bb/app/screen/profile/viewmodels/profile_viewmodel.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/matrix_gesture.dart';
import 'package:fill_store_bb/app/screen/profile/widgets/tools_text_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DraggableTextItem extends StatelessWidget {
  final TextItem textItem;
  final ProfileViewModel viewModel;

  const DraggableTextItem({
    super.key,
    required this.textItem,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: MatrixGesture(
        key: textItem.key,
        onDragUpdate: (offset) {
          viewModel.onDragUpdate(offset, textItem);
        },
        onDragStart: () => viewModel.onDragStart(),
        onDragEnd: (offset) => viewModel.onDragEnd(offset, textItem),
        child: Observer(builder: (_) {
          return GestureDetector(
            onTap: () => viewModel.startEditing(textItem),
            child: viewModel.editingTextItem == textItem
                ? SizedBox(
                    width: 200,
                    child: TextField(
                      controller: viewModel.editTextControl,
                      autofocus: true,
                      style: textItem.textStyle,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => viewModel.finishEditing(),
                    ),
                  )
                : Text(
                    textItem.text,
                    style: textItem.textStyle.copyWith(fontSize: 24),
                  ),
          );
        }),
      ),
    );
  }
}
