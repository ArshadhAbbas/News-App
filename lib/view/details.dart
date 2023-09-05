import 'package:flutter/material.dart';
import 'package:news_app/models/top_head_lines_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                article.urlToImage ??
                    'https://static.scientificamerican.com/sciam/cache/file/ADAA8641-4A8C-4F60-A71507760D828D9D_source.jpg?w=590&h=800&A13159EE-5C29-4F91-8622E7C5082CC2EA',
              ),
              if (article.title != null)
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 29),
                    )),
              SizedBox(
                height: 20,
              ),
              Text(article.description ?? ''),
              SizedBox(
                height: 20,
              ),
              Text(article.content ?? ''),
              OutlinedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(article.url!));
                  },
                  child: Text("Read More"))
            ],
          ),
        ),
      ),
    );
  }
}
