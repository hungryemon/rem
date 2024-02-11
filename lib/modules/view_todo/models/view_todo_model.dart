/// This class defines the variables used in the [wish_list_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ViewTodoModel {
  final String? title;
  final String? content;
  final String? status;
  final DateTime? dateTime;

 ViewTodoModel({
    this.title,
    this.content,
    this.status,
    this.dateTime,
  });

}
