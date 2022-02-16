import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/comment.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

import '../constant/common_size.dart';
import '../constant/screen_size.dart';

class Post extends StatelessWidget {
  final int index;

  Post({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(size!),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: common_xxs_gap,
        horizontal: common_gap,
      ),
      child: Comment(showImage: false, text: 'show me the money', userName: 'testingUser',),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage('assets/image/bookmark.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage('assets/image/comment.png')),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage('assets/image/direct_message.png')),
          color: Colors.black87,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              'assets/image/heart_selected.png',
            ),
            color: Colors.red,
          ),
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(
            size: avatar_size,
          ),
        ),
        Expanded(child: Text('userName')),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          color: Colors.black,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(Size size) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/2000/2000',
      placeholder: (context, url) {
        return MyProgressIndicator(containerSize: size.width);
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
