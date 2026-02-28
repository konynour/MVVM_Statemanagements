import 'package:flutter/material.dart';

import 'package:mvvm_statemanagements_project/constants/my_app_constants.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';
import 'package:mvvm_statemanagements_project/widgets/cached_iamge.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/favorite_btn.dart';

import '../widgets/movies/genres_list_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({required this.moviemodel, super.key});
final MoviesModels moviemodel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: "${moviemodel.id}",
              child: SizedBox(
                height: size.height * 0.45,
                width: double.infinity,
                child: CachedImageWidget(
                  imgUrl:"https://image.tmdb.org/t/p/w500/${moviemodel.backdropPath}",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    // child: Container(color: Colors.red,),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                Text(
                                  moviemodel.title  ?? "NO TITLE",
                                  maxLines: 2,
                                  style: TextStyle(
                                    // color: Theme.of(context).textSelectionColor,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(height: 5.0),
                                 Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text("${moviemodel.voteAverage}/10"),
                                    Spacer(),
                                    Text(
                                      moviemodel.releaseDate ?? "NO DATE",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const GenresWidget(),
                                const SizedBox(height: 15),
                                Text(
                                  moviemodel.overview ?? "NO OVERVIEW",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: FavoriteBtn(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}