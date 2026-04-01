import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class YoutubeService {
  static Future<String?> getYoutubeVideoId(String query) async {
    final url =
        "https://www.youtube.com/results?search_query=${Uri.encodeComponent(query)}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final document = parse(response.body);

      final scripts = document.getElementsByTagName('script');

      for (var script in scripts) {
        if (script.text.contains('videoId')) {
          final regExp = RegExp(r'"videoId":"(.*?)"');
          final match = regExp.firstMatch(script.text);

          if (match != null) {
            return match.group(1);
          }
        }
      }
    }

    return null;
  }
}
