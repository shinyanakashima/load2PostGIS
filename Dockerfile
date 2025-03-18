# ベースイメージとしてGDALのalpine-small-latestを使用
FROM ghcr.io/osgeo/gdal:alpine-small-latest

# スクリプトをコンテナにコピー
COPY ./app/load_geom.sh /app/load_geom.sh

# スクリプトに実行権限を与える
RUN chmod +x /app/load_geom.sh

# コンテナ起動時にスクリプトを実行
ENTRYPOINT ["/app/load_geom.sh"]
