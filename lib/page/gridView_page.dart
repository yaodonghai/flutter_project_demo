
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridViewPage extends StatefulWidget {
  final String title;
  const gridViewPage({this.title = "gridviewpage"});
  @override
  State<gridViewPage> createState() => _gridViewPageState();
}

class _gridViewPageState extends State<gridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body:InfiniteGridView(),
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({super.key});
  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<String> _nameList = [];
  final double leftRightMargin = 15.0;
  final double mainSpacing = 10.0;
  final double crossSpacing = 10.0;
  final double itemHeight = 30.0;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    var itemWidth = (width - this.leftRightMargin*2 -this.crossSpacing ) *0.5;
    double itemRatio =  itemWidth/this.itemHeight - 0.001;
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: this.mainSpacing,
        crossAxisSpacing:this.crossSpacing,
        crossAxisCount: 2,
        childAspectRatio: itemRatio, //显示区域宽高相等
      ),
      itemCount: _nameList.length,
      padding: EdgeInsets.only(left: this.leftRightMargin, right: this.leftRightMargin),
      itemBuilder: (context, index) {
        if (index == _nameList.length - 1 && _nameList.length < 200) {
          _retrieveIcons();
        }
        return GestureDetector(onTap: () {
        print("点击了第$index个");
        },child:_buildItem(context,index));
      },
    );
  }
//模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _nameList.addAll([
        "name1",
          "name2",
          "name3",
        ]);
      });
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.tealAccent,
          // gradient: LinearGradient(colors:[Colors.red,Colors.orange.shade700]),
          borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
          )
        ]
      ),
      child: Container(
        alignment: Alignment.center,
        color: Colors.tealAccent,
        child: Text("$index",style: TextStyle(color: Colors.black,backgroundColor: Colors.red,fontSize: 20),),
      )
    );
  }
}
