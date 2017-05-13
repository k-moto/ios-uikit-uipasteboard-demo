# UIPasteBoard
## 概要
UIPasteBoardは、文字列や画像などをコピー＆ペーストするクラスです。<br>例）クリップボードにコピー&ペーストするなど

## 関連クラス
NSObject

## 主要メソッド

| メソッド名 | 説明 | サンプル |
|:-----------:|:------------:|:------------|
| setValue | 文字列または画像をペーストボードにコピーする | pasteboard?.setValue(text, forPasteboardType: PasteBoardKey.text) |
| value | 文字列または画像をペーストボードにペーストする | let text = pasteboard?.value(forPasteboardType: PasteBoardKey.text) as! String |
| init?(name: UIPasteboardName, create: Bool) | ペーストボードを作成する<br>name = ペーストボード名<br>create =<br>systemのペーストボードか<br>既存のペーストボードを使う場合falseにする<br>新規に作成する場合trueにする | let pasteboard =<br> UIPasteboard(name: UIPasteboardName(rawValue: boardID), create: true) |


## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------:|:------------:|:------------|
| changeCount | ペーストボードが変更された回数を取得する<br>ペーストボードごとにカウントされる | pasteboard?.changeCount |

## 通知

| 通知名 | 説明 |
|:-----------:|:------------:|
| UIPasteboardChanged | ペーストボードが変更されたタイミングで呼び出される |


## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uipasteboard
