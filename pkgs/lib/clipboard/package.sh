{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://github.com/jtanx/libclipboard/archive/refs/tags/v1.1.tar.gz
# md5 bddc22070b6804ed63994af49b778b70
{% endblock %}

{% block deps %}
# {{'lib sys/framework/AppKit' | darwin}}
# bld dev/build/cmake dev/build/pkg-config env/std
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lclipboard \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
{% endblock %}
