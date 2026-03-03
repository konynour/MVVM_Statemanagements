import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_constants.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';
import 'package:mvvm_statemanagements_project/screens/movie_details.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/widgets/cached_iamge.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/favorite_btn.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key,
  // required this.moviemodel
  });

  // final MoviesModels moviemodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            // TODO: Navigate To The Movie Details Screen
           getIt<NavigationService>().navigate(const MovieDetailsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Hero(
              tag:"", //moviemodel.id,
              child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child:  CachedImageWidget(
                        imgUrl: MyAppConstants.movieImage
                        // "https://image.tmdb.org/t/p/w500/${moviemodel.backdropPath}",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'moviemodel.originalTitle!',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                         Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 5),
                            Text("0.8")
                              // "${moviemodel.voteAverage?.toStringAsFixed(1)}/10"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // TODO: Add the genres widget
                         
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watchLaterOutlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                             Text(
                              'moviemodel.releaseDate!',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                             FavoriteBtn(
                              // moviemodel: moviemodel
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
