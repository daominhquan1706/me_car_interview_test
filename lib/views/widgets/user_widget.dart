import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String userId;

  const UserWidget({
    Key? key,
    required this.avatarUrl,
    required this.userName,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: CircleAvatar(
            child: Image.asset(avatarUrl),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                userId,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
