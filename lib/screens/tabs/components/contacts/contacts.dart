import 'dart:math';
import 'package:chattingapp/common/common.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late List contacts = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getContactPermissions();
  }

  void getContactPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      fetchContact();
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void fetchContact() async {
    contacts = await ContactsService.getContacts(withThumbnails: false, orderByGivenName: true);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Contacts'), automaticallyImplyLeading: false),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: ThemeConstants.dark1Color.withOpacity(0.1),
                            offset: const Offset(-3, 3),
                          ),
                          BoxShadow(
                            blurRadius: 7,
                            color: ThemeConstants.dark2Color.withOpacity(0.7),
                            offset: const Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(35),
                        color: ThemeConstants.light1Color,
                      ),
                      child: Text(
                       contacts[index].displayName![0],
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  title: Text(
                    contacts[index].displayName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18,
                        color: ThemeConstants.light1Color,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    contacts[index].phones![0].value,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: ThemeConstants.light1Color.withOpacity(0.7),
                    ),
                  ),
                  horizontalTitleGap: 12,
                );
              },
            ),
    );
  }
}

