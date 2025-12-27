class StoryModel {
  final bool isStorySeen;
  final List<String> storyContent;
  final bool storyLikeCount;
  final String storyUser;
  final String storyUserPointCount;
  final int storyCount;

  StoryModel(
      {required this.isStorySeen,
      required this.storyContent,
      required this.storyLikeCount,
      required this.storyUser,
      required this.storyUserPointCount,
      required this.storyCount});
}
