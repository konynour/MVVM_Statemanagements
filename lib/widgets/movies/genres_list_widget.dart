import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_constants.dart';

class GenresWidget extends StatefulWidget {
  const GenresWidget({super.key});

  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: List.generate(MyAppConstants.genresList.length, (index) {
        return chipWidget(genreName: MyAppConstants.genresList[index], context: context);
      })
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
