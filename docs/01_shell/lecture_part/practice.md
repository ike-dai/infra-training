# 実践編パート

## 事前実行

- 以下の作業は全て/training/shellscript配下にて実施します。対象フォルダに移動します。

```bash
cd /training/shellscript
```

## 講義資料p.60

- func1が定義されたfunc1.shを実行し結果を出力してみましょう。

```bash
./func1.sh
```


## 講義資料p.65

- 配列を定義してみましょう。

```bash
sample=("a" "b" "c")
```

- 配列の要素の個数を参照してみましょう。

```bash
echo ${#sample[@]}
```

- 配列の要素の中身全てを出力してみましょう。

```bash
echo ${sample[@]}
```

## 講義資料p.69

- sedコマンドを試してみましょう。

```bash
cat ./original.txt
```

```bash
sed -e "s/Hello/GoodBy/g" ./original.txt > converted.txt
```

```bash
cat converted.txt
```


- awkコマンドを試してみましょう。

```bash
echo "192.168.1.25" | awk -F '.' '{printf "%s.%s\n", $1, $2}'
```

## 講義資料p.70

- seqコマンドを試してみましょう。

```bash
seq 1 2 10
```

- sortコマンドを試してみましょう。

```bash
echo -e "ccc\nbbb\naaa"
```

```bash
echo -e "ccc\nbbb\naaa" | sort
```

## 講義資料p.71

- dateコマンドで1週間前の日付を出力してみましょう。
    - TZ環境変数でタイムゾーンを指定して実行する例

```bash
TZ=Asia/Tokyo date +"%Y-%m-%d %H:%M:%S" --date "1 week ago"
```

- findコマンドでtutorialフォルダ以下の.txtのファイルのみを検索してみましょう。

```bash
find ./tutorial -name "*.txt"
```

## 講義資料p.72

- grepコマンドで/training/shellscriptフォルダ配下のファイルの内、txtというキーワードを含まないものを出力してみましょう。


```bash
ls -l /training/shellscript | grep -v txt
```

- curlコマンドでexample.comのトップページhtmlを出力してみましょう。

```bash
curl -XGET http://example.com
```

## 講義資料p.74

- cronの定義を確認してみましょう。(現在ログインしているユーザ(root)のcron定義)

```bash
crontab -l
```

```bash
cat /var/spool/cron/crontabs/root
```

- cronの共通の定義を確認してみましょう。

```bash
cat /etc/crontab
```

## 講義資料p.77

- var_echo.shを各種フラグをつけて実行してみましょう。

```bash
bash -u ./var_echo.sh
```

```bash
bash -v ./var_echo.sh
```

```bash
bash -x ./var_echo.sh
```


実践編の講義部分は以上で終了です。お疲れさまでした。


