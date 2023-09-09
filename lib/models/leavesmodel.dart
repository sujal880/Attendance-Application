class LeavesModel{
  String? reason;
  String? description;
  LeavesModel({required this.description,required this.reason});

  LeavesModel.fromMap(Map<String,dynamic>map){
    reason=map["reason"];
    description=map["description"];
  }

  Map<String,dynamic>toMap(){
    return {
      "reason":reason,
      "description":description
    };
  }
}