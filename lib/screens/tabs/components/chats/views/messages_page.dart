import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Messages extends StatefulWidget {
  const Messages({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late MessageData messageData;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    messageData = widget.messageData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            backgroundColor: ThemeConstants.dark2Color,
            leadingWidth: 50,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 24),
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, contactprofile,
                    arguments: messageData);
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      messageData.profilePicture,
                      height: 45,
                      width: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(messageData.senderName),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: IconBorder(
                    icon: CupertinoIcons.video_camera_solid,
                    size: 25,
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: IconBorder(
                    icon: CupertinoIcons.phone_fill,
                    size: 25,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Column(
            children: [
              Expanded(
                // child: ListView.builder(
                //   shrinkWrap: true,
                //   controller: _scrollController,
                //   itemCount: messageData.message.length + 1,
                //   itemBuilder: (context, index) {
                //     if (index == messageData.message.length) {
                //       return Container(
                //         height: 70,
                //       );
                //     }
                //     if (messages[index].type == "source") {

                //     } else {
                //       return ReplyCard(
                //         message: messages[index].message,
                //         time: messages[index].time,
                //       );
                //     }
                //   },
                // ),
                child: ListView(children: [
                    ReplyCard(
                    message:
                        'Hey there actually I have one problem code, don\'t get any idea howt to develop a code is very good thing ',
                    time: "12:80",
                  ),
                  Incomming(
                    message:
                        "Hi, developers How are you kjgkfjdgkj lkjglkjrklgtj jrt",
                    time: "12:80",
                  ),
               
                ]),
              ),
            ],
          ),
          onWillPop: () {
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
