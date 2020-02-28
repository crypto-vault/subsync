# subsync
https://github.com/sc0ty/subsync (Docker version)

Share some movie/tv libraries to the docker when setup, for example:

/mnt/user/movies:/media/movies

Then you can call docker in your scripts as:

docker exec subsync /bin/bash -c "subsync --cli sync --ref '/media/movies/movie/movie.mkv' --sub '/media/movies/movie/movie.srt'  --out '/media/movies/movie/movie.out.srt'"
