class ArticleModel {
  String? title;
  String? description;
  String? urlToImg;
  String? url;

  ArticleModel({this.title, this.description, this.urlToImg,this.url});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      urlToImg: json['urlToImage'] ?? "",
      url: json['url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImg,
      'url': url,
    };
  }
}
 