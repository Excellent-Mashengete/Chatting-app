import 'package:cached_network_image/cached_network_image.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatState();
}

class _ChatState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    final myProfile = Provider.of<GetUser>(context);
    if (myProfile.profilepic.isEmpty) {
      myProfile.getProfile();
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Chats'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, profile);
                  },
                  child: Stack(
                    children: <Widget>[
                      Consumer<GetUser>(
                      builder: (context, profile, child) {
                        if ( profile.profilepic.isNotEmpty) {
                          return  ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: CachedNetworkImage(
                              imageUrl: profile.profilepic,
                            ),
                          );
                        }else{
                          return const CircularProgressIndicator();
                        }
                      }
                      ),
                     
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          width: 20 / 2,
                          height: 20 / 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                "Messages",
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: ThemeConstants.dark2Color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeConstants.dark2Color.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: "Search",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: ThemeConstants.light1Color,
                    ),
                  ],
                ),
              ),
            ),
            const ActiveChats(),
            const RecentChats(),
          ],
        ),
      ),
    );
  }
}

/*
 px.avatar,
                          height: 55,
                          width: 55,
                          */