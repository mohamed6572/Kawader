class SocialUserModel {
   String? name;
   String? phone;
   String? uId;


  SocialUserModel({
     this.name,
     this.phone,
     this.uId,

  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];

  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'phone': phone,
      'uId': uId,

    };
  }
}
