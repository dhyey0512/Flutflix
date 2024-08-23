import 'package:flutter/material.dart';
import 'package:movieapp/about.dart';
import 'package:movieapp/constants/constant.dart';

class toprated extends StatelessWidget {
  const toprated({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return About(mov: snapshot.data[index]);
                  },
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.network(
                    '${Constant.imagePath}${snapshot.data[index].poster_path}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  width: 150,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
