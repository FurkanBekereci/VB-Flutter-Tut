import 'package:first_project/101/navigation_view.dart';
import 'package:first_project/202/service/post_model.dart';
import 'package:first_project/202/service/post_service.dart';
import 'package:first_project/202/service/service_post_view.dart';
import 'package:flutter/material.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({Key? key}) : super(key: key);

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> with NavigatorManager {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final IPostService _postService;

  setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void fetchItemsAdvanced() async {
    setLoading(true);
    List<PostModel>? postModelResult = await _postService.fetchPostItems();

    setState(() {
      _items = postModelResult;
    });

    setLoading(false);
  }

  @override
  void initState() {
    _postService = PostService();
    fetchItemsAdvanced();
    super.initState();
  }

  void _openPostForm() async {
    final result = await navigateToWidgetNormal(context, const ServicePostView());

    if (result != null && result is PostModel) {
      _addPostToList(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          PostModel? post = _items?[index];
          return _PostCard(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPostForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addPostToList(PostModel post) {
    setState(() {
      _items?.insert(0, post);
    });
  }
}

class _PostCard extends StatelessWidget with NavigatorManager {
  const _PostCard({
    Key? key,
    required PostModel? post,
  })  : _post = post,
        super(key: key);

  final PostModel? _post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          navigateToWidgetNormal(context, ServicePostView(postModel: _post));
        },
        title: Text(_post?.title ?? ''),
        subtitle: Text(_post?.body ?? ''),
      ),
    );
  }
}
