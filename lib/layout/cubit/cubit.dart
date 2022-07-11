import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/models/slider_model.dart';
import 'package:souq/models/user_model.dart';
import 'package:souq/modules/NewPost.dart';
import 'package:souq/modules/ProductsScrean.dart';
import 'package:souq/modules/settings/Social_Settings.dart';
import 'package:souq/shared/components/constens.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SliderModel? sliderModel;
List<SliderModel> slider= [];
  void getSilderImage() {
    FirebaseFirestore.instance
        .collection('users')
        .doc('vu34PnN9JmkvlXGkTyg8')
        .collection('slideradds')
        .get()
        .then((value) {
      value.docs.forEach((element) {
          slider.add(SliderModel.fromJson(element.data()));
      });
      emit(getSliderImageSucsesState());
      print('sucsssssssssssssssssssssssssssssssses');
    })
        .catchError((e) {
          emit(getSliderImageErrorState());
    });
  }

  SocialUserModel? userModel;

  void getUserData() {
    emit(SocialgetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = SocialUserModel.fromJson(value.data()!);
      print(userModel?.name);
      emit(SocialgetUserSucsesState());
    }).catchError((error) {
      print(error);
      emit(SocialgetUserErrorState(error.toString()));
    });
  }

  List<Widget> Screans = [
    ProductsScrean(),
    New_Post_Screan(),
    Social_Settings(),
  ];
  List<String> titles = [
    'الرئيسية',
    'اضافه اعلان',
    'الاعدادات',
  ];

  List<Widget> list = [
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
  ];

  int CurrentIndex = 0;

  void ChangeIndex(index) {
    // if(index == 0)getAllUsers();
    if (index == 1)
      emit(SocialNewPostState());
    else {
      CurrentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }
}
