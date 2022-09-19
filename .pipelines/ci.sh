#!/bin/sh
project="4se-website"

container=${project}
image=${project}

if docker ps | grep ${container} ;then
	echo "-------------正在暂停容器-------------"
    docker stop ${container}
    docker rm ${container}
fi

if docker images | grep ${image}; then
	echo "-------------正在删除旧镜像-------------"
    docker rmi ${image}
fi

echo "-------------开始制作镜像-------------"
docker build -t ${image} .

echo "-------------开始运行新容器-----------"
docker run -d --restart always --name ${container} -p 7000:80 ${image}
echo "-------------运行新容器成功-----------"

echo "-----------清理未被使用的镜像-----------"
docker image prune -a -f

echo "部署成功！！！"