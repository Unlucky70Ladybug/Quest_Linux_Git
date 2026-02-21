#!/bin/bash
echo "パスワードマネージャーへようこそ！"

echo -n "サービス名を入力してください："
read service_name

echo -n "ユーザー名を入力してください："
read user_name

echo -n "パスワードを入力してください："
read password

# データをファイルに保存
echo "${service_name}:${user_name}:${password}" >> data.txt

# 入力が完了
echo "Thank you!"