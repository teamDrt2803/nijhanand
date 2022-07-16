import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../helper/routes.dart';
import '../modals/bhajan_modal.dart';

class SearchWidget extends SearchDelegate<Bhajan> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);
  }
}

class SearchFinder extends StatelessWidget {
  final String query;

  const SearchFinder({Key? key, required this.query}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Bhajan>('Bhajans').listenable(),
      builder: (context, Box<Bhajan> bhajanBox, _) {
        ///* this is where we filter data
        var results = query.isEmpty
            ? bhajanBox.values.toList() // whole list
            : bhajanBox.values.where((c) => c.lyrics.contains(query)).toList();

        return results.isEmpty
            ? Center(
                child: Text(
                  'No results found !',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                      ),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  // passing as a custom list
                  final Bhajan bhajanListItem = results[index];

                  return ListTile(
                    onTap: () {
                      Get.toNamed(Routes.lyrics, arguments: {
                        "bhajan": bhajanListItem,
                      });
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bhajanListItem.title,
                          textScaleFactor: 1.0,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
