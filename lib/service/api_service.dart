import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mvvm_statemanagements_project/constants/api_constants.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';

class ApiService {
  Future<List<MoviesModels>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1",
    );
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data : $data");
      return List.from(data['results'].map((element) => MoviesModels.fromJson(element)));
    } else {
      throw Exception("Failed to load movies:${response.statusCode}");
    }
  }
}
