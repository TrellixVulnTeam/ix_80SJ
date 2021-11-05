{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.xz
a4fb91a9441bcaec576d4c4a56fa3aa6
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block coflags %}
--without-examples
{% endblock %}

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} \${COFLAGS}"
export CMFLAGS="-DCMAKE_USE_SYSTEM_EXPAT=ON \${CMFLAGS}"
{% endblock %}
