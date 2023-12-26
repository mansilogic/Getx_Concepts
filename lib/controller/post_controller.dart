import 'package:get/get.dart';
import 'package:getxpractice/api/post_provider.dart';
import 'package:getxpractice/models/post_model.dart';

class PostsController extends GetxController {
  var posts = <PostModel>[].obs;
  var loading = false.obs;

  PostsProvider _provider = PostsProvider();

  getPosts() async {
    loading(true);
    var response = await _provider.getPosts();
    if (!response.status.hasError) {
      posts.value = postModelFromJson(response.bodyString ?? '');
    }
    loading(false);
  }
}
