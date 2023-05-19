import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({super.key});
  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  bool emojiShowing = false;
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WillPopScope(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin:const  EdgeInsets.only(
                              left: 2, right: 2, bottom: 8
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    sendButton = true;
                                  });
                                } else {
                                  setState(() {
                                    sendButton = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: const TextStyle(color: Colors.grey),
                                prefixIcon: IconButton(
                                  icon: Icon(show
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined,
                                  ),
                                  onPressed: () {
                                    if (!show) {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                    }
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor:
                                          Colors.transparent,
                                          context: context,
                                          builder: (builder) =>
                                            bottomSheet(context),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon:const Icon(Icons.camera_alt),
                                      onPressed: () {
                                        // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (builder) =>
                                              //             CameraApp()));
                                      },
                                    ),
                                  ],
                                ),
                                      contentPadding: const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 2,
                            left: 2,
                          ),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xFF128C7E),
                            child: IconButton(
                              icon: Icon(
                                sendButton ? Icons.send : Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (sendButton) {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration:const Duration(milliseconds: 300),
                                    curve: Curves.easeOut
                                  );      
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    show ? emojies(context) : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
        onWillPop: () {
          if (show) {
            setState(() {
              show = false;
            });
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
      ),
    );
  }

  Widget bottomSheet(context) {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ThemeConstants.dark2Color,
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file, Colors.indigo,
                      "Document", () {}),
                  const SizedBox(width: 40),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera", () {
                    Navigator.pushNamed(context, camera);
                  }),
                  const SizedBox(width: 40),
                  iconcreation(
                      Icons.insert_drive_file, Colors.purple, "Gallery", () {}),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio", () {}),
                  const SizedBox(width: 40),
                  iconcreation(Icons.person, Colors.blue, "Contact", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(
      IconData icon, Color color, String text, VoidCallback? pressed) {
    return InkWell(
      onTap: pressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: ThemeConstants.light1Color,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget emojies(context) {
    return Offstage(
      offstage: !show,
      child: SizedBox(
        height: 250,
                  child: EmojiPicker(
                    textEditingController: _controller,
                    config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.30
                              : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      loadingIndicator: const SizedBox.shrink(),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL,
                      checkPlatformCompatibility: true,
                    ),
                  ),),
    );
  }
}


/*return Container(
      height: 65,
      decoration: BoxDecoration(color: ThemeConstants.dark2Color, boxShadow: [
        BoxShadow(
          color: ThemeConstants.dark2Color.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 3),
        )
      ]),

      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconBorder(
                    icon: Icons.add,
                    size: 25,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: ThemeConstants.dark2Color,
                        context: context,
                        builder: (builder) => bottomSheet(context),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: IconBorder(
                    icon: Icons.emoji_emotions_outlined,
                    size: 25,
                    onTap: () {
                      setState(() {
                        emojiShowing = !emojiShowing;
                      });
                    
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 270,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconBorder(
                    icon: Icons.send,
                    size: 25,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Offstage(
                offstage: !emojiShowing,
                child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
             
                      config: Config(
                        columns: 7,
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 32 *
                            (foundation.defaultTargetPlatform ==
                                    TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        replaceEmojiOnLimitExceed: false,
                        noRecents: const Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: const SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                        checkPlatformCompatibility: true,
                      ),
                    )),
              ),
          ],
        ),
      ),
      */