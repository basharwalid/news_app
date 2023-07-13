import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:newsapp/Model/category.dart';
import 'package:newsapp/Theme/Mytheme.dart';
import 'package:newsapp/screens/articles/articlesScreen.dart';
import 'package:newsapp/screens/categories_screen/categories_screen.dart';
import 'package:newsapp/screens/settings/settings_screen.dart';
import 'package:newsapp/ui/catergory/categoryItem.dart';
import 'package:newsapp/ui/searchScreen/SearchScreen.dart';

import '../screens/home_news_fragment/home_news_fragment.dart';

class homelayout extends StatefulWidget {
  static const String routeName = 'category screen';

  @override
  State<homelayout> createState() => _homelayoutState();
}

class _homelayoutState extends State<homelayout> {
  categoryModel? SelectedCategorey;
  bool SelectedSetting = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          drawer: Drawer(
              child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "News APP!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  SelectedCategorey = null;
                  SelectedSetting = false;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Icon awesome-th-list.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  SelectedSetting = true;
                  SelectedCategorey=null;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Icon ionic-md-settings.png"),
                      const SizedBox(width: 10),
                      Text(
                        "Setting",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
                SelectedCategorey == null
                ? SelectedSetting?"Setting": "News app"
                : SelectedCategorey!.title),
            actions: SelectedCategorey == null
                ? null
                : [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SearchScreen.routeName , arguments: SelectedCategorey!.categoryid);
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 30,
                        ))
                  ],
          ),
          body:SelectedCategorey == null
              ? SelectedSetting?settingScreen():categoriesScreen(selectedCategory)
              :HomeNewsFragment(SelectedCategorey!),
        ));
  }

  selectedCategory(categoryModel category) {
    SelectedCategorey = category;
    setState(() {});
  }
}
