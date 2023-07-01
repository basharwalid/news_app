import 'package:flutter/material.dart';
import 'package:newsapp/ui/catergory/tab_item.dart';

class articleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/articleimage.png"),fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),

        ),
        const SizedBox(height: 10,),
        Text( "BBC news",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10,),
        const Text('Why are footballs biggest clubs starting a new tournament?' ,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black
          ),
        ),
        const SizedBox(height: 10,),
        Align(
          alignment: Alignment.centerRight,
            child: Text(
              "3 hours ago" , style: Theme.of(context).textTheme.titleLarge,
            ))
      ],
    );
  }
}
