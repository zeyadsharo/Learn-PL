class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({this.avatarUrl, this.name, this.datetime, this.message});
  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "images/flower.jpg",
      name: "C++",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    ChatModel(
      avatarUrl: "images/flower.jpg",
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    ChatModel(
      avatarUrl: "images/flower.jpg",
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    ChatModel(
      avatarUrl: "images/flower.jpg",
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
  ];
}
