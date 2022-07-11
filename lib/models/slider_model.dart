class SliderModel {
   String? image;



   SliderModel({
     this.image,


  });

   SliderModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];


  }

}
