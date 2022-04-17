import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:technews_app/backend/functions.dart';
import 'package:technews_app/components/newsbox.dart';
import 'package:technews_app/utils/colors.dart';
import 'package:technews_app/utils/constants.dart';
import 'package:technews_app/utils/search_bar.dart';
import 'package:technews_app/utils/text.dart';


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
    news=FetchNews() ;
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 2.0,
        title: Container(
          height: 40,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Tech',style: TextStyle(
                  // height: 40.0,
                  color: AppColors.primary,
                  fontSize: 20.0
                ),),
              ),
              Center(
                child: Text('News',style: TextStyle(
                    color: AppColors.lightWhite,
                    // height: 40.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(child: Container(
            width: w,
            child: FutureBuilder<List>(
              future: FetchNews(),
              builder: (context ,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return NewsBox(
                            url:snapshot.data![index]['url'],
                            imageurl:snapshot.data![index]['urlToImage'] != null ?snapshot.data![index]['urlToImage']:Constants.imageurl,
                            title:snapshot.data![index]['title'],
                            time:snapshot.data![index]['publishedAt'],
                            description: snapshot.data![index]['description'].toString(),
                        );
                      }
                  );
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }

                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              },

            ),
          ))
        ],
      ),
    );
  }
}
