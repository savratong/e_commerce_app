import 'package:e_commerce_app/views/home/drawer/widget/profile_screen.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  child: Image.asset(
                    'assets/images/owner_profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
                accountName: const Text(""),
                accountEmail: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Savra Tong",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Personal account"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                          onPressed: (() {}),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(
                                  0), // Removed shadow
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              side: MaterialStateProperty.all(const BorderSide(
                                  width: 1, color: Colors.white)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          child: const Text("Switch")),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.favorite),
                title: const Text("Favorite"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.list_alt_outlined),
                title: const Text("Orders"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.save_outlined),
                title: const Text("Vouchers"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.pin_drop_rounded),
                title: const Text("Addresses"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.payment),
                title: const Text("Payments methods"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.help),
                title: const Text("Help center"),
              ),
              Divider(
                height: 5,
                color: Colors.grey.shade900,
              ),
              ListTile(
                onTap: () {},
                title: const Text("Settings"),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Term & Conditions / Privacy"),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
