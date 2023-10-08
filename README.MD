```bash
mkdir gaussian_splatting
cd gaussian_splatting
wget https://raw.githubusercontent.com/stasyanich/3dgs/master/Dockerfile
docker build -t mosstnslv/colmap-transfer:1.0.1 .
docker push mosstnslv/colmap-transfer:1.0.1
```

# Arguments for start colmap

- variable `ENV_FRAME_TO_SEC` is ffmpeg frame rate

```bash
docker run -tid --gpus all \
--name video_colmap_converter -v /home/stanislav/work:/workspace mosstnslv/colmap-transfer:1.0.1 \
bash
```

```bash
docker exec -it -e "ENV_FRAME_TO_SEC=2" video_colmap_converter bash -c ". /script.sh"
```
## OR

```bash
CONTAINER_ID=`docker run -tid --gpus all -v /home/stanislav/work:/workspace mosstnslv/colmap-transfer:1.0.3 bash`
```

```bash
docker exec -it -e "ENV_FRAME_TO_SEC=2" "${CONTAINER_ID}" bash -c ". /script.sh"
```
## OR

run background and then remove
```bash
docker run -itd --gpus all -rm -e "ENV_FRAME_TO_SEC=1" -v /home/stanislav/work:/workspace mosstnslv/colmap-transfer:1.0.3 bash -c ". /script.sh"
```
## OR

run in console with and then remove
```bash
docker run -it --gpus all --rm -e "ENV_FRAME_TO_SEC=1" -v /home/stanislav/work:/workspace mosstnslv/colmap-transfer:1.0.3 bash -c ". /script.sh"
```


```structure
!---workspace
   |---video (required)
       |---<video 0>
       |---<video 1>
       |---...
```