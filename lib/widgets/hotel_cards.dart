import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HotelCard extends StatelessWidget {
  final String title;
  final String titleButton;
  final double c1w;
  final double c1h;
  final double c2w;
  final double c2h;
  final String location;
  final String image;

  HotelCard({
    required this.titleButton,
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
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.651,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff1F2937),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/location.svg"),
                                Text(
                                  location,
                                  style: TextStyle(
                                      color: Color(0xff6B7280), fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 88,
                            height: 28,
                            decoration: ShapeDecoration(
                              color: Color(0xFF32B768),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Center(
                                child: Text(
                              titleButton,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
