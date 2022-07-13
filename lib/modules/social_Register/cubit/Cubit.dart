
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/models/user_model.dart';
import 'package:souq/modules/social_Register/cubit/States.dart';
class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterIntialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String phone,
    required String password,
  }) {
    emit(SocialRegisterLodingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: phone, password: password)
        .then((value) {
      createUser(
        uId: value.user!.uid,
        name: name,
        phone: phone,

      );

    }).catchError((error) {
      emit(SocialRegisterErerorState(error.toString()));
    });
  }
  SocialUserModel? socialUserModel ;
  void createUser({
    required String name,
    required String phone,
    required String uId,

  }) {
    SocialUserModel model =
        SocialUserModel(name: name, phone: phone, uId: uId,
        );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
          emit(SocialCreateUserSucseslState());
    })
        .catchError((error) {
          emit(SocialCreateUserErerorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void ChangePasswordVisibilty() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(SocialRegisterChangePasswordVisibiltyState());
  }
}
