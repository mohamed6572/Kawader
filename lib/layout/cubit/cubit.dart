
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/models/user_model.dart';
import 'package:souq/modules/NewPost.dart';
import 'package:souq/modules/ProductsScrean.dart';
import 'package:souq/modules/settings/Social_Settings.dart';
import 'package:souq/shared/components/constens.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  //
  // List<SocialUserModel> users = [];
  //
  // void getAllUsers() {
  //   if (users.length == 0)
  //     FirebaseFirestore.instance.collection('users').get().then((value) {
  //       value.docs.forEach((element) {
  //         if (element.data()['uId'] != userModel?.uId)
  //           users.add(SocialUserModel.fromJson(element.data()));
  //       });
  //
  //       emit(SocialgetAllUsersSucsesState());
  //     }).catchError((error) {
  //       emit(SocialgetAllUsersErrorState(error.toString()));
  //     });
  // }

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
    'Home',
    'Post',
    'Settings',
  ];

  int CurrentIndex = 0;

  void ChangeIndex(index) {
    // if(index == 0)getAllUsers();
    if (index == 1)
      emit(SocialNewPostState());
    else {
      CurrentIndex = index;
      emit(SocialChangeBottomNavState());
    }}

}
