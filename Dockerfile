# ベースイメージとしてGDALのalpine-small-latestを使用
FROM ghcr.io/osgeo/gdal:alpine-small-latest

# 必要なツールをインストール
RUN apk add --no-cache bash wget

COPY ./app/load_geom.sh /app/load_geom.sh

# スクリプトに実行権限を与える
RUN chmod +x /app/load_geom.sh

# コンテナが起動した時に実行するエントリーポイントを指定
ENTRYPOINT ["/bin/bash", "/app/load_geom.sh"]
