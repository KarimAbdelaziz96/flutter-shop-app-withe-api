// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/cubit/cubit.dart';
import 'package:flutter_application_1/layout/cubit/states.dart';
import 'package:flutter_application_1/modules/search/search_screen.dart';
import 'package:flutter_application_1/shaerd/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Shoplayout extends StatefulWidget {
  const Shoplayout({super.key});

  @override
  State<Shoplayout> createState() => _ShoplayoutState();
}

class _ShoplayoutState extends State<Shoplayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Shopcubit.get(context);
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                '(KG)STORE',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      NavigatTO(context, SearchScreen());
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ]),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: SalomonBottomBar(
            onTap: (index) {
              cubit.ChangeBottomNAn(index);
            },
            currentIndex: cubit.currentindex,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.apps),
                title: Text("Categories"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favorites"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        );
      },
    );
  }
}
