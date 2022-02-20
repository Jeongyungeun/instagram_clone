import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.separated(
      itemBuilder: (context, index) {
          return ListTile(
            leading: RoundedAvatar(
              size: 20,
            ),
            title: Text('userName $index'),
            subtitle: Text('user bio number $index'),
            trailing: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.red[200],
                border: Border.all(
                  color: Colors.red,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'following',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
      },
      separatorBuilder: (context, index) {
          return Divider(thickness: 2,);
      },
      itemCount: 30,
    ),
        ));
  }
}
