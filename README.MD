```bash
mkdir gaussian_splatting
cd gaussian_splatting
wget https://raw.githubusercontent.com/stasyanich/3dgs/master/Dockerfile
docker build -t mosstnslv/colmap-transfer:1.0.1 .
docker push mosstnslv/colmap-transfer:1.0.1

```
variable `ENV_FRAME_TO_SEC` is ffmpeg frame rate
variable `FILE_NAME` is name output zip file

```bash
docker run -tid --gpus all \
--name video_colmap_converter -v /home/stanislav/work:/workspace colmap-transfer:1.0.1 \
bash
```

```bash
docker exec -it -e "ENV_FRAME_TO_SEC=2" -e "FILE_NAME=parking" video_colmap_converter bash -c ". /script.sh"
```

# OR

```bash
docker run -tid --gpus all -v /home/stanislav/work:/workspace colmap-transfer:1.0.1 bash
```

```bash
docker exec -it -e "ENV_FRAME_TO_SEC=2" -e "FILE_NAME=parking" {conteiner_id} bash -c ". /script.sh"
```


```structure
!---workspace
   |---video (required)
       |---<video 0>
       |---<video 1>
       |---...
```