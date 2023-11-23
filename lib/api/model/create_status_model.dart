class CreateStatusModel {
  final String status;

  CreateStatusModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];
}
