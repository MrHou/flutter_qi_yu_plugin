import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qy_plugin/flutter_qiyu.dart';

// import 'flutter_qiyu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  QiYu.registerApp(
    appKey: '595445914922b38dd5c313ab2011be39',
    appName: '波尔世界',
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _platform = const MethodChannel('toFlutterChannelName');

  @override
  void initState() {
    super.initState();
    _platform.setMethodCallHandler(flutterMethod);
  }

  Future<dynamic> flutterMethod(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'fluMethod':
        print('原生Android调用了flutterMethod方法！！！');
        print('原生Android传递给flutter的参数是：：' + methodCall.arguments);
        startQiYu();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextButton(
                child: Text('联系客服'),
                onPressed: () {
                  startQiYu();
                },
              ),
              TextButton(
                child: Text('版本'),
                onPressed: () {
                  QiYu.getVersion()
                      .then((value) => {print("version = " + value)});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void startQiYu() {
    QYUserInfoParams userInfoParams = QYUserInfoParams.fromJson({
      'userId': 'uid10101010',
      'data':
          '[{\"key\":\"real_name\", \"value\":\"土豪\"},{\"key\":\"mobile_phone\", \"hidden\":true},{\"key\":\"email\", \"value\":\"13800000000@163.com\"},{\"index\":0, \"key\":\"account\", \"label\":\"账号\", \"value\":\"zhangsan\", \"href\":\"http://example.domain/user/zhangsan\"},{\"index\":1, \"key\":\"sex\", \"label\":\"性别\", \"value\":\"先生\"},{\"index\":5, \"key\":\"reg_date\", \"label\":\"注册日期\", \"value\":\"2015-11-16\"},{\"index\":6, \"key\":\"last_login\", \"label\":\"上次登录时间\", \"value\":\"2015-12-22 15:38:54\"}]'
    });
    QiYu.setUserInfo(userInfoParams);

    QYServiceWindowParams serviceWindowParams = QYServiceWindowParams.fromJson({
      'source': {
        'sourceTitle': '网易七鱼Flutter',
        'sourceUrl': 'http://www.qiyukf.com',
        'sourceCustomInfo': '我是来自自定义的信息'
      },
      'commodityInfo': {
        'commodityInfoTitle': 'Flutter商品',
        'commodityInfoDesc': '这是来自网易七鱼Flutter的商品描述',
        'pictureUrl': 'http://qiyukf.com/res/img/companyLogo/blmn.png',
        'commodityInfoUrl': 'http://www.qiyukf.com',
        'note': '￥1000',
        'show': true,
        'sendByUser': true,
        'alwaysSend': true
      },
      'sessionTitle': '网易七鱼123',
      'groupId': 0,
      'staffId': 0,
      'robotId': 0,
      'robotFirst': false,
      'faqTemplateId': 0,
      'vipLevel': 0,
      'showQuitQueue': true,
      'showCloseSessionEntry': true
    });
    QiYu.openServiceWindow(serviceWindowParams);
  }
}
