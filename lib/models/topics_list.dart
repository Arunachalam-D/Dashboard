class TopicInfo {
  final String path;
  final String title;
  final String rating;
  final String hours;
  final String description;
  final String sponsor;

  TopicInfo({
    required this.path,
    required this.title,
    required  this.rating,
    required this.hours,
    required this.description,
    required this.sponsor,
  });
}

List myTopics = [
  TopicInfo(
    path: "images/js.png",
    title: "Unlocking the Power of JavaScript",
    rating : "4.3",
    hours:"2h 31m",
    description: "Designed for beginners, this comprehensive JavaScript online course covers the essential concepts and skills needed to master Javascript, one of the most popular and widely used programming languages in the world.",
    sponsor:"scaler",
  ),
  TopicInfo(
    path: "images/git.png",
    title: "Git Tutorial",
    rating : "4.8",
    hours:"1h 55m",
    description: "Learn github from basics in this free online training. Github tutorial is taught hands-on by experts. Learn about accessing, touring, working with github & lot more. Best For Beginners.",
    sponsor:"Udemy",
  ),
  TopicInfo(
    path: "images/node.png",
    title: "Node JS Certification Course",
    rating : "4.9",
    hours:"4h 26m",
    description: "This course will introduce you to Node.js, its architecture, and its uses in web development. The course is self-paced and can be taken online from anywhere in the world.",
    sponsor:"Great Learning",
  ),
  TopicInfo(
    path: "images/java.png",
    title: "Java course mastering the fundamentals",
    rating : "5",
    hours:"8h 43m",
    description: "This easy-to-follow course is designed with beginners in mind, offering a structured learning path to specialize in Java programming. With no prerequisites, this course empowers you to learn Java at your own pace and take the first step toward a promising career in tech.",
    sponsor:"Simple learn",
  ),
  TopicInfo(
    path: "images/php.png",
    title: "PHP for Beginners",
    rating :"4.6",
    hours:"3h 11m",
    description: " Learn PHP basic concepts like variables, data types, control statements, loops, and functions through hands-on implementations.",
    sponsor: "coursera",
  ),

];
