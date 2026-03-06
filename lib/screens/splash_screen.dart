import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/view_models/moives_provider.dart';
import 'package:mvvm_statemanagements_project/widgets/my_error_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

   @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);   // TODO : Define the provider here  what is the best way to define the provider here
    return Scaffold(
      body: true
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(height: 20),
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            )
          : MyErrorWidget(errorText: 'errorMessage', retryFunction:(){}),
    );
  }
}
