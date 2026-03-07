import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/screens/movies_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/view_models/moives_provider.dart';
import 'package:mvvm_statemanagements_project/widgets/my_error_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> _loadInitialData(BuildContext context) async{

     await Future.microtask(() async{
      if(context.mounted) return;
      await Provider.of<MoviesProvider>(context, listen: false)
      .getMovies();
      
      });
    // WidgetsBinding.instance.addPostFrameCallback((_) async{
    //  await Provider.of<MoviesProvider>(context, listen: false)
    //   .getMovies();
    // });
    
  }
   @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false)  ;   // TODO : Define the provider here  what is the best way to define the provider here
    return Scaffold(
      body: FutureBuilder(  // TODO :DEFINE THE FUTURE BUILDER HERE AND THE ERROR WIDGET HERE
        future: _loadInitialData(context),   // we will use _loadInitialData(context) instead of moviesProvider.getMovies() to load the data in the background
        builder: (context, snapshot) {  
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            if(moviesProvider.genreslist.isEmpty){
                          getIt<NavigationService>().navigateReplace(const MoviesScreen());

            }
            return  Provider.of<MoviesProvider>(context).isLoading 
            ? const Center(child: CircularProgressIndicator.adaptive(),) 
            : MyErrorWidget(errorText: snapshot.error.toString(),
             retryFunction:()async{
               await _loadInitialData(context);});
          } else {
            getIt<NavigationService>().navigateReplace(const MoviesScreen());
            return const SizedBox.shrink();
          }
        },
      ),
          
    );
  }
}
