import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/widgets/profile_button.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())); // TODO: sair do app
            },
            child: const Text(
              "Sair do aplicativo",
              style: TextStyle(
                  fontVariations: [FontVariation('wght', 500)],
                  color: Colors.black45),
            )),
      ],
    );
  }
}