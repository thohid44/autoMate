

class Users {
  final int? id;
  
  final String? userType;
  final String? name;
  final String? mobile;
  


  Users({this.id, this.userType, this.name, this.mobile});

  factory Users.fromJson(Map<String, dynamic> json) {

    return Users(
        id: json['id'] as int,
        name: json['name'] as String,
        mobile: json['mobile'] as String,
        userType: json['UserType'] as String,
     );
  }

  
}