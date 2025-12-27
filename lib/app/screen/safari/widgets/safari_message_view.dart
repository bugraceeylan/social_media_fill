import 'package:fill_store_bb/app/components/AppBar/const_appbar.dart';
import 'package:fill_store_bb/app/components/navigation/navigation.dart';
import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/media_config.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:fill_store_bb/app/get_it/get_it.dart';
import 'package:fill_store_bb/app/screen/main/view/main_view.dart';
import 'package:fill_store_bb/app/screen/main/viewmodel/main_viewmodel.dart';
import 'package:fill_store_bb/app/screen/main/widgets/botttom_navbar.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_message_box.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_message_chat.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/s_message_request.dart';
import 'package:fill_store_bb/app/screen/safari/widgets/search_user_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SafariMessageView extends StatefulWidget {
  const SafariMessageView({super.key});

  @override
  State<SafariMessageView> createState() => _SafariMessageViewState();
}

class _SafariMessageViewState extends State<SafariMessageView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = getIt.get<MainViewModel>();

    return Observer(
        builder: (context) => mainViewModel.selectedIndex == 1
            ? Scaffold(
                appBar: const ConstAppBar(
                  title: "Mesajlar",
                  widget: Icon(
                    Icons.add_circle_outline_outlined,
                    size: 28,
                  ),
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CupertinoSlidingSegmentedControl<int>(
                          groupValue: _selectedIndex,
                          thumbColor: Colors.blue,
                          backgroundColor: Colors.white,
                          children: {
                            0: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Arkadaşlar",
                                style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            1: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Mesaj İstekleri",
                                style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          },
                          onValueChanged: (int? newIndex) {
                            if (newIndex != null) {
                              setState(() {
                                _selectedIndex = newIndex;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (widget, animation) {
                          final isNext = _selectedIndex == 1;
                          final offset =
                              isNext ? const Offset(1, 0) : const Offset(-1, 0);
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: offset,
                              end: Offset.zero,
                            ).animate(animation),
                            child: widget,
                          );
                        },
                        child: _selectedIndex == 0
                            ? Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  SearchUser(),
                                  AspectRatio(aspectRatio: 181 / 11),
                                  UserMessageBox(
                                    senderPhoto: '',
                                    senderName: 'burakbulut',
                                    senderLastMessage:
                                        '"Bugün harika bir gün geçirdim. Yeni yerler keşfettim, harika..."',
                                    senderTime: '14:40',
                                    onPressed: () {
                                      Navigation.push(
                                          page: SMessageChat(
                                        imageUrl: '',
                                        name: 'burakbulut',
                                        status: true,
                                      ));
                                    },
                                  ),
                                ],
                              )
                            : SendMessageReq(
                                senderPhoto: '',
                                senderName: 'burakbulut',
                                senderLastMessage:
                                    '"Bugün harika bir gün geçirdim. Yeni yerler keşfettim, harika..."',
                                senderTime: '14:40',
                              )),
                  ],
                ),
                bottomNavigationBar:
                    BottomNavBarWidget(viewModel: mainViewModel),
              )
            : MainView());
  }
}
