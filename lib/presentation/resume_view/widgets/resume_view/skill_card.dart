import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/constants/measurement.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SkillCard extends StatelessWidget {
  final String image;
  final double percentage;
  final String title;

  const SkillCard(
      {Key? key,
        required this.image,
        required this.percentage,
        required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: context.screenWidth() ,
                    child: LinearPercentIndicator(
                      lineHeight: 9,
                      animationDuration: 1500,
                      animation: true,
                      animateFromLastPercent: true,
                      percent: percentage,
                      barRadius: const Radius.circular(20),
                      backgroundColor:Theme.of(context).primaryColor.withOpacity(0.2),
                      progressColor: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
