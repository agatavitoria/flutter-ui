import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width * 0.75;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Shimmer(
                period: Duration(seconds: 3),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffcccccc),
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(height: 13, width: 50, color: Colors.white),
                    ],
                  ),
                ),
                gradient:
                    LinearGradient(colors: [Colors.white, Color(0xffdddddd)]),
              );
            },
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Shimmer.fromColors(
          child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 10),
            width: 200,
            height: 15,
            color: Colors.white,
          ),
          baseColor: Color(0xfff0f0f0),
          highlightColor: Color(0xffcccccc),
        ),
        AspectRatio(
          aspectRatio: 7 / 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(bottom: 15),
                  width: itemWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Shimmer.fromColors(
                          child: Container(
                            color: Colors.white,
                          ),
                          baseColor: Color(0xffcccccc),
                          highlightColor: Color(0xffaaaaaa),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                height: 15,
                                width: 100,
                                color: Colors.black26,
                              ),
                              baseColor: Color(0xffcccccc),
                              highlightColor: Color(0xffaaaaaa),
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 15,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 5),
                                color: Colors.black26,
                              ),
                              baseColor: Color(0xffcccccc),
                              highlightColor: Color(0xffaaaaaa),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        Shimmer.fromColors(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: 200,
            height: 15,
            color: Colors.white,
          ),
          baseColor: Color(0xfff0f0f0),
          highlightColor: Color(0xffcccccc),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(6, (index) {
            return AspectRatio(
              aspectRatio: 12 / 3,
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Shimmer.fromColors(
                        child: Container(
                          color: Color(0xffeeeeee),
                        ),
                        baseColor: Color(0xfff0f0f0),
                        highlightColor: Color(0xffcccccc),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: double.infinity,
                                color: Color(0xffeeeeee),
                                height: 12,
                              ),
                              baseColor: Color(0xfff0f0f0),
                              highlightColor: Color(0xffeeeeee),
                            ),
                            SizedBox(height: 10),
                            Shimmer.fromColors(
                              child: Container(
                                width: double.infinity,
                                color: Color(0xffeeeeee),
                                height: 20,
                              ),
                              baseColor: Color(0xfff0f0f0),
                              highlightColor: Color(0xffeeeeee),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
