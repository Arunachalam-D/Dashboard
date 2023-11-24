class LearningInfo{
  final String title;
  final int percentage;

  LearningInfo({
    required this.title,
    required this.percentage,
  });
}

List myCourses = [
  LearningInfo(
    title: "Flutter Basics and fundamental concepts for beginners ",
    percentage: 100,
  ),
  LearningInfo(
    title: "Web Socket",
    percentage: 70,
  ),
  LearningInfo(
    title: "API integration using DIO",
    percentage: 90,
  ),
  LearningInfo(
    title: "Bloc Pattern",
    percentage: 100,
  ),
];