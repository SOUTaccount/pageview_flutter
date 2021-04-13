import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(ScreenWidget());
}
class ScreenWidget extends StatelessWidget{
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView'),
        ),
        body: PageViewCustomWidget(),
      ),
    );
  }
}
class PageViewWidget extends StatelessWidget{
  final PageController controller=PageController(initialPage: 1);
  Widget build(BuildContext context){
    return PageView(
      scrollDirection: Axis.vertical,
      //pageSnapping: false,
      //physics: NeverScrollableScrollPhysics(),
      //physics: BouncingScrollPhysics(),
      controller: controller,
     // onPageChanged: (number){
     //   print("Page number $number");
     // },
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Center(
            child: Text('Stop!'),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Center(
            child: Text('Ready?'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children :[
              Text(
    '           Go!',
                style: TextStyle(fontSize: 40),
                ),
          RaisedButton(
            child: Text('Reload'),
            color: Colors.blue,
            onPressed: (){
            //controller.jumpToPage(0);
              controller.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInBack);
            }
    )
    ],
          ),
        ),
      ],
    );
  }
}
class PageViewBuilderWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return PageView.builder(
        itemBuilder: (BuildContext context,int index){
          return Container(
            color: index%2==0? Colors.red : Colors.greenAccent,
            alignment: Alignment.center,
            child: Text('$index'),
          );
    },
    );
  }
}
class PageViewCustomWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return PageView.custom(childrenDelegate: SliverChildListDelegate([
      Text('1'),
      Text('2'),
      Text('3'),
    ])
    );
  }
}
