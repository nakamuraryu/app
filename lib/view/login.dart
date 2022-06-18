import 'package:app/view/counter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  // メッセージ表示用
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //エラーメッセージ
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(infoText, style: const TextStyle(color: Colors.red)),
            ),
            //画面タイトル
              Container(
                padding: const EdgeInsets.all(30),
                child: Text('Appにログイン',
                    style: Theme.of(context).textTheme.headline5),
              ),
            //メールアドレス入力
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス', border: OutlineInputBorder()),
                initialValue: email,
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // パスワード入力
            SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'パスワード', border: OutlineInputBorder()),
                  initialValue: password,
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                )),
            const SizedBox(height: 20),
            // ログイン登録ボタン
            SizedBox(
              width: 100,
              child: OutlinedButton(
                child: const Text('ログイン'),
                onPressed: () async {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final User? user = auth.currentUser;
                  if (user == null) {
                    try {
                      //サインイン
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: password);
                      print('ログインしました');
                      //認証確認
                      User? user = FirebaseAuth.instance.currentUser;
                      print('emailVerified:${!user!.emailVerified}');
                      if (user != null && !user.emailVerified) {
                        print('debug');
                        setState(() {
                          infoText = 'No user found for that email.';
                        });
                        throw Exception('Email is not verified') ; 
                      }
                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CounterPage(title: 'Counter'),
                          ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        setState(() {
                          infoText = 'No user found for that email.';
                        });
                      } else if (e.code == 'wrong-password') {
                        setState(() {
                          infoText = 'Wrong password provided for that user.';
                        });
                      } else {
                        setState(() {
                          infoText = e.code;
                        });
                      }
                    }catch (e) {
                    setState(() {
                          infoText = e.toString();
                        });
                    }
                  } else {
                    print('ログイン済です');
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            //アカウント作成ボタン
            ElevatedButton(
              onPressed: () => {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const sub2.RegisterApp();
                //   },
                // ))
                Navigator.pushNamed(context, '/signup')
              },
              child: const Text('新規アカウント作成'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
