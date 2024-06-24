import 'package:code_factory/app/widgets/categories.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
              child: Text(
                "HTML", //TODO: Gerar dinamicamente
                style: TextStyle(
                  fontSize: 24,
                  fontVariations: [FontVariation('wght', 500)],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/html_course_page_image.png",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 30),
                child: Categories(text: "R\$ 50"),
              ),
            ],
          ),
          const Text("Sobre o curso",
              style: TextStyle(
                fontSize: 24,
                fontVariations: [FontVariation("wght", 500)],
              )),
          Text(
              "Você pode iniciar uma nova carreira em desenvolvimento web mento hoje aprendendo HTML e CSS. Tudo que você precisa é de um computador, um pouco de tempo, muita determinação e um professor em quem você confie.",
              style: TextStyle(
                fontVariations: [FontVariation("wght", 400)],
              ))
        ],
      ),
    );
  }
}
