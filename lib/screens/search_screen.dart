import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> followings = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              followings[index] = !followings[index];
              setState(() {
              });
            },
            leading: RoundedAvatar(
              size: 80,
            ),
            title: Text('userName $index'),
            subtitle: Text('user bio number $index'),
            trailing: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: followings[index] ? Colors.red[200] : Colors.blueAccent,
                border: Border.all(
                  color: followings[index] ? Colors.red : Colors.blue,
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
          return Divider(
            thickness: 2,
          );
        },
        itemCount: followings.length,
      ),
    ));
  }
}
