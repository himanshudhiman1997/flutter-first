import 'package:flutter/material.dart';
import 'package:xl_demo/model/users_model.dart';

import 'users_list_row.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new UserRow(users[index]),
                  childCount: users.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
