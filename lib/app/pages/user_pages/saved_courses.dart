import 'package:code_factory/app/pages/user_pages/account_pages.dart';
import 'package:code_factory/app/pages/course_pages/product_detail.dart';
import 'package:code_factory/app/widgets/buttons/generic_button.dart';
import 'package:code_factory/app/widgets/cards/course_card.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SavedCoursesPage extends StatefulWidget {
  final String userId;
  const SavedCoursesPage({super.key, required this.userId});

  @override
  State<SavedCoursesPage> createState() => SavedCoursesPageState();
}

class SavedCoursesPageState extends State<SavedCoursesPage> {
  List<Map<String, dynamic>> savedCourses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSavedCourses();
  }

  Future<void> loadSavedCourses() async {
    DatabaseReference savedCoursesRef =
        FirebaseDatabase.instance.ref('users/${widget.userId}/savedCourses');

    try {
      DatabaseEvent event = await savedCoursesRef.once();
      if (event.snapshot.exists) {
        List<Map<String, dynamic>> loadedCourses = [];
        Map<dynamic, dynamic> savedCoursesMap =
            event.snapshot.value as Map<dynamic, dynamic>;

        for (var courseId in savedCoursesMap.keys) {
          DatabaseReference courseRef =
              FirebaseDatabase.instance.ref('courses/$courseId');
          DataSnapshot courseSnapshot = await courseRef.get();
          if (courseSnapshot.exists) {
            Map<String, dynamic> course =
                Map<String, dynamic>.from(courseSnapshot.value as Map);
            course['courseId'] = courseId;
            loadedCourses.add(course);
          }
        }

        setState(() {
          savedCourses = loadedCourses;
          isLoading = false;
        });
      } else {
        setState(() {
          savedCourses = [];
          isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao carregar cursos salvos: $e",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  void _removeCourse(int index) async {
    String courseId = savedCourses[index]['courseId'];
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference savedCoursesRef =
        FirebaseDatabase.instance.ref('users/$userId/savedCourses/$courseId');

    try {
      await savedCoursesRef.remove();

      setState(() {
        savedCourses.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Curso Removido dos Salvos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao remover curso: $e",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(
                      headerTitle: 'Salvos',
                      navigationFunction: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountPages(),
                          ),
                        );
                      },
                    ),
                    if (savedCourses.isEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 127),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Image.asset(
                              "assets/images/saved_courses_image.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Cursos não salvos",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontVariations: [
                                      FontVariation("wght", 500)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Tente salvar o curso novamente em alguns minutos',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation("wght", 400)
                                    ],
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 72),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: GenericButton(
                              buttonText: "Continuar",
                              onPressedFunction: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountPages(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    else
                      ...savedCourses.map(
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
                          longPress: () =>
                              _removeCourse(savedCourses.indexOf(course)),
                        ),
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}
