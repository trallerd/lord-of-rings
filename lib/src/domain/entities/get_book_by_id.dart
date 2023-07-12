class BookByID {
  List<Docs>? docs;
  int? total;
  int? limit;
  int? offset;
  int? page;
  int? pages;

  BookByID(
      {this.docs, this.total, this.limit, this.offset, this.page, this.pages});

  BookByID.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(Docs.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    offset = json['offset'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['limit'] = limit;
    data['offset'] = offset;
    data['page'] = page;
    data['pages'] = pages;
    return data;
  }
}

class Docs {
  String? sId;
  String? name;

  Docs({this.sId, this.name});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
