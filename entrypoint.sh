TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`

heroku pg:backups:download --app $HEROKU_APP_NAME

aws configure set aws_access_key_id $FILEBASE_ACCESS_KEY_ID 
aws configure set aws_secret_access_key $FILEBASE_SECRET_ACCESS_KEY
aws --endpoint https://s3.filebase.com s3 cp latest.dump s3://$FILEBASE_BUCKET_NAME/$FILEBASE_FOLDER_NAME/$FILEBASE_FILE_NAME-$TIMESTAMP.dump
