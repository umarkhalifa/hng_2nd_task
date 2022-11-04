import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  final Color color;

  const TopLogo({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      height: 45,
                      width: 22.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Theme.of(context).primaryColor
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "M",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 23),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Umar",
            style: TextStyle(
                color: color, fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
