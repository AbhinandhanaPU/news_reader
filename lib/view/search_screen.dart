import 'package:flutter/material.dart';
import 'package:news_api/controller/searchController.dart';
import 'package:news_api/view/news_list.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    final searchControllerClass = Provider.of<MySearchController>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Provider.of<MySearchController>(context, listen: false)
                            .fetchSearchData(
                                searchItem:
                                    searchController.text.toLowerCase());
                        isSearched = true;
                      },
                      icon: Icon(Icons.search)),
                  border: OutlineInputBorder(),
                  hintText: "Search"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isSearched == false
                  ? Text("Search anything")
                  : searchControllerClass.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(thickness: 2.5),
                          itemCount: searchControllerClass
                              .searchResModel!.articles!.length,
                          itemBuilder: (context, index) {
                            return NewsList(
                                title: searchControllerClass.searchResModel
                                        ?.articles?[index].title ??
                                    "",
                                author: searchControllerClass.searchResModel
                                        ?.articles?[index].author ??
                                    "",
                                description: searchControllerClass
                                        .searchResModel
                                        ?.articles?[index]
                                        .description ??
                                    "",
                                image: searchControllerClass.searchResModel
                                        ?.articles?[index].urlToImage ??
                                    "",
                                date: searchControllerClass.searchResModel
                                        ?.articles?[index].publishedAt
                                        .toString() ??
                                    "");
                          },
                        ),
            )
          ]),
        ),
      ),
    );
  }
}
