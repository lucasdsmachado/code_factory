
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String nameImage;
  final String courseTime;
  final String courseName;
  final String courseDesciption;
  final Color backgroundCourseColor;

  const CourseCard({
    super.key,
    required this.nameImage,
    required this.courseTime,
    required this.courseName,
    required this.courseDesciption, required this.backgroundCourseColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26)),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Center(
                  child: Container(
                      color:  backgroundCourseColor,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 1 / 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset("assets/images/$nameImage.png"),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  children: [
                    Text(courseTime,
                        style: const TextStyle(
                            color: Color(0xFF5BA092),
                            fontVariations: [FontVariation("wght", 500)],
                            fontSize: 12))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  children: [
                    Text(courseName,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontVariations: [FontVariation("wght", 500)],
                            fontSize: 24))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  children: [
                    Text(courseDesciption,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontVariations: [FontVariation("wght", 400)],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}