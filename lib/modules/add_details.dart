import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/models/add_model.dart';
import 'package:souq/shared/components/components.dart';


class add_Details extends StatelessWidget {
  addModel? model;

  add_Details({required this.model});

  var imageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model?.title}',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 250,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child:Image(image: NetworkImage('${model?.image}'),width: double.infinity,fit: BoxFit.fill,)
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${model?.price}',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        ': السعر',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${model?.dateTime?.substring(0,16)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        ': تاريخ العرض',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'description',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 22),
                  ),
                  myDivider(),
                  Text(
                    '${model?.decrepthion}',
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
