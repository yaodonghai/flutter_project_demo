import 'package:flutter/material.dart';
import 'package:flutter_project_demo/page/gridView_page.dart';

import 'model/pageListModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DemoListView extends StatelessWidget {
  late List<PageListModel> modelList;
  @override
  Widget build(BuildContext context) {
    initData();
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return ListView.separated(
      itemCount: this.modelList.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        PageListModel model = this.modelList[index];
        return GestureDetector(onTap: () {
          jumpPage(context,index);
        },child:listItemView(model,index));;
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }
  void initData(){
    this.modelList = [
      PageListModel("gridList demo","path")];
  }

  void jumpPage(BuildContext context,int index){
    switch(index){
      case 0:
        {
          Navigator.of(context)
              .push( MaterialPageRoute(builder: (context){
                return const gridViewPage(title: "gridList demo");
              }) );
        }
        break;
    }
  }
}

class listItemView extends StatelessWidget {
    PageListModel model;
    int index;
  listItemView(this.model,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      alignment:Alignment.centerLeft ,
       height: 45.0,
      child: Text(this.model.name as String),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DemoListView() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose 生命周期 about");

  }

  //废弃，使用flutter boost的生命周期管理
  ///生命周期变化时回调
  //  resumed:应用可见并可响应用户操作
  //  inactive:用户可见，但不可响应用户操作
  //  paused:已经暂停了，用户不可见、不可操作
  //  suspending：应用被挂起，此状态IOS永远不会回调
  //@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //super.didChangeAppLifecycleState(state);
    print(" didChangeAppLifecycleState 生命周期  $state");
    if (state == AppLifecycleState.resumed) {
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies 执行");
  }

}

