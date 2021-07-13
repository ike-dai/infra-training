# シェルの概要 パート

## 事前実行

- 以下の作業は全て/training/shellscript配下にて実施します。対象フォルダに移動します。

```bash
cd /training/shellscript
```

## 講義資料p.7

- 以下のコマンドを実行してみましょう。

```bash
echo "Hello World"
```

## 講義資料p.13

- manコマンドでechoコマンドの仕様を確認してみましょう。

```bash
man echo
```

## 講義資料p.15

- どのユーザでログインしているかを確認してみましょう。

```bash
whoami
```

- /etc/passwdファイルを確認して、上記ユーザのログインシェルの種別を確認しましょう。

```bash
cat /etc/passwd
```

- 以下コマンドを実行して実際にどのシェル上にいるかを確認しましょう。

```bash
echo $SHELL
```

## 講義資料p.18

- ホームディレクトリ直下の.bashrcファイルの中身を見てみましょう。
    - ※講義資料中に記載の.bash_profileは確認環境上には存在しないので注意

```bash
cat ~/.bashrc
```

# シェルスクリプトの基本 パート

## 講義資料p.26

- helpコマンドを実行して組み込みコマンドにどのようなものがあるかを見てみましょう。

```bash
help
```

## 講義資料p.27

- coreutilsに含まれるコマンドにどのようなものがあるかを見てみましょう。

```bash
rpm -ql coreutils | grep bin
```

## 講義資料p.28

- /training/shellscriptフォルダ直下に配置されているsample.shを実行してみましょう。
    - 実行方法1 bashの引数として実行
    ```bash
    bash sample.sh
    ```
    - 実行方法2 直接実行
    ```bash
    ./sample.sh
    ```
    - 実行方法3 commandコマンドで実行
    ```bash
    command ./sample.sh
    ```

## 講義資料p.31

- /training/shellscript/sample.shの実行権限を確認してみましょう。

```bash
ls -l sample.sh
```

- x権限をつけてみましょう。

```bash
chmod a+x sample.sh
```

- 再度実行してみましょう。
    - 実行方法1 bashの引数として実行
    ```bash
    bash sample.sh
    ```
    - 実行方法2 直接実行
    ```bash
    ./sample.sh
    ```
    - 実行方法3 commandコマンドで実行
    ```bash
    command ./sample.sh
    ```


## 講義資料p.42

- シェル変数を定義してみましょう。

```bash
VAR1="test"
```

- スクリプトの中でシェル変数をechoした結果を見てみましょう。

```bash
cat ./var_echo.sh
```

```bash
bash ./var_echo.sh
```

- VAR1シェル変数を環境変数化してみましょう。

```bash
export VAR1
```

```bash
bash ./var_echo.sh
```

## 講義資料p.48

- コマンドの結果をgrepでフィルタしてみましょう。

```bash
ls -l /training/shellscript
```

```bash
ls -l /training/shellscript | grep sample
```

## 講義資料p.49

- dateコマンドの結果を変数に格納してみましょう。

```bash
VAR=$(date)
```

- 変数に格納された結果を確認してみましょう。

```bash
echo $VAR
```

## 講義資料p.50

- dateコマンドの結果をファイルに書き出してみましょう。

```bash
date > output.log
```

```bash
cat output.log
```

- 再度書き込みましょう。

```bash
date > output.log
```

```bash
cat output.log
```

- 追記型で再度書き込みましょう。

```bash
date >> output.log
```

```bash
cat output.log
```

## 講義資料p.52

- 標準出力・標準エラー出力されるスクリプトを実行してみましょう。

```bash
bash ./stdout_stderr.sh
```

- 標準エラー出力をerror.logに出力してみましょう。

```bash
bash ./stdout_stderr.sh 2> error.log
```

```bash
cat error.log
```

- 標準出力と標準エラー出力両方をoutput.logに出力してみましょう。

```bash
bash ./stdout_stderr.sh > output.log 2>&1
```

```bash
cat output.log
```

概要編の講義部分は以上で終了です。お疲れさまでした。

---

[実践編のページへ](practice.md)

