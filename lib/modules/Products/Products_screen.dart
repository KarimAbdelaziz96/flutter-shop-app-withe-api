// ignore_for_file: file_names, prefer_const_constructors, unrelated_type_equality_checks, unnecessary_string_interpolations, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/cubit/cubit.dart';
import 'package:flutter_application_1/layout/cubit/states.dart';
import 'package:flutter_application_1/layout/shop_layout/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_card/image_card.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../../model/categories.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: Shopcubit.get(context).homeModel != Null&&Shopcubit.get(context).categoriesModel != Null,
            builder: (context) =>
                proudctsbulider(Shopcubit.get(context).homeModel,Shopcubit.get(context).categoriesModel),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget proudctsbulider(HomeModel model, CategoriesModel  categoriesModel ) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: model.data.banners
                      .map(
                        (e) => Image(
                          image: NetworkImage('${e.image}'),
                          width: double.infinity,
                          // fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      height: 250.0,
                      initialPage: 2,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                      scrollDirection: Axis.horizontal,
                      aspectRatio: 2)),
              SizedBox(
                height: 10.0,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category's",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    // padding: EdgeInsets.all(10),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => CategoryItem(categoriesModel.data.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 1.0,
                      ),
                      itemCount: categoriesModel.data.data.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Product's",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 11.0,
                    crossAxisSpacing: 11.0,
                    childAspectRatio: 1 / 1.50,
                    children: List.generate(
                        model.data.products.length,
                        (index) =>
                            buildgridproduct(model.data.products[index]))),
              )
            ],
          ),
        ),
      );

  Widget buildgridproduct(ProuductsModel model) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white54,
              boxShadow: [
                BoxShadow(
                    color: Colors.purple.withOpacity(0.5),
                    offset: Offset(0, 20),
                    blurRadius: 4,
                    spreadRadius: -13)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  // alignment: Alignment.topLeft,
                  children: [
                    Image(
                      image: NetworkImage(model.image),
                      width: double.infinity,
                      height: 200.0,
                    ),
                    if (model.discount != 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    offset: Offset(0, 10),
                                    blurRadius: 4,
                                    spreadRadius: -11)
                              ],
                            ),
                            child: Icon(
                              Icons.discount,
                              color: Colors.red,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'sale',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      '${model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.0, height: 1.3, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price}',
                    style: TextStyle(
                        fontSize: 12.0, height: 1.3, color: Colors.blueAccent),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (model.discount != 0)
                    Text(
                      '${model.old_price}',
                      style: TextStyle(
                        fontSize: 10.0,
                        height: 1.3,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 15.0,
                      ))
                ],
              )
            ],
          ),
        ),
      );
}

Widget CategoryItem(DataModel  model) => Container(
      height: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RippleAnimation(
              child: CircleAvatar(
                maxRadius: 50.0,
                minRadius: 50.0,
                backgroundImage: NetworkImage(
                  model.image??"",
                ),
              ),
              color: Colors.purpleAccent,
              delay: const Duration(seconds: 1),
              repeat: true,
              minRadius: 22,
              ripplesCount: 6,
              duration: const Duration(seconds: 1 * 1),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            model.name??"",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              
            ),
            ),
        ],
      ),
    );
