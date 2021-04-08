import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:resu_mo/anhdhq/route_generator.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      initialRoute: '/',
      home: MyStatefulWidget(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var name = '';
  final nameController = TextEditingController();
  final String url =
      'http://10.0.2.2:8080/api/getUserProfile/606e75b35bd58f09ec8453ce';

  //fetch data from api
  void initData() async {
    final Dio dio = new Dio();
    try {
      var response = await dio.get(url);
      print(response.data['data']['name']);
      name = response.data['data']['name'];
      nameController.text = name;
    } on DioError catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initData();
    nameController.text = name;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("マイぺ-ジ"),
            leading: GestureDetector(),
            actions: <Widget>[],
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SafeArea(
                    child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: SafeArea(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  tabs: [
                    Tab(
                        child: Text('基本情報',
                            style: TextStyle(color: Colors.black))),
                    Tab(
                        child: Text('職務経歴',
                            style: TextStyle(color: Colors.black))),
                    Tab(
                        child: Text('希望条件',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    ListView(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: '氏名'),
                          controller: nameController,
                          onTap: () => {
                            Navigator.of(context)
                                .pushNamed('enter-name', arguments: name)
                          },
                        ),
                        TextField(
                            decoration: InputDecoration(labelText: '生年月日')),
                        TextField(decoration: InputDecoration(labelText: '年齢')),
                        TextField(
                            decoration: InputDecoration(labelText: '雷話番号')),
                        TextField(
                            decoration: InputDecoration(labelText: 'メ一ルアドレス')),
                        TextField(decoration: InputDecoration(labelText: '性別')),
                        TextField(
                            decoration: InputDecoration(labelText: '医師免許証')),
                        TextField(
                            decoration: InputDecoration(labelText: '最終学歴')),
                        TextField(
                            decoration: InputDecoration(labelText: '現住所')),
                        TextField(
                            decoration:
                                InputDecoration(labelText: '通勤手段 ・ 最寄り駅')),
                        TextField(
                            decoration: InputDecoration(labelText: '出身地')),
                        TextField(
                            decoration:
                                InputDecoration(labelText: '扶養対象の有無・ 家族構成')),
                        TextField(
                            decoration: InputDecoration(labelText: 'ご実家について')),
                        TextField(
                            decoration: InputDecoration(labelText: '将来の開業意思')),
                        TextField(decoration: InputDecoration(labelText: '趣味')),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(title: Text('January')),
                        ListTile(title: Text('February')),
                        ListTile(title: Text('March')),
                        ListTile(title: Text('April')),
                        ListTile(title: Text('May')),
                        ListTile(title: Text('June')),
                        ListTile(title: Text('July')),
                        ListTile(title: Text('August')),
                        ListTile(title: Text('September')),
                        ListTile(title: Text('October')),
                        ListTile(title: Text('November')),
                        ListTile(title: Text('December')),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(title: Text('January')),
                        ListTile(title: Text('February')),
                        ListTile(title: Text('March')),
                        ListTile(title: Text('April')),
                        ListTile(title: Text('May')),
                        ListTile(title: Text('June')),
                        ListTile(title: Text('July')),
                        ListTile(title: Text('August')),
                        ListTile(title: Text('September')),
                        ListTile(title: Text('October')),
                        ListTile(title: Text('November')),
                        ListTile(title: Text('December')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_enhance),
          label: '撮影',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video),
          label: '作成',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'レッスン',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'マイべ一ジ',
          backgroundColor: Colors.yellow,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}

class EnterNamePage extends StatefulWidget {
  final String name;

  const EnterNamePage({Key key, this.name}) : super(key: key);

  @override
  _EnterNamePageState createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  final nameEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameEditController.text = widget.name;
  }

  void onSubmit() async {
    final Dio dio = new Dio();
    try {
      var response =
          await dio.post(url, data: {"name": nameEditController.text});
      print(response);
      // if(response)
      Navigator.of(context).pushNamed('/');
    } on DioError catch (e) {
      throw e;
    }
  }

  final String url =
      'http://10.0.2.2:8080/api/udpateUserProfile/606e75b35bd58f09ec8453ce';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("氏名の編集"),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.clear, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0, top: 15.0),
              child: GestureDetector(
                onTap: () {
                  onSubmit();
                },
                child: Text(
                  '了完',
                  style: TextStyle(fontSize: 20.0),
                ),
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: '名氏'),
            controller: nameEditController,
          ),
          TextField(decoration: InputDecoration(labelText: 'カナ')),
        ],
      ),
    );
  }
}

class UserInfo {
  final String name;

  UserInfo({
    this.name,
  });

  static UserInfo fromJson(dynamic json) {
    return UserInfo(name: json["name"]);
  }

  Map<String, dynamic> toJson() => {'name': name};
}

class Response {
  final String success;
  final String message;
  final UserInfo data;

  Response({this.success, this.message, this.data});

  static Response fromJson(dynamic json) {
    return Response(
        success: json['success'],
        message: json['message'],
        data: UserInfo.fromJson('data'));
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.toJson(),
      };
}
