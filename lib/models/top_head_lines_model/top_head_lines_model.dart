import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'top_head_lines_model.g.dart';

@JsonSerializable()
class TopHeadLinesModel {
	String? status;
	int? totalResults;
	List<Article>? articles;

	TopHeadLinesModel({this.status, this.totalResults, this.articles});

	factory TopHeadLinesModel.fromJson(Map<String, dynamic> json) {
		return _$TopHeadLinesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TopHeadLinesModelToJson(this);
}
