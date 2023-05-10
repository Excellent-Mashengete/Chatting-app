import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: ThemeConstants.dark2Color, boxShadow: [
        BoxShadow(
          color: ThemeConstants.dark2Color.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 3),
        )
      ]),
      child: Row(
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
                    builder: (builder) => bottomSheet(context));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconBorder(
              icon: Icons.emoji_emotions_outlined,
              size: 25,
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerRight,
              width: 270,
              child: TextFormField(
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
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(width: 40),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(width: 40),
                  iconcreation(
                      Icons.insert_drive_file, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(width: 40),
                  iconcreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return Column(
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
    );
  }

}
