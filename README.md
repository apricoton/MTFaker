# MTFaker
吾輩は猫であるを指定した数だけエントリーとして保存する Movable Typeプラグイン

## 使い方
```bash
tools/faker --blog_id=N --name=AuthorName --num=N --perday=N
```

### オプション
* blog_id
    * 対象のブログIDを指定します
* name
    * 投稿ユーザ名を指定します
* num
    * 投稿するエントリー数を指定します
* perday
    * 1日に登録する件数を指定します

### Ex) ブログID 1のブログに hoge ユーザで 10000件のエントリーを 1日に10件ずつ入れる場合
```bash
tools/faker --blog_id=1 --name=hoge --num=10000 --perday=10
```

## 今後の計画
* 画像も入れられるようにする
* カテゴリーを指定できるようにする