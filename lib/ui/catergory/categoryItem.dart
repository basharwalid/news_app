import 'package:flutter/material.dart';
import 'package:newsapp/Model/category.dart';

class CategoryItem extends StatelessWidget {
  categoryModel category;
  int index;
  CategoryItem(this.category , this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/pattern.png")
          ),
          color: category.color,
          borderRadius: BorderRadius.only(topLeft:const Radius.circular(30),
              topRight: const Radius.circular(30),
              bottomRight: index%2==0?Radius.zero:const Radius.circular(30),
              bottomLeft: index%2==0?const Radius.circular(30): Radius.zero
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(category.imagePath ,
              height: MediaQuery.of(context).size.height*0.17,
              width: MediaQuery.of(context).size.height*0.2,
            ),
            const SizedBox(height: 10),
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
