import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/pages/profile_button.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final PageController _pageController = PageController();
  int indexBottonNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 24,
                  fontVariations: [FontVariation('wght', 500)],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 4.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileButton(
              buttonText: "Seus Cursos",
              onPressedFunction: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            ProfileButton(
              buttonText: "Salvos",
              onPressedFunction: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            ProfileButton(
              buttonText: "Pagamentos",
              onPressedFunction: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Sair do aplicativo",
                  style: TextStyle(
                      fontVariations: [FontVariation('wght', 500)],
                      color: Colors.black45),
                )),
          ],
        ),
        Container(
          color: Colors.red,
        )
      ]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: BottomNavigationBar(
          currentIndex: indexBottonNavBar,
          onTap: (int page) {
            setState(() {
              indexBottonNavBar = page;
            });
            _pageController.animateToPage(
              page,
              duration: const Duration(microseconds: 300),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Perfil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Perfil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Perfil",
            ),
          ],
          backgroundColor: Colors.grey[300], // Define a cor de fundo
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
