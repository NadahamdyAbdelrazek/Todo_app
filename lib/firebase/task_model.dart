class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;
  String userId;

  TaskModel({this.id = "",
    required this.title,
    required this.description,
    this.isDone = false,
    required this.date,required this.userId});


 TaskModel.fromJson(Map<String, dynamic> Json):this (
    title: Json['title'], description: Json['description'], date: Json['date'],
       id: Json['id'],isDone: Json['isDone'],userId: Json['userId']
   );


  //TaskModel fromJson(Map<String, dynamic> Json) {
    //return TaskModel(title: Json['title'], description: Json['description'], date: Json['date'],
    //id: Json['id'],isDone: Json['isDone']
    //);
 // }
 Map<String,dynamic> toJson(){
    return {
      "description":description,
      "title":title,
      "date":date,
      "id":id,
      "isDone":isDone,
      "userId":userId

    };

 }
}
