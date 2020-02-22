# subsync
https://github.com/sc0ty/subsync (Docker version)

Share some movie/tv libraries to the docker when setup, for example:

/mnt/user/movies:/media/movies
/mnt/user/tv:/media/tv

Then you can call docker in your scripts as:

docker exec subsync /bin/bash -c "subsync --cli sync --ref '/media/movies/movie/movie.mkv' --sub '/media/movies/movie/movie.srt.original'  --out '/media/movies/movie/movie.srt'"

Copy/rename original srt file to original before running script to have a backup:

cp '/media/movies/movie/movie.srt' '/media/movies/movie/movie.srt.original'
