FROM alpine
MAINTAINER Rui Zhang<rui.ustc@gmail.com>

ADD repositories /etc/apk/repositories

VOLUME ["/www"]

RUN apk add --no-cache libpng freetype libstdc++ python py-pip
RUN apk add --no-cache --virtual .build-deps \
	    gcc \
	    build-base \
	    python-dev \
	    libpng-dev \
	    musl-dev \
	    freetype-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h \
	&& pip install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy \
	&& pip install -i https://pypi.tuna.tsinghua.edu.cn/simple matplotlib \
	&& apk del .build-deps

