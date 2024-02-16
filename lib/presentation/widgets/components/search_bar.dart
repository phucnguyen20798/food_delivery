import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/constants/app_color.dart';
import 'package:pinput/pinput.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: TextField(
        onTap: () {
          showSearch(context: context, delegate: StoreSearchDelegate());
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Tìm kiếm nhà hàng, quán ăn,...',
          hintMaxLines: 1,
          hintStyle: TextStyle(
            fontSize: 14.0,
            overflow: TextOverflow.ellipsis,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class StoreSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Tìm kiếm nhà hàng, quán ăn,...';

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(fontSize: 16.0, color: Colors.black);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 1.0,
          backgroundColor: AppColor.backgroundColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
          : IconButton(
              onPressed: () {
                query = '';
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
