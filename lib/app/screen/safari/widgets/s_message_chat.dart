import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/safari/viewmodel/safari_viewmodel.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_nessage_user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SMessageChat extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool status;

  const SMessageChat({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();
    final viewModel = getIt.get<SafariViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 1
            ? Scaffold(
                appBar: ConstAppBar(
                  isMessageChat: true,
                  title: "Mesajlar",
                  userContent: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: UserInfo(name: name, status: status),
                  ),
                ),
                body: Column(
                  children: [
                    AspectRatio(aspectRatio: 181 / 11),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        itemCount: viewModel.messages.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: DeviceConfig.screenWidth! * 0.6,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: cWhite,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      viewModel.messages[index],
                                      style: Tstyle.subStyle(
                                          textSize: 16,
                                          fontW: FontWeight.w600,
                                          color: cTextBlack),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "12:46",
                                    style: Tstyle.subStyle(
                                        textSize: 12,
                                        fontW: FontWeight.w500,
                                        color: cTextBlack),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints(
                              minHeight: 40, maxHeight: viewModel.maxHeight),
                          decoration: BoxDecoration(
                            color: const Color(0xffE1E1E1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: viewModel.messageController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            onChanged: (_) => viewModel.updateHeight(),
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                              hintText: "Bir mesaj yaz",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          viewModel.sendMessage();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xffE1E1E1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : MainView());
  }
}
