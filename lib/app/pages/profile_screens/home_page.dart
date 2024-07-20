import 'package:code_factory/app/pages/course_pages/product_detail.dart';
import 'package:code_factory/app/widgets/others/categories.dart';
import 'package:code_factory/app/widgets/cards/course_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

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
          course['courseId'] = key;
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
      // TODO: Adicione um tratamento de erros
      print("Erro ao carregar cursos: $e");
    }
  }

  void _saveCourse(int index) async {
    String courseId = courses[index]['courseId'];
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference savedCoursesRef =
        FirebaseDatabase.instance.ref('users/$userId/savedCourses/$courseId');

    try {
      await savedCoursesRef.set(true);
      showSucessSnackBar(context, "Curso Salvo com Sucesso");
    } catch (e) {
      showErrorSnackBar(context, 'Erro ao salvar curso: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width *
        0.02; 

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
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
                        ), 
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ...courses.map(
                (course) => CourseCard(
                  nameImage: course['courseImage'],
                  courseTime: course['duration'],
                  courseName: course['courseName'],
                  courseDescription: course['description'],
                  backgroundCourseColor:
                      Color(int.parse(course["backgroundCardColor"])),
                  navigateToPage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          courseName: course['courseName'],
                          aboutTheCourse: course['aboutTheCourse'],
                          price: course['price'],
                          duration: course['duration'],
                          pathImage: course['pageDetailsImage'],
                        ),
                      ),
                    );
                  },
                  longPress: () => {
                    _saveCourse(courses.indexOf(course)),
                  },
                ),
              ),
            ]),
    );
  }
}
