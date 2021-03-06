## image use

```
docker run --rm --device /dev/fuse --cap-add SYS_ADMIN -e BUCKET={{BUCKET NAME}} -v {{KEY FILE}}:/root/google.json  --name googlecloudstorage -itd hashito/googlecloudstorage 
```

or

```
docker run --rm  --device /dev/fuse --privileged -e BUCKET={{BUCKET NAME}} -v {{KEY FILE}}:/root/google.json --name googlecloudstorage -itd hashito/googlecloudstorage 
```

google reference...
https://cloud.google.com/storage/docs/gcs-fuse


## build

1. Create a Cloud Storage bucket on Google Cloud Platform
2. Create a service account with IAM and management of Google Cloud Platform, give Cloud Storage management permission and create a key file
3. Copy the key file to google.json in this folder
4. Build with the following command

```
docker build -t googlecloudstorage .
```

5. Start with the command below

```
docker run --rm --device /dev/fuse --cap-add SYS_ADMIN -e BUCKET={{BUCKET NAME}} --name googlecloudstorage -itd googlecloudstorage 
```

or

```
docker run --rm  --device /dev/fuse --privileged -e BUCKET={{BUCKET NAME}} --name googlecloudstorage -itd googlecloudstorage 
```

## check 

```
docker exec -it googlecloudstorage /bin/bash
cd /root/gcs
echo "hi">test.txt
```

Test.txt is created in Cloud Storage
*The inside of /root/gcs will be mounted by Cloud Storage.
