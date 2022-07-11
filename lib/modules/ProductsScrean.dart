import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/shared/components/components.dart';

class ProductsScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getSilderImage(),
      child: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return productsBuilder(context);
          }),
    );
  }

  Widget productsBuilder(context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: SocialCubit.get(context).slider
                    .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ))
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  height: 240.0,
                  initialPage: 0,
                  reverse: false,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الاعلانات الجديدة',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: 3),
              color: Colors.grey[200],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.43,
                children: List.generate(SocialCubit.get(context).list.length,
                    (index) => BuildGridProduct(context)),
              ),
            )
          ],
        ),
      );
}
