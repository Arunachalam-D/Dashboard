class CourseList{
  final String id,title,status,startDate,endDate;



  CourseList({required this.id, required this.title, required this.startDate,required this.endDate, required this.status});
}
List myCourses = [
  CourseList(
    id:"1",
    title: "Bloc Architecture",
    startDate:"11/09/23",
    endDate:"18/09/23",
    status: "completed"
  ),
  CourseList(
      id:"2",
      title: "Web Sockets",
      startDate:"06/08/23",
      endDate:"TBD",
      status: "pending"
  ),
  CourseList(
      id:"3",
      title: "API integration using DIO",
      startDate:"14/06/23",
      endDate:"TBD",
      status: "pending"
  ),
  CourseList(
      id:"4",
      title: "Flutter Basics",
      startDate:"03/06/23",
      endDate:"05/06/23",
      status: "completed"
  ),

];