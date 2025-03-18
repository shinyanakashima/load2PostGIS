# 概要
Shapefile, GeoJSONをPostGISにロードする。

# How to use
mkdir data;
.envを編集すれば、Neon上のPostGISにロードする。

## データロード
Shapefile, GeoJSONをdataフォルダに置く

- データ元: `D:\Develop\Geospatial\GeoData\OpenData\法務省_登記所備付地図`

podman run -it --rm --name ogr2ogr-container osgeo/gdal:latest
podman run -it --rm --network host ghcr.io/osgeo/gdal:alpine-small-latest

### FYI
- スキーマは事前に作成しておくこと。年度が変わったタイミングなど
