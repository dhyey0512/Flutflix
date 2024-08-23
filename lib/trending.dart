import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/about.dart';

import 'constants/constant.dart';

class trending extends StatelessWidget {
  const trending({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return About(mov: snapshot.data[index]);
                  },
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 170,
                height: 200,
                // color: Colors.amber,
                child: Image.network(
                  '${Constant.imagePath}${snapshot.data[index].poster_path}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: 250,
          enlargeCenterPage: true,
          viewportFraction: 0.4,
          autoPlayCurve: Curves.easeInOutCubicEmphasized,
          autoPlayInterval: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
