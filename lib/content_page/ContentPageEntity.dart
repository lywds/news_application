/// author : "李居铭"
/// contents : [{"content":"https://xwzx.cumt.edu.cn/_upload/article/images/f4/b1/ccbc653c4480a6dd04fa34e18894/13af0f94-65e1-49f1-9f2c-880e3e51f833.png","type":"image"},{"content":"近日，我校化工学院俞和胜教授指导孙越崎学院本科生沈明威在连续流光催化降解选矿废水领域取得新进展，成果以论文“Visible-light-driven photodegradation of xanthate in a continuous fixed-bed photoreactor: Experimental study and modeling”发表于化工领域国际顶级期刊《Chemical Engineering Journal》。该期刊2021年影响因子达16.744，位于中科院一区（基础版和升级版）TOP期刊、JCR一区。我校孙越崎学院2020级本科生沈明威为该成果第一作者，化工学院俞和胜教授为独立通讯作者，中国矿业大学为唯一通讯单位。","type":"text"},{"content":"近年来，孙越崎学院持续构建人才培养的质量保障体系，在学校支持下，在教学体系改革、师资配备、科研实践、国际交流等方面，为拔尖创新人才的成长提供持续优质的资源供给。2020年，沈明威同学经选拔进入孙越崎学院。一方面，孙越崎学院为有学术志趣、潜力的学生打造的“一人一策”个性化培养方案为沈明威打下了坚实的科学研究“底层能力”。另一方面，孙越崎学院灵活和模块化的培养方案和课程体系，为沈明威自主探究留足空间。两年来，在创新导师俞和胜教授的悉心指导下，沈明威同学在潜移默化中提高了自己的学习和科研能力，最终形成这一成果。","type":"text"},{"content":"我国是世界上矿产资源比较丰富，矿物种类众多的国家。矿产资源是发展之基、生产之要。在“碳中和”目标的驱动下，全球能源系统向清洁化、低碳化甚至无碳化发展已是大势所趋。这对我国矿产资源高效清洁利用提出了更高的要求。我国每年约产生2亿吨选矿废水，其中浮选残留药剂为主要的污染物之一。黄药是硫化矿浮选过程中最常用的捕收剂。在选矿废水排放和回用前对残余黄药进行降解处理十分重要。","type":"text"},{"content":"该研究设计了基于可见光催化剂钨酸铋的连续流固定床光催化选矿废水处理系统（已获批国家发明专利，专利号：ZL202111160788.9）。使用化学吸附与煅烧相结合的方法将钨酸铋催化剂负载于玻璃珠载体，并研究该反应器连续降解黄药的性能。使用模拟太阳光的可见光源激发催化剂，首次在连续流条件下系统地研究了多种因素对可见光催化降解黄药的影响，并建立反应器的数学模型。试验结果表明该系统能充分利用太阳能，高效降解黄药污染物，所建立的反应器模型可靠、准确，为选矿废水的高效、绿色降解提供了新思路。","type":"text"},{"content":"近2年，俞和胜教授团队相关课题的研究性系列文章已发表于Chemical Engineering Journal (2021，2023，IF: 16.744)、Small (2023，IF：15.153)、Journal of Materials Chemistry A (2022，IF: 14.511)、Environment International (2023，IF: 13.352)、Applied Energy (2022，IF: 11.446)、Carbon (2022两篇，IF:11.307)等国际知名学术期刊。","type":"text"},{"content":"该研究工作受国家自然科学基金项目国家自然科学基金(No. 51878655)、江苏特聘教授计划、江苏省“六大人才高峰”高层次人才工程项目(No. JNHB-088)、江苏省“双创博士”计划、徐州市重点研发计划（社会发展）、中国矿业大学越崎引智计划项目（YQYZ2021-6）、中国矿业大学大学生创新创业训练计划(No. 202110290094Z)资助。","type":"text"},{"content":" ","type":"text"},{"content":"文章链接：https://doi.org/10.1016/j.cej.2023.141833","type":"text"}]
/// date : "2023-03-07"
/// title : "化工学院俞和胜教授指导孙越崎学院本科生在光催化降解选矿废水领域取得新进展"
/// visit_count : 2650

class ContentPageEntity {
  ContentPageEntity({
    String? author,
    List<Contents>? contents,
    String? date,
    String? title,
    int? visitCount,}){
    _author = author;
    _contents = contents;
    _date = date;
    _title = title;
    _visitCount = visitCount;
  }

  ContentPageEntity.fromJson(dynamic json) {
    _author = json['author'];
    if (json['contents'] != null) {
      _contents = [];
      json['contents'].forEach((v) {
        _contents?.add(Contents.fromJson(v));
      });
    }
    _date = json['date'];
    _title = json['title'];
    _visitCount = json['visit_count'];
  }
  String? _author;
  List<Contents>? _contents;
  String? _date;
  String? _title;
  int? _visitCount;
  ContentPageEntity copyWith({  String? author,
    List<Contents>? contents,
    String? date,
    String? title,
    int? visitCount,
  }) => ContentPageEntity(  author: author ?? _author,
    contents: contents ?? _contents,
    date: date ?? _date,
    title: title ?? _title,
    visitCount: visitCount ?? _visitCount,
  );
  String? get author => _author;
  List<Contents>? get contents => _contents;
  String? get date => _date;
  String? get title => _title;
  int? get visitCount => _visitCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    if (_contents != null) {
      map['contents'] = _contents?.map((v) => v.toJson()).toList();
    }
    map['date'] = _date;
    map['title'] = _title;
    map['visit_count'] = _visitCount;
    return map;
  }

}

/// content : "https://xwzx.cumt.edu.cn/_upload/article/images/f4/b1/ccbc653c4480a6dd04fa34e18894/13af0f94-65e1-49f1-9f2c-880e3e51f833.png"
/// type : "image"

class Contents {
  Contents({
    String? content,
    String? type,}){
    _content = content;
    _type = type;
  }

  Contents.fromJson(dynamic json) {
    _content = json['content'];
    _type = json['type'];
  }
  String? _content;
  String? _type;
  Contents copyWith({  String? content,
    String? type,
  }) => Contents(  content: content ?? _content,
    type: type ?? _type,
  );
  String? get content => _content;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['type'] = _type;
    return map;
  }

}