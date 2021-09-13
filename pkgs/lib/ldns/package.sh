{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz
# md5 166262a46995d9972aba417fd091acd5
{% endblock %}

{% block deps %}
# lib lib/openssl
# bld dev/build/make env/std
{% endblock %}

{% block coflags %}
--with-ssl=$lib_openssl
--with-drill
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lldns \${LDFLAGS}"
export COFLAGS="--with-ldns=${out} \${COFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}
