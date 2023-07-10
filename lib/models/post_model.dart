import 'dart:convert';

class PostModel {
  final String userName;
  final String handle;
  final String content;
  final String time;
  final int likes;
  final int comments;
  final int reposts;
  final int? views;
  final bool isImage;
  PostModel({
    required this.userName,
    required this.handle,
    required this.content,
    required this.time,
    required this.likes,
    required this.comments,
    required this.reposts,
    this.views,
    required this.isImage,
  });

  PostModel copyWith({
    String? userName,
    String? handle,
    String? content,
    String? time,
    int? likes,
    int? comments,
    int? reposts,
    int? views,
    bool? isImage,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      handle: handle ?? this.handle,
      content: content ?? this.content,
      time: time ?? this.time,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      reposts: reposts ?? this.reposts,
      views: views ?? this.views,
      isImage: isImage ?? this.isImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'handle': handle,
      'content': content,
      'time': time,
      'likes': likes,
      'comments': comments,
      'reposts': reposts,
      'views': views,
      'isImage': isImage,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] ?? '',
      handle: map['handle'] ?? '',
      content: map['content'] ?? '',
      time: map['time'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
      reposts: map['reposts']?.toInt() ?? 0,
      views: map['views']?.toInt(),
      isImage: map['isImage'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(userName: $userName, handle: $handle, content: $content, time: $time, likes: $likes, comments: $comments, reposts: $reposts, views: $views, isImage: $isImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.userName == userName &&
        other.handle == handle &&
        other.content == content &&
        other.time == time &&
        other.likes == likes &&
        other.comments == comments &&
        other.reposts == reposts &&
        other.views == views &&
        other.isImage == isImage;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        handle.hashCode ^
        content.hashCode ^
        time.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        reposts.hashCode ^
        views.hashCode ^
        isImage.hashCode;
  }
}

final List<PostModel> posts = [
  PostModel(
    userName: 'Cristofer Torff',
    handle: 'ctorff',
    content:
        'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
    time: '2m',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: false,
  ),
  PostModel(
    userName: 'Marilyn Bator',
    handle: 'ctorff',
    content: 'assets/images/onboarding_1.jpg',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: true,
  ),
  PostModel(
    userName: 'Terry Ekstrom Bothman',
    handle: 'ctorff',
    content:
        'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: false,
  ),
  PostModel(
    userName: 'Cooper Calzoni',
    handle: 'ctorff',
    content:
        'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: false,
  ),
  PostModel(
    userName: 'Maren Korsgaard',
    handle: 'ctorff',
    content: 'assets/images/onboarding_3.jpg',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: true,
  ),
  PostModel(
    userName: 'Cristofer Gouse',
    handle: 'ctorff',
    content:
        'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: false,
  ),
  PostModel(
    userName: 'Mira George',
    handle: 'ctorff',
    content: 'assets/images/onboarding_2.jpg',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: true,
  ),
  PostModel(
    userName: 'Jaxson Bator',
    handle: 'ctorff',
    content:
        'Lorem ipsum dolor sit amet consectetur. Dictum pellentesque ac gravida a. Elit hac tortor facilisis leo. Egestas enim convallis sollicitudin arcu enim nibh platea pellentesque. Elementum nullam dolor elementum malesuada pellentesque condimentum.',
    time: '',
    likes: 143,
    comments: 200,
    reposts: 10,
    views: 20,
    isImage: false,
  ),
];
