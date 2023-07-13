import 'package:flutter/material.dart';
import 'package:newsapp/News/news_item.dart';
import 'package:newsapp/api/apiManager.dart';
import 'package:newsapp/api/model/sources_response/News.dart';
import 'package:newsapp/api/model/sources_response/NewsResponse.dart';
import 'package:newsapp/api/model/sources_response/Source.dart';
import 'package:newsapp/ui/catergory/tab_item.dart';


class SearchScreen extends StatefulWidget {
  static const String routeName = 'search par';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String Query = '' ;

  TextEditingController searchControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var MediaQ = MediaQuery.of(context).size;
    String categori = ModalRoute.of(context)?.settings.arguments as String;
    print(categori);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: 75,
            leading: const SizedBox(),
            leadingWidth: 0,
            title: TextFormField(
              onChanged: (input) {
                setState(() {
                  Query = input ;
                });
              },
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                prefixIcon: IconButton(
                  icon: Icon(Icons.close_rounded,
                      color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                focusColor: Theme.of(context).primaryColor,
                hintText: "Search Article",
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )),
        body: Container(
            padding:const EdgeInsets.all(20),
            child: FutureBuilder<NewsResponse>(
              future: apiManager.Searchin(query: Query),
              builder: (context, snapshot) {
                if(snapshot.connectionState ==  ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError){
                  return Center(
                    child: Text(
                      snapshot.hasError.toString(),
                    ),
                  );
                }
                if (snapshot.data?.status == 'error'){
                  return Center(
                    child: Text(
                      snapshot.data!.code!,
                    ),
                  );
                }else {
                  return ListView.builder(
                    itemBuilder: (context, index) => NewsItem(snapshot.data!.newsList![index]),
                    itemCount: snapshot.data?.newsList?.length??0,
                  );
                }
              },
            )
        ),
      ),
    );
  }
}