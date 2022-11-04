import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/presentation/constants/measurement.dart';
import 'package:my_portfolio/presentation/resume_view/widgets/resume_view/link_card.dart';
import 'package:my_portfolio/presentation/resume_view/widgets/resume_view/skill_card.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../logic/theme_provider.dart';
import '../home_view/home_view.dart';

class ResumePortrait extends StatelessWidget {
  final bool isLarge;

  const ResumePortrait({Key? key, required this.isLarge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                      (route) => false);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: theme.colorScheme.onBackground),
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
                      color: theme.colorScheme.onBackground,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: context.screenHeight() * 0.3,
            width: context.screenWidth(),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  right: 10,
                  top: 0,
                  child: ShowUpAnimation(
                    child: Container(
                      height: context.screenHeight() * 0.27,
                      decoration: BoxDecoration(
                          color: const Color(0xff82AED1),
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.bottomRight,
                      child: Image.asset('assets/images/me.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: context.screenHeight() * 0.12,
                    width: context.screenWidth(),
                    child: Row(
                      children: [
                        Expanded(
                          child: DetailCard(
                            url: 'https://mobile.twitter.com/umar_khalifa5',
                            theme: theme,
                            image: "assets/images/twitter.png",
                            label: "Twitter",
                            hint: "Follow me",
                            isLandScape: false,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: DetailCard(
                            theme: theme,
                            image: "assets/images/instagram.png",
                            label: "Instagram",
                            hint: "Follow me",
                            isLandScape: false,
                            url:
                                "https://www.instagram.com/invites/contact/?i=3syyi5imd86j&utm_content=i1jiilz",
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: DetailCard(
                            url: 'https://github.com/umarkhalifa',
                            theme: theme,
                            image: "assets/images/github.png",
                            label: "Github",
                            hint: "See my work",
                            isLandScape: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
            offset: -1,
            direction: Direction.horizontal,
            child: Text(
              "I'm a junior mobile developer specialized in flutter development with a background of software engineering"
              " who is looking to bring passion and dedication to any team or company interested in my services ",
              style: TextStyle(color: Colors.grey, fontSize: isLarge ? 20 : 15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Skills",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
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
    );
  }
}
