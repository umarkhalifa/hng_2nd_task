import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/resume_view/resume_landscape.dart';
import 'package:my_portfolio/presentation/resume_view/resume_potrait.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLarge = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? ResumePortrait(isLarge: isLarge)
                : const ResumeLandScape();
          },
        ),
      ),
    );
  }
}
