# build

1. Google Cloud Platform でCloud Storageのバケットを作成
2. Google Cloud Platform の IAMと管理でサービスアカウントを作成、Cloud Storageの管理権限を付与し キーファイルを作成
3. キーファイルを本フォルダ内のgoogle.json内にコピーする
4. 下記のコマンドでbuild

    docker build -t googlestorage .

5. 下記のコマンドで起動

    docker run --rm --device /dev/Fuse --cap-add SYS_ADMIN -e BUCKET={{バケット名}} --name googlestorage -itd googlestorage 

or

    docker run --rm  --device /dev/Fuse --privileged -e BUCKET={{バケット名}} --name googlestorage -itd googlestorage 


check 

    docker exec -it googlestorage /bin/bash
    cd /root/gcs
    echo "hi">test.txt

Cloud Storage内にtest.txtが作成されます

※/root/gcs 内がCloud Storageでマウントされます。


