{% extends '//util/make.sh' %}

{% block fetch %}
# url https://www.openssl.org/source/old/1.1.1/openssl-1.1.1j.tar.gz
# md5 cccaa064ed860a2b4d1303811bf5c682
{% endblock %}

{% block deps %}
# bld {{'lib/linux' | linux}}
# bld dev/build/make dev/lang/perl5 env/std
{% endblock %}

{% block cflags %}
export AR=ar
export RANLIB=ranlib
{% endblock %}

{% block configure %}
PLATFORM_darwin_arm64="darwin64-arm64-cc"
PLATFORM_darwin_x86_64="darwin64-x86_64-cc"
PLATFORM_linux_x86_64="linux-x86_64-clang"

PLATFORM=$PLATFORM_{{mix.platform.target.os}}_{{mix.platform.target.arch}}

perl ./Configure \
    $PLATFORM \
    no-asm \
    threads \
    no-shared \
    no-dso \
    no-hw \
    no-tests \
    --prefix="${out}" \
    --openssldir="${out}"
{% endblock %}

{% block env %}
export COFLAGS="--with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=$out \${COFLAGS}"
export OPENSSL_INCLUDES="-I${out}/include"
export OPENSSL_LIBS="-L${out}/lib -lssl -lcrypto"
export OPENSSL_DIR="${out}"
export CPPFLAGS="\$OPENSSL_INCLUDES \${CPPFLAGS}"
export LDFLAGS="\$OPENSSL_LIBS \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DOPENSSL_ROOT_DIR=${out} -DOPENSSL_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}
