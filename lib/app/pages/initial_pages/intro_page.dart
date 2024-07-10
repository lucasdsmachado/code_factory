import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/widgets/generic_button.dart';
import 'package:code_factory/app/widgets/intro_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                CardWidget(
                  imagePath: 'assets/images/intro_1.png',
                  title: 'Aprenda a qualquer hora e em qualquer lugar',
                  description:
                      'Sempre é o momento perfeito para passar o tempo dia aprendendo algo novo, de qualquer lugar!',
                  marginTop: heightSize * 0.1,
                ),
                CardWidget(
                  imagePath: 'assets/images/intro_2.png',
                  title: 'Encontre um curso para você',
                  description:
                      'O conhecimento não tem fronteiras, nem o seu potencial. Explore um novo universo hoje!',
                  marginTop: heightSize * 0.4,
                ),
                CardWidget(
                  imagePath: 'assets/images/intro_3.png',
                  title: 'Aperfeiçoe suas habilidades',
                  description:
                      'O aprendizado é a única aventura que dura a vida toda.',
                  marginTop: heightSize * 0.15,
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.blue,
              dotHeight: 6,
              dotWidth: 6,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GenericButton(
              buttonText: currentPage == 2 ? 'Vamos começar' : 'Próximo',
              onPressedFunction: currentPage == 2
                  ? () => Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LoginPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child!,
                            );
                          },
                        ),
                      )
                  : () => _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
