class CoinModel {
  List<String> result;

  CoinModel({this.result});

  CoinModel.fromJson(Map<String, dynamic> json) {
    result = json['result'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}