import 'package:code_factory/app/pages/profile_screens/account_settings_page.dart';
import 'package:code_factory/app/pages/profile_screens/home_page.dart';
import 'package:code_factory/app/pages/profile_screens/user_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AccountPages extends StatefulWidget {
  const AccountPages({super.key});

  @override
  State<AccountPages> createState() => _AccountPagesState();
}

class _AccountPagesState extends State<AccountPages> {
  final PageController _pageController = PageController();
  late Map<String, dynamic> userData = {};
  int indexBottonNavBar = 0;

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users/${user.uid}');
      DatabaseEvent event = await userRef.once();
      setState(() {
        userData = Map<String, String>.from(
            event.snapshot.value! as Map<Object?, Object?>);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(name: userData['name'] ?? ''),
          UserProfilePage(),
          AccountSettingsPage(
            name: userData['name'] ?? '',
            email: userData['email'] ?? '',
          ),
        ],
      ),
      bottomNavigationBar: (Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: indexBottonNavBar,
            onTap: (int page) {
              setState(() {
                indexBottonNavBar = page;
              });
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Cursos",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Perfil",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: "Configurações",
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      )),
    );
  }
}
