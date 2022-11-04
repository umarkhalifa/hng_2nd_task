import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/home_view/home_view_landscape.dart';
import 'package:my_portfolio/presentation/home_view/home_view_portrait.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLarge = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? HomePortrait(isLarge: isLarge)
                : const HomeViewLandScape();
          },
        ),
      ),
    );
  }
}
