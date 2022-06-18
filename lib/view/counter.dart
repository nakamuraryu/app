import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int _counter;
  late DocumentReference _refDoc;
  late Future<Object?> _futureDoc;

// SnackBarを定義
  final snackBar = const SnackBar(
    content: Text('Hello!'),
  );

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String docId = auth.currentUser!.uid;
    const String collectionId = 'app';
    _counter = 0;
    _refDoc = FirebaseFirestore.instance.collection(collectionId).doc(docId);
    _futureDoc = _refDoc.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        _counter = documentSnapshot.get('num');
      }else{
        _counter = 0;
      }});
    // _futureDoc = _refDoc.get().then((value) => value['num'].exists?_counter = value['num']:_counter = 0);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final FirebaseAuth auth = FirebaseAuth.instance;
              final User? user = auth.currentUser;
              if (user == null) {
                print('ログインされていません');
              } else {
                await FirebaseAuth.instance.signOut();
                print('ログアウトしました');
              }
              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ));
            },
          )
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              FutureBuilder(
                  future: _futureDoc,
                  builder: (context, snapshot) {
                    // 取得が完了していないときに表示するWidget
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }

                    // エラー時に表示するWidget
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('エラー');
                    }
                    //カウント数表示
                    return Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }),
              const SizedBox(height: 8),
              //保存作成ボタン
              ElevatedButton(
                onPressed: () {
                  _refDoc.set(<String, int>{'num': _counter});
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('保存しました!'),
                  ));
                },
                child: const Text('保存'),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            heroTag: 'hero1',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            heroTag: 'hero2',
            child: const Icon(Icons.remove),
          )
        ]));
  }
}
