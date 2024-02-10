import 'package:flutter/material.dart';
import 'package:news_api/controller/mycontroller.dart';
import 'package:news_api/view/news_list.dart';
import 'package:news_api/view/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Provider.of<MyController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<MyController>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  )),
              icon: Icon(Icons.search))
        ],
      ),
      body: homeController.isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 2.5),
              itemCount: homeController.apiResModel?.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return NewsList(
                    title: homeController.apiResModel?.articles?[index].title ??
                        "",
                    author:
                        homeController.apiResModel?.articles?[index].author ??
                            "",
                    description: homeController
                            .apiResModel?.articles?[index].description ??
                        "",
                    image: homeController
                            .apiResModel?.articles?[index].urlToImage ??
                        "",
                    date: homeController
                            .apiResModel?.articles?[index].publishedAt
                            .toString() ??
                        "");
              },
            ),
    );
  }
}
