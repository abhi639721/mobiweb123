import 'package:flutter/material.dart';
import 'package:jump_q/models/dashboard/Topdeal.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/product/product_list_view.dart';
class Carousel extends StatefulWidget {


   const Carousel({Key? key, required this.topdeal}) : super(key: key);
   final List<Topdeal> topdeal;


  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;



  int activePage = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 1.0, initialPage: 1);

  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    for (var element in widget.topdeal) { list.add(element.offerImage);}
    return Padding(padding: EdgeInsets.only(top: size_10),child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: PageView.builder(
              itemCount: widget.topdeal.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(widget.topdeal,pagePosition,active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(widget.topdeal.length,activePage))
      ],
    ),);
  }
}

InkWell slider(List<Topdeal> topdeal, pagePosition, active) {
  double margin = active ? 2 : 4;
  String imageUrl = topdeal[pagePosition].offerImage;

  return InkWell(child:roundedCardForImage(imageUrl,margin) ,onTap: (){ProductListView.start(topdeal[pagePosition].couponName,categoryId:topdeal[pagePosition].id,storeId:topdeal[pagePosition].storeId );},);
}
Widget  roundedCardForImage(String imageUrl,double margin){
  return Card(elevation:3,shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),child: Container(decoration:  BoxDecoration(borderRadius: BorderRadius.circular(15.0),
    image: DecorationImage(
      fit: BoxFit.fill,
      image: NetworkImage(imageUrl),
    ),
  ),),);
}
imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      debugPrint(pagePosition);

      return SizedBox(
        width: 100,
        height: 100,
        child: widget,
      );
    },
    child: InkWell(child: Image.network(images[pagePosition]),onTap: (){

    },),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: currentIndex == index ? MyColors.appColor : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}