class StoreData {
    String address="";
    String image="";
    String store_name="";
    String storeId="1";
    String timings="";
    String openStatus="";
    bool favourite=false;
    int ratings =0;

    StoreData({required this.address, required this.image, required this.store_name,required this.storeId,required this.timings,required this.openStatus,required this.favourite,required this.ratings});

    factory StoreData.fromJson(Map<String, dynamic> json) {
        return StoreData(
            address: json['address']??"",
            image: json['image']??"",
            store_name: json['store_name']??"",
            storeId: json['storeId']??"1",
            timings: json['timings']??"",
            openStatus:json['openStatus']??"",
            favourite:json['favourite']??false,
            ratings:json['ratings']??0,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['address'] = address;
        data['image'] = image;
        data['store_name'] = store_name;
        data['storeId'] = storeId;
        data['timings'] = timings;
        data['openStatus'] = openStatus;
        data['favourite'] = favourite;
        data['ratings'] = ratings;
        return data;
    }
  /*  Widget get storeList{
        return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, i) {
                return SuperMarketListCard(storeData:homeStoreController.storeList![0]);
            });
    }
}*/
}