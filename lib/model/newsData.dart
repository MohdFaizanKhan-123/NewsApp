class Data {
  int id;
  String title;
  String summary;
  String link;
  String published;
  String image;

  Data(
      {this.id,
      this.title,
      this.summary,
      this.link,
      this.published,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    link = json['link'];
    published = json['published'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['link'] = this.link;
    data['published'] = this.published;
    data['image'] = this.image;
    return data;
  }
}
