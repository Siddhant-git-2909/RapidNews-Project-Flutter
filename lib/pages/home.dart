import 'package:flutter/material.dart';
import 'package:technewz/backend/functions.dart';
import 'package:technewz/components/appbar.dart';
import 'package:technewz/components/newsbox.dart';
import 'package:technewz/components/searchbar.dart' as custom_searchbar;
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  // SEARCH FUNCTION
  void searchNews(String query) {
    setState(() {
      news = fetchnews(query);
    });
  }

  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [

          custom_searchbar.SearchBar(
            onSearch: searchNews,
          ),

          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: news,

                builder: (context, snapshot) {

                  if (snapshot.hasData) {

                    return ListView.builder(
                      itemCount: snapshot.data!.length,

                      itemBuilder: (context, index) {

                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] ??
                              Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description']
                              .toString(),
                        );
                      },
                    );
                  }

                  else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}