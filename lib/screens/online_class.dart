import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineClass extends StatelessWidget {
  const OnlineClass({super.key});

  List<Widget> generateStars() {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        const Icon(Icons.star, color: Color(0xFFF4C465), size: 20),
      );
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF29274F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 0, 10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Online',
                    style: defaultStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Master Class', style: defaultStyle),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CourseTypes(
                          leftImagePosition: -13,
                          colorOfButton: Color(0xFFAEA7ED),
                          courseTitle: 'UI/UX DESIGNER \nBEGINNER',
                          gradientColors: [
                            Color(0xFF817AD4),
                            Color(0xFF625BB5),
                          ],
                          textOfButton: 'Recommended',
                          courseImage: 'assets/images/img_saly10.png',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CourseTypes(
                          bottomImagePosition: 10,
                          colorOfButton: Color(0xFFE59B60),
                          courseTitle: 'GRAPHICS \nMASTER',
                          gradientColors: [
                            Color(0xFFE4965F),
                            Color(0xFFD4665A),
                          ],
                          textOfButton: 'NEW CLASS',
                          courseImage: 'assets/images/img_saly36.png',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Free online class',
                          style: defaultStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '\nFrom over 80 Lectures',
                          style: defaultStyle.copyWith(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Stack(
                  children: [
                    Container(
                      width: size.width - 45,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D396C),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Transform.translate(
                        offset: const Offset(20, -45),
                        child: Image.asset(
                          'assets/images/img_saly24.png',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(size.width - 77, 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/play.svg',
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 155,
                      top: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Developer',
                            style: defaultStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '8 Hours',
                            style: defaultStyle.copyWith(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              ...generateStars(),
                            ],
                          )
                        ],
                      ),
                    )
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

class CourseTypes extends StatelessWidget {
  const CourseTypes({
    super.key,
    this.gradientColors,
    this.colorOfButton,
    this.textOfButton,
    this.courseTitle,
    this.courseImage,
    this.leftImagePosition,
    this.bottomImagePosition,
  });

  final List<Color>? gradientColors;
  final Color? colorOfButton;
  final String? textOfButton;
  final String? courseTitle;
  final String? courseImage;
  final double? leftImagePosition;
  final double? bottomImagePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors!),
            borderRadius: BorderRadius.circular(17),
          ),
          width: 200,
          height: 250,
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.18),
                ),
              ],
              color: colorOfButton!,
              borderRadius: BorderRadius.circular(15),
            ),
            width: 110,
            height: 30,
            child: Center(
              child: Text(
                textOfButton!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 60,
          child: Text(
            courseTitle!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: leftImagePosition,
          bottom: bottomImagePosition,
          child: Image.asset(
            courseImage!,
            width: 250,
            height: 250,
          ),
        )
      ],
    );
  }
}

TextStyle defaultStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
));

/*

Source: https://github.com/abdullah0912/OnlineCourseAppUI?ref=flutterawesome.com

 */

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color(0xFF29274F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: isPortrait ? size.height / 2.5 : size.height / 1.5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFE4965F),
                            Color(0xFFD4665A),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: isPortrait ? -110 : -92,
                    child: FractionallySizedBox(
                      widthFactor: isPortrait ? 0.6 : 0.45,
                      child: const Image(
                        image: AssetImage('assets/images/img_saly36.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
