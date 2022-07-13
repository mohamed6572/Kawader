import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/models/add_model.dart';
import 'package:souq/models/slider_model.dart';
import 'package:souq/models/user_model.dart';
import 'package:souq/modules/New_Post_office_Screan.dart';
import 'package:souq/modules/ProductsScrean.dart';
import 'package:souq/modules/chosePosts.dart';
import 'package:souq/modules/settings/Social_Settings.dart';
import 'package:souq/shared/components/constens.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


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

  void getUserData() async{
    emit(SocialgetUserLoadingState());
  await  FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
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
    ChosePosts(),
    Social_Settings(),
  ];
  List<String> titles = [
    'الرئيسية',
    'اضافه اعلان',
    'الاعدادات',
  ];
////////office
   var picker = ImagePicker();
  File? postofficeImage;

  void RemovePostofficeImage() {
    postofficeImage = null;
    emit(SocialRemovePostImageState());
  }

  Future<void> getPostofficeImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postofficeImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(SocialPostImagePickedErrorState());
    }
  }

  /////////////////////
  void UploadPostofficeImage({
    required String dateTime,
    required String title,
    required String descreption,
    required String price,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postofficeImage?.path ?? '').pathSegments.last}')
        .putFile(postofficeImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPostOffice(title: title,description: descreption, dateTime: dateTime, Postimage: value,price: price);
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createPostOffice({
    required String dateTime,
    required String title,
    required String description,
    required String price,
    String? Postimage,
  }) {
    addModel model = addModel(
        uId: userModel?.uId??uId??'',
        price: price,
        decrepthion: description,
        image:  Postimage ?? '',
        title: title,
        dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toJson())
        .then((value) {
      emit(SocialCreatePostSuccsesState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  ////////////////////////
  List<addModel> posts = [];
  List<addModel> postsUser = [];
  addModel? userId ;

  void getofficeposts() {
    FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
      posts = [];
      postsUser = [];
      event.docs.forEach((element) {
        posts.add(addModel.fromJson(element.data()));
          userId = addModel.fromJson(element.data());
          print('usermodel == ${userModel?.uId}');
          print('userid == ${userId?.uId}');

          if(userModel?.uId == userId?.uId){
            postsUser.add(addModel.fromJson(element.data()));
            print(postsUser.length);
          }
        emit(SocialgetPostSucsesState());
      });

    });
  }
///////////////////clint


  var picker1 = ImagePicker();
  File? postClientImage;

  void RemovePostClientImage() {
    postClientImage = null;
    emit(SocialRemoveclientImageState());
  }

  Future<void> getPostClientImage() async {
    final pickedFile1 = await picker1.pickImage(source: ImageSource.gallery);
    if (pickedFile1 != null) {
      postClientImage = File(pickedFile1.path);
      emit(SocialclientImagePickedSuccsessState());
    } else {
      print('no image selected');
      emit(SocialclientImagePickedErrorState());
    }
  }

  /////////////////////
  void UploadPostClientImage({
    required String dateTime,
    required String title,
    required String description,
    required String price,
  }) {
    emit(SocialCreateclientLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('client/${Uri.file(postClientImage?.path ?? '').pathSegments.last}')
        .putFile(postClientImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPostClient(title: title,description: description, dateTime: dateTime, Postimage: value,price: price);
      }).catchError((error) {
        emit(SocialCreateclientErrorState());
      });
    }).catchError((error) {
      emit(SocialCreateclientErrorState());
    });
  }

  void createPostClient({
    required String dateTime,
    required String title,
    required String description,
    required String price,
    String? Postimage,
  }) {
    addModel model = addModel(
      uId: userModel?.uId,
      price: price,
      decrepthion: description,
      image:  Postimage ?? '',
      title: title,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('client')
        .add(model.toJson())
        .then((value) {
      emit(SocialCreateclientSuccsesState());
    }).catchError((error) {
      emit(SocialCreateclientErrorState());
    });
  }

  ////////////////////////
  List<addModel> clients = [];
  List<addModel> clientsUser = [];
  addModel? userclientId ;
  void getClientposts() {
    FirebaseFirestore.instance.collection('client').snapshots().listen((event) {
      clients = [];
      clientsUser = [];
      event.docs.forEach((element) {
        clients.add(addModel.fromJson(element.data()));
        userclientId = addModel.fromJson(element.data());
        print('usermodel == ${userModel?.uId}');
        print('userid == ${userclientId?.uId}');

        if(userModel?.uId == userId?.uId){
          clientsUser.add(addModel.fromJson(element.data()));
          print(clientsUser.length);
        }
        emit(SocialgetclientSucsesState());
      });

    });
  }


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
