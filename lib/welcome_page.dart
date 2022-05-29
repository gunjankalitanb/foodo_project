import 'package:basic/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class WelcomePage extends StatelessWidget {
final controller = PageController();


@override
void dispose(){
  controller.dispose();





}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
      child: PageView(
        controller: controller,
        children: [

          Container(
            color: Colors.grey,
            child: Column(
              children: [ 
                Image.asset("assets/images/hehehe.jpeg",
                height: 469,),
                Text("Fresh Food",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                ),

                SizedBox(
                  height: 20,
                ),
                Text("hii hello byee byee",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                ),
                ),

              ],
            ),
          ),

          Container(
            color: Colors.pink ,
            child: const Center(
              child: Text("Page 2"),
            ),
          ),

          Container(
            color: Colors.pink ,
            child: const Center(
              child: Text("Page 3"),
            ),
          ),
        ],
      ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal:50),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () => controller.jumpTo(2),
                child: Text("SKIP"),

            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn,),
              ),
            ),
            TextButton(onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut,),
              child: Text("NEXT"),
            ),
          ],
        ),
      ),
    );
  }
}
