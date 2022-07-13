

class addModel {
  String? title;
  String? uId;
  String? image;
  String? dateTime;
  String? decrepthion;
  String? price;

  addModel({
    this.title,
    this.uId,
    this.image,
    this.dateTime,
    this.price,
     this.decrepthion,

  });

  addModel.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    price = json['price'];
    decrepthion = json['decrepthion'];
  }

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'price': price,
      'decrepthion': decrepthion,

    };
  }
}