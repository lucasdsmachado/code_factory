import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/widgets/buttons/generic_button.dart';
import 'package:code_factory/app/widgets/cards/intro_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: _controller,
                  children: const [
                    CardWidget(
                      imagePath: 'assets/images/intro_1.png',
                      title: 'Aprenda a qualquer hora e em qualquer lugar',
                      description:
                          'Sempre é o momento perfeito para passar o tempo dia aprendendo algo novo, de qualquer lugar!',
                    ),
                    CardWidget(
                      imagePath: 'assets/images/intro_2.png',
                      title: 'Encontre um curso para você',
                      description:
                          'O conhecimento não tem fronteiras, nem o seu potencial. Explore um novo universo hoje!',
                    ),
                    CardWidget(
                      imagePath: 'assets/images/intro_3.png',
                      title: 'Aperfeiçoe suas habilidades',
                      description:
                          'O aprendizado é a única aventura que dura a vida toda.',
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
              const SizedBox(height: 94),
              GenericButton(
                buttonText: currentPage == 2 ? 'Vamos começar' : 'Próximo',
                onPressedFunction: currentPage == 2
                    ? () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          )
                        }
                    : () => _controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          Positioned(
            top: 32,
            right: 0,
            child: TextButton(
              onPressed: () => _controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontVariations: [FontVariation('wght', 500)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
