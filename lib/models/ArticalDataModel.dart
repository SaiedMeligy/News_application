
class ArticalDataModel {
  String? status;
  List<Articles>? articles;
  ArticalDataModel({
      this.status,
      this.articles,});

  ArticalDataModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }


}

class Articles {
  Source? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;

  Articles({
      this.source,
      this.title,
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }

}

/// id : "bbc-news"
/// name : "BBC News"

class Source {
  String? id;
  String? name;
  Source({
      this.id, 
      this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }




}