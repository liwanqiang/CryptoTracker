import 'package:cryptotracker/models/video.dart';

class Home {
  List<Topic> topics = [];
  List<VideoSection> sections = [];
}

class Topic {
  String title;
  String cover;
  String tag;
  String desc;
  String updateAt;
  String id;

  Topic({this.title, this.cover, this.tag, this.desc, this.updateAt, this.id});

  Topic.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cover = json['cover'];
    tag = json['tag'];
    desc = json['desc'];
    updateAt = json['updateAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['tag'] = this.tag;
    data['desc'] = this.desc;
    data['updateAt'] = this.updateAt;
    data['id'] = this.id;
    return data;
  }
}

class VideoSection {
  String title;
  List<Video> items;

  VideoSection({this.title, this.items});

  VideoSection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['items'] != null) {
      items = new List<Video>();
      json['items'].forEach((v) {
        items.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
