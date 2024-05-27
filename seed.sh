#!/bin/bash
set -e

if [ -z "$MONGODB_URI" ]; then
  echo "Error: MONGODB_URI environment variable is not set."
  exit 1
fi

if [ -z "$DB_NAMES" ]; then
  echo "Error: DB_NAMES environment variable is not set."
  exit 1
fi

# Wait for a few seconds to ensure that MongoDB server is up and running before trying to import data
echo "Waiting for MongoDB to be ready..."
sleep 10

dataDir="/mongo-seeder/db"
files=$(ls $dataDir)

for db in $(echo $DB_NAMES | tr "," "\n"); do
  echo "Importing data into database: $db"
  for file in $files; do
    collection=$(basename "$file" .json)
    echo "Importing $file into collection $collection in database $db"
    mongoimport --uri "$MONGODB_URI" --db "$db" --collection $collection --file "$dataDir/$file" --jsonArray --writeConcern="{w:0}"
    echo "Imported $file into collection $collection in database $db"
  done
done

echo "Data import completed successfully."
