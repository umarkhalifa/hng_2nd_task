import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/presentation/constants/measurement.dart';
import 'package:my_portfolio/presentation/resume_view/widgets/resume_view/link_card.dart';
import 'package:my_portfolio/presentation/resume_view/widgets/resume_view/skill_card.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../logic/theme_provider.dart';
import '../home_view/home_view.dart';

class ResumeLandScape extends StatelessWidget {
  const ResumeLandScape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          height: context.screenHeight(),
          width: context.screenWidth() * 0.5,
          color: theme.colorScheme.secondary,
          child: Stack(
            children: [
              Positioned(
                top:7,
                left: 7,
                right: 7,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()),
                            (route) => false);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
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
                bottom: 0,
                left: 20,
                right: 20,
                child: ShowUpAnimation(child: Image.asset('assets/images/me.png')),
              ),
              Positioned(
                bottom: 15,
                left: 7,
                right: 7,
                child: Row(
                  children: [
                    Expanded(
                      child: DetailCard(
                        url: 'https://mobile.twitter.com/umar_khalifa5',
                        theme: theme,
                        image: "assets/images/github.png",
                        label: "Twitter",
                        hint: "Follow me",
                        isLandScape: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DetailCard(
                        url: "https://www.instagram.com/invites/contact/?i=3syyi5imd86j&utm_content=i1jiilz",
                        theme: theme,
                        image: "assets/images/instagram.png",
                        label: "Instagram",
                        hint: "Follow me",
                        isLandScape: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DetailCard(
                        url: 'https://github.com/umarkhalifa',
                        theme: theme,
                        image: "assets/images/github.png",
                        label: "Github",
                        hint: "See my work",
                        isLandScape: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                "OverView",
                style: TextStyle(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ShowUpAnimation(
                direction: Direction.horizontal,
                child: const Text(
                  "I'm a junior mobile developer specialized in flutter development with a background of software engineering"
                  " who is looking to bring passion and dedication to any team or company interested in my services ",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Skills",
                style: TextStyle(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const SkillCard(
                  image: "assets/images/flutter.png",
                  percentage: 0.8,
                  title: 'Flutter'),
              const SizedBox(
                height: 20,
              ),
              const SkillCard(
                  image: "assets/images/github.png",
                  percentage: 0.5,
                  title: 'Github'),
              const SizedBox(
                height: 20,
              ),
              const SkillCard(
                  image: "assets/images/firebase.png",
                  percentage: 0.7,
                  title: 'Firebase'),
            ],
          ),
        ))
      ],
    );
  }
}
