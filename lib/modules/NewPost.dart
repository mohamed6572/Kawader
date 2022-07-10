import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/shared/components/components.dart';

import '../layout/cubit/states.dart';

class New_Post_Screan extends StatelessWidget {

  var textController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {
          if(state is SocialCreatePostSuccsesState)
            Navigator.pop(context);
        },
        builder: (context , state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: defultAppBar(context: context, title: 'create add', actions: [
              defultTextButtton(text: 'Post', function: () {
              }),
            ]),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if(state is SocialCreatePostLoadingState)
                    LinearProgressIndicator(),
                  if(state is SocialCreatePostLoadingState)
                    SizedBox(height: 10,),


                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'create add ...',
                        hintStyle:TextStyle(color: Colors.black) ,
                        border: InputBorder.none),
                    controller: textController,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'price',
                        hintStyle:TextStyle(color: Colors.black) ,
                        border: InputBorder.none),
                    controller: textController,
                  ),
                  SizedBox(height: 20,),
                  // Stack(
                  //   alignment: Alignment.topRight,
                  //   children: [
                  //     // Container(
                  //     //   width: double.infinity,
                  //     //   height: 160,
                  //     //   decoration: BoxDecoration(
                  //     //       borderRadius: BorderRadius.circular(4),
                  //     //       image: DecorationImage(
                  //     //           image:  FileImage(SocialCubit.get(context).postImage!) as ImageProvider,
                  //     //           fit: BoxFit.cover)),
                  //     // ),
                  //     // IconButton(
                  //     //     onPressed: () {
                  //     //       SocialCubit.get(context).RemovePostImage();
                  //     //     },
                  //     //     icon: CircleAvatar(
                  //     //       radius: 20,
                  //     //       child: Icon(
                  //     //         Icons.close,
                  //     //         size: 16,
                  //     //       ),
                  //     //     ))
                  //   ],
                  // ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image),
                              SizedBox(
                                width: 5,
                              ),
                              Text('add photo')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
