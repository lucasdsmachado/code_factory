import 'package:code_factory/app/widgets/categories.dart';
import 'package:code_factory/app/widgets/generic_button.dart';
import 'package:code_factory/app/widgets/header.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String courseName;
  final String aboutTheCourse;
  final int price;
  final String pathImage;
  final String duration;

  const ProductDetail(
      {super.key,
      required this.courseName,
      required this.aboutTheCourse,
      required this.price,
      required this.duration,
      required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              headerTitle: courseName,
              navigationFunction: () {
                Navigator.pop(context);
              },
            ),
            Image.asset(
              "assets/images/$pathImage",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 30),
                  child: Categories(text: "R\$ ${price.toString()}"),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sobre o curso",
                      style: TextStyle(
                        fontSize: 24,
                        fontVariations: [FontVariation("wght", 500)],
                      )),
                  Text(aboutTheCourse,
                      style: const TextStyle(
                        fontVariations: [FontVariation("wght", 400)],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(duration,
                      style: const TextStyle(
                        fontSize: 24,
                        fontVariations: [FontVariation("wght", 500)],
                      )),
                  const Text("1h 30 min",
                      style: TextStyle(
                        fontVariations: [FontVariation("wght", 400)],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: GenericButton(
                  buttonText: "Adicionar ao carrinho",
                  onPressedFunction: () {}),
            )
          ],
        ),
      ],
    ));
  }
}
