import 'package:first_project/202/service/post_model.dart';
import 'package:first_project/202/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServicePostView extends StatefulWidget {
  const ServicePostView({Key? key, PostModel? postModel})
      : _postModel = postModel,
        super(key: key);

  final PostModel? _postModel;

  @override
  State<ServicePostView> createState() => _ServicePostViewState();
}

class _ServicePostViewState extends State<ServicePostView> {
  bool _isLoading = false;
  late final PostService _postService;
  late final TextEditingController _textInputControllerTitle;
  late final TextEditingController _textInputControllerBody;
  late final TextEditingController _textInputControllerUserId;

  setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  Future<void> postItem() async {
    setLoading(true);
    PostModel post = PostModel(
        title: _textInputControllerTitle.text,
        body: _textInputControllerBody.text,
        userId: int.tryParse(_textInputControllerUserId.text));

    final result = await _postService.sendPostItem(post);

    var snackBar = SnackBar(
      content: Text(result == null ? 'Failed!!' : 'Success!!'),
      duration: const Duration(seconds: 2),
    );
    // Step 3
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pop(post);

    setLoading(false);

    // responsePost.title = _textInputControllerTitle.text;
    // responsePost.body = _textInputControllerBody.text;
    // responsePost.userId = int.tryParse(_textInputControllerUserId.text);
  }

  @override
  void initState() {
    _postService = PostService();
    _textInputControllerTitle = TextEditingController(text: widget._postModel?.title ?? '');
    _textInputControllerBody = TextEditingController(text: widget._postModel?.body ?? '');
    _textInputControllerUserId = TextEditingController(text: widget._postModel?.userId.toString() ?? '0');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextField(
              controller: _textInputControllerTitle,
              decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _textInputControllerBody,
              decoration: const InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _textInputControllerUserId,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'UserId', border: OutlineInputBorder()),
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  if (newValue.text.isNumber || newValue.text.isEmpty) return newValue;
                  return oldValue;
                }),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_isLoading
                  ? () {
                      postItem();
                    }
                  : null,
              child: const Icon(Icons.send),
            )
          ],
        ),
      ),
    );
  }
}

extension String2Extension on String {
  bool get isNumber => num.tryParse(this) != null;
}
