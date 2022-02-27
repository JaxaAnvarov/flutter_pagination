import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination/core/model/photos_model.dart';
import 'package:pagination/service/pagination_service.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  static const _pageSize = 20;

  final PagingController<int, PhotosModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<PhotosModel> newListItem =
          await PhotosService.getDate(pageKey, _pageSize);
      final isLastPage = newListItem.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newListItem);
      } else {
        final nextPageKey = pageKey + newListItem.length;
        _pagingController.appendPage(newListItem, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PagedListView<int, PhotosModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<PhotosModel>(
            itemBuilder: (context, item, index) => Text(
              item.title.toString(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
