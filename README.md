# To build

```
docker build -t isrm2023 .
```


# To run

```
docker run -it --net="host" -p 8888:8888 --rm isrm2023:latest /bin/bash
```

# To run with local volume mount

```
mkdir work
docker run -v $(pwd)/work:/home/student/work -it --net="host" -p 8888:8888 --rm isrm2023:latest /bin/bash
```

Inside container copy all your stuff to /home/student/work
