FROM alpine
MAINTAINER Rui Zhang<rui.ustc@gmail.com>

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
	&& pip install numpy \
	&& pip install matplotlib \
	&& apk del .build-deps

