import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxpractice/controller/post_controller.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Posts'),
              backgroundColor: const Color.fromARGB(255, 229, 161, 140),
            ),
            body: controller.loading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: controller.posts
                        .map<Widget>((post) => ListTile(
                              leading: Text(post.id.toString()),
                              title: Text(post.title),
                              subtitle: Text(post.body),
                              trailing: Text('User ${post.userId}'),
                            ))
                        .toList(),
                  ),
            
          );
        });
  }
}
