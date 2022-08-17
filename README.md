# Database Backup Action

Backup Heroku database to Filebase

### Getting Started

1. Create a new workflow file `.github/workflows/<ACTION_NAME>.yml`
2. Add the following with a custom schedule (listed one is each 30 minutes):

```yaml
name: Database Backup Action

on:
  workflow_dispatch:
  schedule:
    - cron: "*/30 * * * *"

jobs:
  database-backup:
    name: Database Backup
    runs-on: ubuntu-latest
    environment: <GITHUB_ENVIRONMENT_NAME>
    steps:
      - uses: blazing-edge-labs/db-backup-action@master
        name: Database Backup
        with:
          HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY  }}
          HEROKU_APP_NAME: ${{ secrets.HEROKU_APP_NAME  }}
          FILEBASE_ACCESS_KEY_ID: ${{ secrets.FILEBASE_ACCESS_KEY_ID  }}
          FILEBASE_SECRET_ACCESS_KEY: ${{ secrets.FILEBASE_SECRET_ACCESS_KEY  }}
          FILEBASE_BUCKET_NAME: ${{ secrets.FILEBASE_BUCKET_NAME  }}
          FILEBASE_FOLDER_NAME: ${{ secrets.FILEBASE_FOLDER_NAME }}
          FILEBASE_FILE_NAME: ${{ secrets.FILEBASE_FILE_NAME }}
```

3. Create the following secrets in your repo's settings within an Github environment with the same name as the one used in the yaml file above:

```
    HEROKU_API_KEY
    HEROKU_APP_NAME
    FILEBASE_ACCESS_KEY_ID
    FILEBASE_SECRET_ACCESS_KEY
    FILEBASE_BUCKET_NAME
    FILEBASE_FOLDER_NAME
    FILEBASE_FILE_NAME
```


> Note: This code creates a backup and then downloads it for the specified Heroku APPs default database.
