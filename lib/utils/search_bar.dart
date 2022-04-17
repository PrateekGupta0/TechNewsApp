import 'package:flutter/material.dart';
import 'package:technews_app/backend/functions.dart';
import 'package:technews_app/utils/colors.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static TextEditingController searchController=TextEditingController(text: '');
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          height: 50.0,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(50.0),

          ),
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(child: TextField(
                  controller: SearchBar.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search a keyword or a Phrase',
                    hintStyle: TextStyle(
                      // height: 40.0,
                        color: AppColors.primary,
                        fontSize: 20.0
                    ),
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
          ),

        )),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            FetchNews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 10,),
      ],
    );
  }
}
