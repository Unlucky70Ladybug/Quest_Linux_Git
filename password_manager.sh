#!/bin/bash
echo "パスワードマネージャーへようこそ！"

while $true; do

  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  if [ "$choice" == "Add Password" ]; then
    echo -n "サービス名を入力してください："
    read service_name

    echo -n "ユーザー名を入力してください："
    read user_name

    echo -n "パスワードを入力してください："
    read password

    # データをファイルに保存
    echo "$service_name:$user_name:$password" >> data.txt
    echo "パスワードの追加は成功しました。"

  elif [ "$choice" = "Get Password" ]; then
    
    echo -n "サービス名を入力してください："
    read service_name
    
    # サービス名を含んだ行を取得
    service_data=$(cat data.txt | awk -F '[:]' '{print $1}' | grep $service_name)

    if [ "$service_data" = "" ]; then
      # サービス名が登録していない場合
      echo "そのサービスは登録されていません。"
      
    else
      # サービス名が登録してある場合
      service_name=$(cat data.txt | grep $service_name | awk -F '[:]' '{print $1}')
      user_name=$(cat data.txt | grep $service_name | awk -F '[:]' '{print $2}')
      password=$(cat data.txt | grep $service_name | awk -F '[:]' '{print $3}')

      echo "サービス名：$service_name"
      echo "ユーザー名：$user_name"
      echo "パスワード：$password"
    fi
    
  elif [ "$choice" = "Exit" ]; then
    # 処理を終了する
    echo "Thank you!"
    break

  else
    # Add Password/Get Password/Exit 以外が入力された場合
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi

done