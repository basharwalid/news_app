import 'package:flutter/material.dart';

import '../../Model/category.dart';
import '../../api/model/sources_response/Source.dart';
import '../../ui/catergory/categoryItem.dart';

class categoriesScreen extends StatelessWidget {

  Function callBack;
  categoriesScreen(this.callBack);
  @override
  Widget build(BuildContext context) {
    List<categoryModel> categories = [
      categoryModel(categoryid: "sports",title: "Sports", color: const Color(0xffC91C22), imagePath: "assets/images/sports.png"),
      categoryModel(categoryid: "general",title: "general", color: const Color(0xff003E90), imagePath: "assets/images/Politics.png"),
      categoryModel(categoryid: "health",title: "health", color: const Color(0xffED1E79), imagePath: "assets/images/health.png"),
      categoryModel(categoryid: "business",title: "Business", color: const Color(0xffCF7E48), imagePath: "assets/images/bussines.png"),
      categoryModel(categoryid: "technology",title: "technology", color: const Color(0xff4882CF), imagePath: "assets/images/environment.png"),
      categoryModel(categoryid: "science",title: "science", color: const Color(0xffF2D352), imagePath: "assets/images/science.png"),
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Pick Your Category \n Of Interest" ,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
            ),
              itemBuilder: (context , index){
                return InkWell(
                  onTap: (){
                    callBack(categories[index]);
                  },
                    child: CategoryItem(categories[index] , index));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
