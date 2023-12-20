import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final double c1w;
  final double c1h;
  final double c2w;
  final double c2h;
  final String location;
  final String image;
  RecipeCard({
    required this.title,
    required this.location,
    required this.image,
    required this.c1w,
    required this.c1h,
    required this.c2w,
    required this.c2h,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: c1w,
      height: c1h,
      padding: EdgeInsets.all(15),
     child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff1F2937),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/Frame.svg"),
                      Text(
                        location,
                        style:
                            TextStyle(color: Color(0xff6B7280), fontSize: 11),
                      ),
                    ],
                  ),
                )
              ],
            ),
            width: c2w,
            height: c2h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
