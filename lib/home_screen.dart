import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api.dart';
import 'package:movieapp/heading.dart';
import 'package:movieapp/toprated.dart';
import 'package:movieapp/trending.dart';
import 'package:movieapp/upcomingmovies.dart';

import 'models/movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trend;
  late Future<List<Movie>> topRated;
  late Future<List<Movie>> upcomming;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trend = Api().getTrending();
    topRated = Api().getToprated();
    upcomming = Api().getUpcomming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/logo.png',
          // width: 200,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Trending Movies",
                style: GoogleFonts.openSans(fontSize: 25),
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: trend,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return trending(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 28,
              ),
              heading(heading: "Top rated"),
              const SizedBox(
                height: 28,
              ),
              FutureBuilder(
                future: topRated,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return toprated(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    throw Exception("error in top rated");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              // const toprated(),
              const SizedBox(
                height: 28,
              ),
              heading(heading: "Upcoming Movies"),
              const SizedBox(
                height: 28,
              ),
              FutureBuilder(
                future: upcomming,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return upcomingmovies(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    throw Exception("error in upcomming");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
