import 'package:code_factory/app/pages/screens/account_settings_page.dart';
import 'package:code_factory/app/pages/screens/user_profile_page.dart';
import 'package:flutter/material.dart';

class AccountPages extends StatefulWidget {
  const AccountPages({super.key});

  @override
  State<AccountPages> createState() => _AccountPagesState();
}

class _AccountPagesState extends State<AccountPages> {
  final PageController _pageController = PageController(initialPage: 1);
  int indexBottonNavBar = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Center(
            child: Text("Cursos"),
          ),
          UserProfilePage(),
          AccountSettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
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
      ),
    );
  }
}
