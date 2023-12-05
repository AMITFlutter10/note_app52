class UserModel {
  String? id;
  String? email;
  String? name;
  String? password ;
  String? pic;

  UserModel({
     this.id,
     this.email,
     this.name,
     this.password,
     this.pic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'name': this.name,
      'password': this.password,
      'pic': this.pic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      pic: map['pic'] as String,
    );
  }
}