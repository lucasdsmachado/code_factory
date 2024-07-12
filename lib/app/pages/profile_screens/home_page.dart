import 'dart:convert';
import 'package:code_factory/app/pages/product_detail.dart';
import 'package:code_factory/app/widgets/others/categories.dart';
import 'package:code_factory/app/widgets/cards/course_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> courses = [];

  @override
  void initState() {
    super.initState();
    loadCourses();
  }

  Future<void> loadCourses() async {
    DatabaseReference coursesRef = FirebaseDatabase.instance.ref('courses');

    try {
      DatabaseEvent event = await coursesRef.once();

      if (event.snapshot.exists) {
        List<Map<String, dynamic>> loadedCourses = [];
        Map<dynamic, dynamic> coursesMap =
            event.snapshot.value as Map<dynamic, dynamic>;

        coursesMap.forEach((key, value) {
          Map<String, dynamic> course = Map<String, dynamic>.from(value as Map);
          loadedCourses.add(course);
        });

        setState(() {
          courses = loadedCourses;
        });
      } else {
        setState(() {
          courses = [];
        });
      }
    } catch (e) {
      // Adicione um tratamento de erros
      print("Erro ao carregar cursos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width *
        0.02; // TODO: ajustar se nescessário

    return Scaffold(
      body: courses.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(children: [
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
                      "Lucas Moreno", // TODO: Adc nome dinamicamente
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
                          child: const Categories(text: "CSS"),
                        ), // TODO: Adicionar dinamicamente
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: const Categories(text: "Flutter"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: const Categories(text: "UI"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: margin),
                          child: const Categories(text: "UX"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CourseCard(
                    nameImage: courses[0]['courseImage'],
                    courseTime: courses[0]['duration'],
                    courseName: courses[0]['courseName'],
                    courseDescription: courses[0]['description'],
                    backgroundCourseColor:
                        Color(int.parse(courses[0]["backgroundCardColor"])),
                    navigateToPage: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    courseName: courses[0]['courseName'],
                                    aboutTheCourse: courses[0]
                                        ['aboutTheCourse'],
                                    price: courses[0]['price'],
                                    duration: courses[0]['duration'],
                                    pathImage: courses[0]['pageDetailsImage'],
                                  )));
                    },
                  ),
                  CourseCard(
                    nameImage: courses[1]['courseImage'],
                    courseTime: courses[1]['duration'],
                    courseName: courses[1]['courseName'],
                    courseDescription: courses[1]['description'],
                    backgroundCourseColor:
                        Color(int.parse(courses[1]["backgroundCardColor"])),
                    navigateToPage: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    courseName: courses[1]['courseName'],
                                    aboutTheCourse: courses[1]
                                        ['aboutTheCourse'],
                                    price: courses[1]['price'],
                                    duration: courses[1]['duration'],
                                    pathImage: courses[1]['pageDetailsImage'],
                                  )));
                    },
                  ),
                  CourseCard(
                    nameImage: courses[2]['courseImage'],
                    courseTime: courses[2]['duration'],
                    courseName: courses[2]['courseName'],
                    courseDescription: courses[2]['description'],
                    backgroundCourseColor:
                        Color(int.parse(courses[2]["backgroundCardColor"])),
                    navigateToPage: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    courseName: courses[2]['courseName'],
                                    aboutTheCourse: courses[2]
                                        ['aboutTheCourse'],
                                    price: courses[2]['price'],
                                    duration: courses[2]['duration'],
                                    pathImage: courses[2]['pageDetailsImage'],
                                  )));
                    },
                  ),
                  CourseCard(
                    nameImage: courses[3]['courseImage'],
                    courseTime: courses[3]['duration'],
                    courseName: courses[3]['courseName'],
                    courseDescription: courses[3]['description'],
                    backgroundCourseColor:
                        Color(int.parse(courses[3]["backgroundCardColor"])),
                    navigateToPage: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    courseName: courses[3]['courseName'],
                                    aboutTheCourse: courses[3]
                                        ['aboutTheCourse'],
                                    price: courses[3]['price'],
                                    duration: courses[3]['duration'],
                                    pathImage: courses[3]['pageDetailsImage'],
                                  )));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ]),
    );
  }
}
