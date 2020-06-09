import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cook/utilities/api_utilities.dart';

import 'package:cook/models/author.dart';

class AuthorsAPI {

  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allAuthorsApi = base_api + all_Authors_Api;
    var response = await http.get(allAuthorsApi);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Author author = Author(item['id'].toString(), item['name'].toString(),
            item['email'].toString(), item['avatar'].toString());
        authors.add(author);
        print(item['email'].toString());
      }
    }
    return authors;
  }
}