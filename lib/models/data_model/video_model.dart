import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoModel {
  String? id;
  String? title;
  String? description;
  String? videoUrl;
  String? thumbnail;
  String? username;
  CategoryEnum? category;

  /// Local Fields
  VideoPlayerController? videoPlayerController;

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    videoUrl = json['videoUrl'];
    thumbnail = json['thumbnail'];
    username = json['username'];
    category = CategoryEnum.values.byName(json['category']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['videoUrl'] = videoUrl;
    data['category'] = category!.name;
    data['thumbnail'] = thumbnail;
    data['username'] = username;
    data['id'] = id;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          videoUrl == other.videoUrl &&
          thumbnail == other.thumbnail &&
          username == other.username &&
          category == other.category;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      videoUrl.hashCode ^
      thumbnail.hashCode ^
      username.hashCode ^
      category.hashCode;
}
