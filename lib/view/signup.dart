import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:app/view/completed_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String rePassword = '';
  String lastName = '';
  String firstName = '';
  String infoText = '';
  late DocumentReference _refDoc;
  late Future<Object?> _futureDoc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              //画面タイトル
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('アカウントの作成',
                    style: Theme.of(context).textTheme.headline5),
              ),
              //姓・名
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //姓
                  SizedBox(
                    width: 145,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: '姓', border: OutlineInputBorder()),
                      initialValue: firstName, //デバッグ用
                      onChanged: (String value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  //名
                  SizedBox(
                    width: 145,
                    child: TextFormField(
                      initialValue: lastName, //デバッグ用
                      decoration: const InputDecoration(
                          labelText: '名', border: OutlineInputBorder()),
                      onChanged: (String value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //メールアドレス
              SizedBox(
                width: 300,
                child: TextFormField(
                  initialValue: email, //デバッグ用
                  decoration: const InputDecoration(
                      labelText: 'メールアドレス', border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              //パスワード
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //パスワード
                  SizedBox(
                    width: 145,
                    child: TextFormField(
                      initialValue: password, //デバッグ用
                      decoration: const InputDecoration(
                          labelText: 'パスワード', border: OutlineInputBorder()),
                      obscureText: true,
                      onChanged: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  //確認
                  SizedBox(
                    width: 145,
                    child: TextFormField(
                      initialValue: password, //デバッグ用
                      decoration: const InputDecoration(
                          labelText: '確認', border: OutlineInputBorder()),
                      obscureText: true,
                      onChanged: (String value) {
                        setState(() {
                          rePassword = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //パスワード補足
              SizedBox(
                // メッセージ表示
                child: Text('半角英字、数字、記号を組み合わせて 8 文字以上で入力してください',
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              const SizedBox(height: 10),
              // アカウント登録
              ElevatedButton(
                onPressed: () async {
                  try {
                    //アカウント登録
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    //アカウント認証メール
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null && !user.emailVerified) {
                      await user.sendEmailVerification();
                    }
                    //データベース登録
                    _refDoc = FirebaseFirestore.instance
                        .collection('user')
                        .doc(userCredential.user!.uid);
                    _refDoc.set(<String, dynamic>{
                      'lastName': lastName,
                      'firstName': firstName,
                      'enable': true,
                    });
                    //仮登録完了画面遷移
                    if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompletedSignupPage(),
                          ));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      infoText = e.code;
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                    setState(() {
                      infoText = e.code;
                    });
                    Text('test');
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('アカウント登録'),
              ),
              //エラーメッセージ
              Container(
                padding: const EdgeInsets.all(8),
                child:
                    Text(infoText, style: const TextStyle(color: Colors.red)),
              ),
            ])));
  }
}
