import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/constants/measurement.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCard extends StatelessWidget {
  final String image;
  final String label;
  final String hint;
  final bool isLandScape;
  final String url;

  const DetailCard({
    Key? key,
    required this.theme,
    required this.image,
    required this.label,
    required this.hint, required this.isLandScape, required this.url,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
      child: ShowUpAnimation(
        child: Container(
          height: isLandScape ? context.screenHeight() * 0.17 : context.screenHeight() * 0.088,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: theme.shadowColor,
                  offset: const Offset(0, 3),
                  blurRadius: 10),
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(image),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize:  13),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                hint,
                style:  const TextStyle(color: Colors.grey, fontSize:12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

