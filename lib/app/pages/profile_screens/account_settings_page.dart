import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/widgets/account_information_card.dart';
import 'package:code_factory/app/widgets/header.dart';
import 'package:flutter/material.dart';

// TODO: Gerar os dados do usuário dinamicamente

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

bool _toggleNotifications = true;

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
          const SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: ListTile(
                  leading: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 14,
                        ),
                      )),
                  title: const Text(
                    "Notificaçoes",
                    style: TextStyle(
                      fontVariations: [FontVariation('wght', 500)],
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    icon: _toggleNotifications
                        ? const Icon(Icons.toggle_off, size: 40)
                        : const Icon(
                            Icons.toggle_on,
                            size: 40,
                            color: Colors.blueGrey
                          ),
                    onPressed: () {
                      setState(() {
                        _toggleNotifications = !_toggleNotifications;
                      });
                    },
                  ),
                ),
              ),
            ),
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
