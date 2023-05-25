import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:chattingapp/service/chats_users_api_service.dart';
import 'package:chattingapp/widgets/skeleton.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatState();
}

class _ChatState extends State<Chats> {
  final MessageApiClient _apiClient = MessageApiClient();
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3));
    _fetchData();
    super.initState();
  }

  final List<ChatResponseModel> userchats = [];

  Future<void> _fetchData() async {
    _apiClient.getAllChats().then((value) => {
      if (value != null) {
        setState(() {
          isLoading = false;
        }),
        if (value.chats!.isNotEmpty) {
          setState(() {
            userchats.addAll(value.chats as Iterable<ChatResponseModel>);
          }),
        }else{
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.error!))),
        }
      },
    });
  }

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
                      Consumer<GetUser>(builder: (context, profile, child) {
                        if (profile.profilepic.isNotEmpty) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.network(
                              profile.profilepic.toString(),
                              fit: BoxFit.cover,
                            )
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
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
        onRefresh: () async {
          _fetchData();
        },
        child: Column(
          children: [
            const SizedBox(height: 5),
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
            isLoading
              ? Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => const ChatsLoader(),
                    separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                    itemCount: 6
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: userchats.length,
                    itemBuilder: (context, index){
                      return RecentChats(chats: userchats[index]);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class ChatsLoader extends StatelessWidget {
  const ChatsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const Skeleton(
            height: 50,
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Skeleton(
                  width: 80,
                  height: 8,
                ),
                Skeleton(
                  width: 150,
                  height: 8,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Skeleton(
                  width: 35,
                  height: 8,
                ),
                SizedBox(
                  height: 4,
                ),
                Skeleton(
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
