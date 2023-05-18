import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final myProfile = Provider.of<GetUser>(context);
    if (myProfile.userList.isEmpty) {
      myProfile.getUserProfile();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Profile", textAlign: TextAlign.center)],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView.builder(
            itemCount: myProfile.userList.length,
            itemBuilder: (context, index) {
              User prof = myProfile.userList[index];
              return Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4, 
                              color: ThemeConstants.light1Color
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color:
                                  ThemeConstants.dark2Color.withOpacity(0.1),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(prof.avatar!),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: ThemeConstants.dark2Color,
                                context: context,
                                builder: (builder) => bottomSheet(context),
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: ThemeConstants.light1Color
                                ),
                                color: ThemeConstants.light1Color
                              ),
                              child: const Icon(
                                CupertinoIcons.camera_fill,
                                color: ThemeConstants.dark1Color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  buildTextField("${prof.firstname!}  ${prof.lastname!}", true),
                  buildTextField(prof.email!, false),
                  buildTextField(prof.phoneNumber!, false),
                  const SizedBox(height: 40),
                  ButtonWidget(text: "Logout", press: () {})
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ThemeConstants.dark2Color,
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile Picture",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  iconcreation(
                    Icons.camera_alt,
                    Colors.pink,
                    "Camera",
                    () {
                      Navigator.pushNamed(context, profileUpdate);
                    },
                  ),
                  const SizedBox(width: 40),
                  iconcreation(
                    CupertinoIcons.photo_fill,
                    Colors.indigo,
                    "Gallery",
                    () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String placeholder,  bool type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        readOnly: type,
        initialValue: placeholder,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey
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
            radius: 20,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 20,
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
}
