import 'package:code_factory/app/widgets/buttons/generic_button.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(
                headerTitle: 'Pagamento',
                navigationFunction: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                height: 253,
                width: 375,
                child: Image.asset(
                  "assets/images/payment_empty_image.png",
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nenhuma forma de pagamento",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontVariations: [FontVariation("wght", 500)],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Você não tem nenhuma Forma de pagamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontVariations: [FontVariation("wght", 400)],
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: GenericButton(
                  buttonText: "Continuar",
                  onPressedFunction: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
