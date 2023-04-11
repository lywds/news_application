import 'package:flutter/material.dart';
import 'package:news_321/content_page/content_page.dart';
import 'ListPageEntity.dart';
import 'model.dart';

class NewsListPage extends StatefulWidget {
  final String type;
  NewsListPage({Key? key, required this.type}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  NewsListModel model = NewsListModel();
  ListPageEntity? _newsList;
  int _currentPage = 1;
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  // 添加一个字符串变量，用于存储关键字
  String _searchKeyword = '';

  @override
  void initState() {
    super.initState();
    _fetchData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    //避免反复的进行网络请求，只有在当前网络请求失败后才进行下一次网络请求
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      ListPageEntity? newData = await model.getData(type: widget.type, page: _currentPage);
      if (newData != null) {
        setState(() {
          if (_newsList == null) {
            _newsList = newData;
          } else {
            _newsList!.data!.addAll(newData.data!);
          }
          _currentPage++;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // 添加一个方法，用于过滤包含关键字的新闻标题
  List<Data> _filterNewsByKeyword(String keyword) {
    if (keyword.isEmpty) {
      return _newsList!.data!;
    }

    return _newsList!.data!
        .where((news) => news.title!.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

    @override
    Widget build(BuildContext context) {
      return _newsList == null
          ? Center(child: CircularProgressIndicator())
          : Column(
            children: [
        // 添加一个搜索框，用于输入关键字
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
              setState(() {
                _searchKeyword = value;
              });
              },
              decoration: InputDecoration(
                labelText: '搜索',
                hintText: '输入关键字',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          // 显示过滤后的新闻标题
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _filterNewsByKeyword(_searchKeyword).length + 1,
              itemBuilder: (BuildContext context, int index) {
              if (index == _filterNewsByKeyword(_searchKeyword).length)
                return _buildProgressIndicator();
              else {
                    return ListTile(
                    onTap: () {
                      toNewsContentPage(context, link: _filterNewsByKeyword(_searchKeyword)[index].link!);
                    },
                    title: Text(
                      _filterNewsByKeyword(_searchKeyword)[index].title!,
                    ),
                    subtitle: Text(_filterNewsByKeyword(_searchKeyword)[index].date!),
                    );
                }
              },
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: _isLoading ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
