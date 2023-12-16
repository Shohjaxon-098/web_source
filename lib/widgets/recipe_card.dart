import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeCard extends StatelessWidget {
  final String title;

  final String location;
  final String image;
  RecipeCard({
    required this.title,
    required this.location,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 206,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
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
            width: 128,
            height: 176,
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
