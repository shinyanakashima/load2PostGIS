#!/bin/bash

# シェイプファイルとGeoJSONファイルのパスを環境変数から取得
SHAPEFILE_PATH="/data/${TARGET_NAME}.shp"
GEOJSON_PATH="/data/${TARGET_NAME}.geojson"

# シェイプファイルの存在チェック
if [ -f "$SHAPEFILE_PATH" ]; then
    echo "シェイプファイルが存在します: $SHAPEFILE_PATH"
    echo "インポート中: $SHAPEFILE_PATH"
    ogr2ogr -f "PostgreSQL" PG:"host=$PGHOST user=$PGUSER dbname=$PGDATABASE password=$PGPASSWORD port=$PGPORT" $SHAPEFILE_PATH -nln "${SCHEMA}.${TARGET_NAME}" -append
else
    echo "シェイプファイルは存在しません: $SHAPEFILE_PATH"
fi

# GeoJSONファイルの存在チェック
if [ -f "$GEOJSON_PATH" ]; then
    echo "GeoJSONファイルが存在します: $GEOJSON_PATH"
    echo "インポート中: $GEOJSON_PATH"
    ogr2ogr -f "PostgreSQL" PG:"host=$PGHOST user=$PGUSER dbname=$PGDATABASE password=$PGPASSWORD port=$PGPORT" $GEOJSON_PATH -nln "${SCHEMA}.${TARGET_NAME}" -append
else
    echo "GeoJSONファイルは存在しません: $GEOJSON_PATH"
fi

echo "処理完了"
