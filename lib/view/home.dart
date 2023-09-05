// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/service/top_headlines_api_service.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/view/details.dart';

import '../models/top_head_lines_model/article.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  ApiService apiService = ApiService();
  String country = 'sg';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: countries.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text("News"),
            bottom: TabBar(
              labelColor: Colors.white,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.deepPurple),
              tabs: countries.keys
                  .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Tab(
                          text: countries[e],
                        ),
                  ))
                  .toList(),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
              children: countries.keys
                  .map((e) => FutureBuilder(
                        future: apiService.getArticle(e),
                        builder:
                            (context, AsyncSnapshot<List<Article>> snapshot) {
                          if (snapshot.hasData) {
                            List<Article>? articles = snapshot.data;
                            return ListView.builder(
                              itemCount: articles?.length ?? 0,
                              itemBuilder: (context, index) {
                                final article = articles![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          Details(article: article),
                                    ));
                                  },
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              width: double.infinity,
                                              child: Image.network(
                                                article.urlToImage ??
                                                    'https://static.scientificamerican.com/sciam/cache/file/ADAA8641-4A8C-4F60-A71507760D828D9D_source.jpg?w=590&h=800&A13159EE-5C29-4F91-8622E7C5082CC2EA',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 1.0),
                                                child:
                                                    Text(article.source!.name!),
                                              ),
                                            ),
                                            if (article.title != null)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  article.title!,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        },
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
