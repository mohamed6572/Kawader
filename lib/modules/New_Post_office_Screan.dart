import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/modules/ProductsScrean.dart';
import 'package:souq/shared/components/components.dart';

import '../layout/cubit/states.dart';

class New_Post_office_Screan extends StatelessWidget {
  var titleController = TextEditingController();
  var priceController = TextEditingController();
  var descripController = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialCreatePostSuccsesState)
          Navigator.pop(context);
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:
                defultAppBar(context: context, title: 'اضافه اعلان', actions: [
              defultTextButtton(
                  text: 'اضف',
                  function: () {
                    var now = DateTime.now();

                    print(now);
                    if (SocialCubit.get(context).postofficeImage == null) {
                     'you must chose image';
                    } else {
                      SocialCubit.get(context).UploadPostofficeImage(
                          dateTime: now.toString(),
                          descreption: descripController.text ,
                          title: titleController.text,
                          price: priceController.text);
                    }
                  }),
            ]),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (state is SocialCreatePostLoadingState)
                    LinearProgressIndicator(),
                  if (state is SocialCreatePostLoadingState)
                    SizedBox(
                      height: 10,
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'النص...',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                    controller: titleController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'السعر',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                    controller: priceController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'الشرح',
                      hintStyle: TextStyle(color: Colors.black),
                      // border: InputBorder.none
                    ),
                    controller: descripController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (SocialCubit.get(context).postofficeImage != null)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: FileImage(SocialCubit.get(context)
                                      .postofficeImage!) as ImageProvider,
                                  fit: BoxFit.cover)),
                        ),
                        IconButton(
                            onPressed: () {
                              SocialCubit.get(context).RemovePostofficeImage();
                            },
                            icon: CircleAvatar(
                              radius: 20,
                              child: Icon(
                                Icons.close,
                                size: 16,
                              ),
                            ))
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            SocialCubit.get(context).getPostofficeImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image),
                              SizedBox(
                                width: 5,
                              ),
                              Text('اضافه صورة')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
