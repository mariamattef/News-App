class ShowCategoryModel {
  String? title;
  String? description;
  String? urlToImg;
  String? url;
  ShowCategoryModel({this.title, this.description, this.urlToImg, this.url});

  factory ShowCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShowCategoryModel(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      urlToImg: json['urlToImage'] ?? "",
      url: json['url'] ?? "",
    );
  }
}
