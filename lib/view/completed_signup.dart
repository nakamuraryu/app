import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompletedSignupPage extends StatefulWidget {
  const CompletedSignupPage({Key? key})
      : super(key: key);
  @override
  State<CompletedSignupPage> createState() => _CompletedRegisttionState();
}

//仮登録完了画面
class _CompletedRegisttionState extends State<CompletedSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              //画面タイトル
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('あともう少しで登録完了です！',
                    style: Theme.of(context).textTheme.headline5),
              ),
              const SizedBox(
                  width: 300, child: Text('メール内のリンクを開きアカウントを有効化してください')),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: OutlinedButton(
                  child: const Text('ログイン画面に戻る'),
                  onPressed: () async {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User? user = auth.currentUser;
                    FirebaseFirestore.instance;
                    if (user != null) {
                      await FirebaseAuth.instance.signOut();
                    }
                    if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ));
                  },
                ),
              ),
            ])));
  }
}
