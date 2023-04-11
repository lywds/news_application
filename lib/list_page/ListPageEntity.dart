/// current_page : 1
/// data : [{"date":"2023-03-24","link":"https://xwzx.cumt.edu.cn/cf/69/c513a642921/page.htm","title":"我校陈飞宇副教授绿色低碳相关研究成果获江苏省政府主要领导批示"},{"date":"2023-03-22","link":"https://xwzx.cumt.edu.cn/ce/5a/c513a642650/page.htm","title":"我校“双碳”领域国家社科基金重大项目通过结项"},{"date":"2023-03-14","link":"https://xwzx.cumt.edu.cn/ca/05/c513a641541/page.htm","title":"我校人文与艺术学院刘超捷教授科研团队承担国家应急管理部相关规章修订起草工作"},{"date":"2023-03-07","link":"https://xwzx.cumt.edu.cn/c8/28/c513a641064/page.htm","title":"化工学院俞和胜教授指导孙越崎学院本科生在光催化降解选矿废水领域取得新进展"},{"date":"2023-02-27","link":"https://xwzx.cumt.edu.cn/c6/59/c513a640601/page.htm","title":"国家重点研发计划项目“煤与共伴生战略性金属矿产协调开采理论与技术”2022年度进展研讨会召开"},{"date":"2023-02-22","link":"https://xwzx.cumt.edu.cn/c5/a4/c513a640420/page.htm","title":"我校资源与地球科学学院教师周昌在岩土工程韧性防控理论与关键技术方面取得系列成果"},{"date":"2023-02-21","link":"https://xwzx.cumt.edu.cn/c5/31/c513a640305/page.htm","title":"国家重点研发计划项目“复杂地质条件煤矿辅助运输机器人”顺利通过中期检查"},{"date":"2023-02-16","link":"https://xwzx.cumt.edu.cn/c4/7d/c513a640125/page.htm","title":"环境与测绘学院胡振琪教授参加采矿遗迹管理国际标准（Managing mining legacies）专家研讨会"},{"date":"2023-02-01","link":"http://xwzx.cumt.edu.cn/c3/a6/c513a639910/page.htm","title":"材料与物理学院陈雷鸣教授在活性物质领域取得研究进展"},{"date":"2023-01-19","link":"http://xwzx.cumt.edu.cn/c3/5c/c513a639836/page.htm","title":"深部煤炭资源开采教育部重点实验室召开2022年度学术委员会会议"},{"date":"2023-01-15","link":"http://xwzx.cumt.edu.cn/c3/2d/c513a639789/page.htm","title":"国家重点研发计划“煤矿灾害融合监控与决策数字化关键技术装备及示范应用”项目启动暨实施方案论证会召开"},{"date":"2022-12-28","link":"http://xwzx.cumt.edu.cn/c1/64/c513a639332/page.htm","title":"国家重点研发计划“深部岩溶塌陷风险精准防控技术装备研发”项目启动暨实施方案论证会召开"},{"date":"2022-12-26","link":"http://xwzx.cumt.edu.cn/c0/2e/c513a639022/page.htm","title":"我校举行前沿实践创新论坛暨第三届博士后交叉创新论坛"},{"date":"2022-12-22","link":"http://xwzx.cumt.edu.cn/bf/e6/c513a638950/page.htm","title":"我校提供核心技术的国内印染行业首个CCUS示范工程投运成功"}]
/// max_page : 32
/// type : "学术聚焦"

class ListPageEntity {
  ListPageEntity({
      int? currentPage, 
      List<Data>? data, 
      int? maxPage, 
      String? type,}){
    _currentPage = currentPage;
    _data = data;
    _maxPage = maxPage;
    _type = type;
}

  ListPageEntity.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _maxPage = json['max_page'];
    _type = json['type'];
  }
  int? _currentPage;
  List<Data>? _data;
  int? _maxPage;
  String? _type;
ListPageEntity copyWith({  int? currentPage,
  List<Data>? data,
  int? maxPage,
  String? type,
}) => ListPageEntity(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  maxPage: maxPage ?? _maxPage,
  type: type ?? _type,
);
  int? get currentPage => _currentPage;
  List<Data>? get data => _data;
  int? get maxPage => _maxPage;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['max_page'] = _maxPage;
    map['type'] = _type;
    return map;
  }

}

/// date : "2023-03-24"
/// link : "https://xwzx.cumt.edu.cn/cf/69/c513a642921/page.htm"
/// title : "我校陈飞宇副教授绿色低碳相关研究成果获江苏省政府主要领导批示"

class Data {
  Data({
      String? date, 
      String? link, 
      String? title,}){
    _date = date;
    _link = link;
    _title = title;
}

  Data.fromJson(dynamic json) {
    _date = json['date'];
    _link = json['link'];
    _title = json['title'];
  }
  String? _date;
  String? _link;
  String? _title;
Data copyWith({  String? date,
  String? link,
  String? title,
}) => Data(  date: date ?? _date,
  link: link ?? _link,
  title: title ?? _title,
);
  String? get date => _date;
  String? get link => _link;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['link'] = _link;
    map['title'] = _title;
    return map;
  }

}