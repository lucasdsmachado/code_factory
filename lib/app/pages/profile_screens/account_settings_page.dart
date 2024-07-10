import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/widgets/cards/account_information_card.dart';
import 'package:code_factory/app/widgets/cards/switch_cards.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:flutter/material.dart';

// TODO: Gerar os dados do usuário dinamicamente

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(
            headerTitle: 'Configurações',
            navigationFunction: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountPages()));
            },
          ),
          Image.asset(
            "assets/images/settings_image.png",
            height: MediaQuery.of(context).size.height * 0.40,
          ),
          const SizedBox(height: 20),
          const SwitchCards(
            cardTitle: 'Tema',
            cardIcon: Icons.contrast,
            trackColor: Colors.black87,
          ),
          const SizedBox(height: 20),
          const SwitchCards(
            cardTitle: 'Notificações',
            cardIcon: Icons.notifications,
            trackColor: Color(0xff5BA092),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 30, bottom: 10),
            child: Text("Informações da conta",
                style: TextStyle(
                  fontVariations: [FontVariation('wght', 500)],
                  fontSize: 20,
                )),
          ),
          const AccountInformationCard(
            cardTitle: "Nome",
            cardIcon: Icons.person,
            cardSubtitle: 'Lucas Moreno',
          ),
          const SizedBox(
            height: 10,
          ),
          const AccountInformationCard(
            cardTitle: "Email",
            cardIcon: Icons.email,
            cardSubtitle: 'Lucas@mail.com',
          ),
          const SizedBox(
            height: 10,
          ),
          const AccountInformationCard(
            cardTitle: "Senha",
            cardIcon: Icons.lock,
            cardSubtitle: 'Alterado há duas semanas',
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
