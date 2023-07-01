import 'package:flutter/material.dart';

class settingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Language",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor, width: 2)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English" ,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14
                  ),
                ),
                Icon(Icons.arrow_downward_outlined ,
                  size: 20,
                  color: Theme.of(context).primaryColor ,
                )
              ],
            ),
          ) ,
        ],
      ),
    );
  }
}
