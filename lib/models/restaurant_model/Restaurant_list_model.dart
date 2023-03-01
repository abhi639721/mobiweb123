

import 'Data.dart';

/// status : true
/// message : "Record Found"
/// data : [{"restaurantId":"1","restaurantName":"Birla Grocery Store","address":"Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad","image":"https://jumpq.ai/assets/uploads/stores/01.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":1},{"restaurantId":"2","restaurantName":"Sona Mall","address":"A113, Hapur Rd, A-Block, Shastri Nagar, Ghaziabad, Uttar Pradesh 201002","image":"https://jumpq.ai/assets/uploads/stores/02.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":true,"ratings":5},{"restaurantId":"3","restaurantName":"Hind Super Store","address":"105, New Gandhi Nagar, Ram Nagar, Nehru Nagar III, Main Market, Ghaziabad, Uttar Pradesh 201001","image":"https://jumpq.ai/assets/uploads/stores/03.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":4},{"restaurantId":"4","restaurantName":"Ankur Grocery Store","address":"MCFM+CPQ, B Block, B-Block, Lohia Nagar, Ghaziabad, Uttar Pradesh 201003","image":"https://jumpq.ai/assets/uploads/stores/04.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":true,"ratings":4},{"restaurantId":"5","restaurantName":"Akhil Grocery Store","address":"JCVJ+XF8, Street Number 4, Shamkarpuri Gadderia, Vijay Nagar Colony, Vijay Nagar, Ghaziabad, Uttar Pradesh 201009","image":"https://jumpq.ai/assets/uploads/stores/05.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":4},{"restaurantId":"6","restaurantName":"Krishna Super Store","address":"54, Old Munsfi Rd, Sabji Mandi, Ghantaghar, Naya Ganj, Ghaziabad, Uttar Pradesh 201001","image":"https://jumpq.ai/assets/uploads/stores/06.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":5},{"restaurantId":"7","restaurantName":"Vishal Store","address":"Gali Number 7, Sector 9, Rahul Vihar 2nd, Vijay Nagar, Ghaziabad, Uttar Pradesh 201009","image":"https://jumpq.ai/assets/uploads/stores/07.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":3},{"restaurantId":"8","restaurantName":"FORTUNE MART","address":"A-640/G, Police, Railway Station Rd, Vijay Nagar, Ghaziabad, 201009","image":"https://jumpq.ai/assets/uploads/stores/08.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":2},{"restaurantId":"9","restaurantName":"Mother Dairy","address":"R -24 Advocate Colony, Sector 12, Pratap Vihar, Vijay Nagar, Ghaziabad, Uttar Pradesh 201009","image":"https://jumpq.ai/assets/uploads/stores/09.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":1},{"restaurantId":"10","restaurantName":"Kushwaha Kirana Store","address":"L113, Sector 9, Vijay Nagar, Ghaziabad, Uttar Pradesh 201009","image":"https://jumpq.ai/assets/uploads/stores/10.jpg","timings":"Opens at 9 AM","openStatus":"Open","favourite":false,"ratings":3}]

class RestaurantListModel {
  RestaurantListModel({
      this.status, 
      this.message, 
      this.data,});

  RestaurantListModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}