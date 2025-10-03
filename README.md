# flutter_chatsample
Flutter サンプルプロジェクト chat

SDK：flutter_chat_ui
https://pub.dev/packages/flutter_chat_ui

の機能検証・検討用に作成したサンプルプロジェクトのため未完部分あります。

主要機能
・ログイン
・ルーム別チャット管理
・メッセージコピー・ペースト

developブランチを参照してください。

リポジトリ取得後、ビルドエラーが出て実行できない場合は以下を試してください

chantsample/iosフォルダ以下で下の2つのコマンドを順次実行してCocoapodファイルを更新
~~~
pod cache clean --all
~~~
~~~
pod update  
~~~
