# 環境構築手順
・Flutterのインストール
　・以下URLを開く
　　https://docs.flutter.dev/get-started/install/windows
　・Get the Flutter SDK
　　・「Download the following installation bundle to get the latest stable release of the Flutter SDK」
　　・ダウンロードしたzipフォルダをすべて展開
　　　※2022/05/28 時点でバージョンは「3.0.1」
　・Update your path
　　・From the Start search bar, enter ‘env’ and select Edit environment variables for your account.
　　・If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.
・Visual Studioのインストール
　・以下URLを開く
　　https://visualstudio.microsoft.com/ja/downloads/
　・コミュニティ版をダウンロード
　・セットアップファイルを開く
　・Desktop development with C++を選択してインストール
　　※flutter doctorコマンドによると、Windowsの開発に必要らしい
　・再起動
・Android Studio のインストール
　・以下URLを開く
　　https://developer.android.com/studio/install?hl=ja
　・「最初に、Android Studio の最新バージョンをダウンロードしてください。」のリンクをクリック
　・ダウンロードしたexeファイルを起動してインストール
　・Android Studioを起動
　・Dont sendを選択
　・Nextで進める
　・Licence Agreementで各ライセンスにAcceptを選択
　・Intel HAXMのインストールに失敗するので以下リンクから手動インストールする
　　https://github.com/intel/haxm/wiki/Installation-Instructions-on-Windows
　・
・flutter doctor コマンドで確認
　・ Visual Studioの確認で「Exception: Bad UTF-8 encoding」エラーが発生する問題
　　https://github.com/flutter/flutter/issues/102451
　・
・VS Codeの拡張機能をインストール
　・Flutter
　・Flutter Widget Shippets

# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
