import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'constants/constant.dart';
import 'models/movies.dart';

class About extends StatelessWidget {
  About({
    super.key,
    required this.mov,
  });

  final Movie mov;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colours.scaffoldBgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  return Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(129, 1, 5, 252),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 10, right: 10),
                  child: Text(
                    mov.title.toString(),
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.white,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  '${Constant.imagePath}${mov.poster_path}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Overview",
                  style: GoogleFonts.spaceMono(
                      fontSize: 30,
                      color: Color.fromARGB(211, 211, 255, 68),
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    '${mov.overview.toString()}',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.roboto(
                      wordSpacing: 2.5,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 149, 100, 14),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, left: 7, top: 2, bottom: 2),
                              child: Text(
                                  'Release Date : ${mov.release_date.toString()}'),
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 149, 100, 14),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 7, left: 7),
                              child: Row(
                                children: [
                                  const Text("Rating "),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      '${mov.vote_average.toStringAsFixed(1)}/10',
                                      style: const TextStyle(
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
