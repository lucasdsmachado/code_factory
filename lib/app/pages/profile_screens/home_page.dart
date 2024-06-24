import 'package:code_factory/app/widgets/categories.dart';
import 'package:code_factory/app/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.02; // TODO: AJUSTAR

    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  "Olá:",
                  style: TextStyle(fontSize: 16, fontVariations: [
                    FontVariation("wght", 400),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  "Lucas Moreno", // TODO: Gerar nome dinamicamente
                  style: TextStyle(
                    fontSize: 32,
                    fontVariations: [
                      FontVariation("wght", 700),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Text(
                      "Categoria:",
                      style: TextStyle(
                        fontVariations: [
                          FontVariation("wght", 400),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      child: const Categories(text: "#CSS"),
                    ), // TODO: adicionar dinamicamente
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      child: const Categories(text: "#Flutter"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      child: const Categories(text: "#UI"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: margin),
                      child: const Categories(text: "#UX"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const CourseCard(
                nameImage: "ui_course_image",
                courseTime: "3h 30 min",
                courseName: "UI",
                courseDesciption: "Design avançado de interface móvel",
                backgroundCourseColor: Color(0xFFF8F2EE),
              ),
              const CourseCard(
                nameImage: "html_course_image",
                courseTime: "3h 30 min",
                courseName: "HTML",
                courseDesciption: "Aplicativos web avançados",
                backgroundCourseColor: Color(0xFFE6EDF4),
              ),
              const CourseCard(
                nameImage: "flutter_course_image",
                courseTime: "3h 30 min",
                courseName: "Flutter",
                courseDesciption: "Aplicativos iOS e android avançados",
                backgroundCourseColor: Color(0xFFF8F2EE),
              ),
              const CourseCard(
                nameImage: "scrum_course_image",
                courseTime: "3h 30 min",
                courseName: "Scrum",
                courseDesciption: "Curso avançado de organização de projetos",
                backgroundCourseColor: Color(0xFFE6EDF4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
