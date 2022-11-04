import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/presentation/constants/measurement.dart';
import 'package:my_portfolio/presentation/home_view/widgets/top_logo.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../logic/theme_provider.dart';
import '../resume_view/resume_view.dart';
class HomePortrait extends StatelessWidget {
  final bool isLarge;

  const HomePortrait({Key? key, required this.isLarge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.screenHeight() * 0.6,
          width: context.screenWidth(),
          color: const Color(0xff82AED1),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ShowUpAnimation(
                  direction: Direction.horizontal,
                  child: SizedBox(
                    height: context.screenHeight() * 0.35,
                    child: Image.asset("assets/images/blob.png"),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ShowUpAnimation(
                  direction: Direction.horizontal,
                  child: SizedBox(
                    height: context.screenHeight() * 0.35,
                    child: Image.asset("assets/images/me.png"),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 15,
                right: 15,
                child: Row(
                  children: [
                    const TopLogo(
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Consumer(
                      builder: (_, ref, __) {
                        final themeData = ref.watch(themeProvider).isDark;

                        return GestureDetector(
                          onTap: () {
                            ref.read(themeProvider).toggleTheme(themeData);
                          },
                          child: Icon(
                            themeData
                                ? FontAwesomeIcons.solidSun
                                : FontAwesomeIcons.solidMoon,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 15,
                child: ShowUpAnimation(
                  direction: Direction.horizontal,
                  offset: -1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: isLarge ? 50 : 30,
                                width: isLarge ? 50 : 30,
                                child:
                                Image.asset('assets/images/gmail.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Umarkhalifa138@gmail.com",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isLarge ? 17 : 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ShowUpAnimation(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Umar Khalifa",
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: isLarge ? 25 : 20),
                  ),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: isLarge ? 30 : 25,
                        color: theme.colorScheme.onBackground),
                  ),
                  SizedBox(
                    height: context.screenHeight() * 0.03,
                  ),
                  Text(
                    "I will tell you how i'm the best to help you make your product successful",
                    style: TextStyle(
                        color: Colors.grey, fontSize: isLarge ? 20 : 15),
                  ),
                  SizedBox(
                    height: context.screenHeight() * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResumeView(),
                        ),
                      );
                    },
                    child: Container(
                      height: context.screenHeight() * 0.06,
                      width: context.screenWidth() * 0.4,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(17)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Resume",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: isLarge ? 22 : 17),
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.arrow_forward_rounded,color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
