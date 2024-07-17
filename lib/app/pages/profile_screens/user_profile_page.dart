import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/pages/payment_page.dart';
import 'package:code_factory/app/pages/saved_courses.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:code_factory/app/widgets/buttons/profile_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String uid;
  const UserProfilePage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header(
            headerTitle: 'Perfil',
            navigationFunction: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountPages()));
            },
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
            onPressedFunction: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedCoursesPage(userId: uid),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ProfileButton(
            buttonText: "Pagamentos",
            onPressedFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const PaymentPage()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                "Sair do aplicativo",
                style: TextStyle(
                  fontVariations: [FontVariation('wght', 500)],
                ),
              )),
        ],
      ),
    );
  }
}
