{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/13/ver.sh' %}
{% endblock %}

{% block lib_deps %}
bld/boot/7/lib/cxx/rt
{% endblock %}

{% block bld_libs %}
{% if linux %}
bld/boot/7/lib/linux
{% endif %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}

{% block cpp_defines %}
_LIBCPP_BUILDING_LIBRARY=1
_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER=1
LIBCXXRT=1
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export CPPFLAGS="-iquote src -Iinclude -std=c++14 ${CPPFLAGS}"
{% endblock %}

{% block unpack %}
{{super()}}
cd libcxx
{% endblock %}

{% block patch %}
cat << EOF > include/__config_site
#pragma once

#define _LIBCPP_HAS_MERGED_TYPEINFO_NAMES_DEFAULT 0
#define _LIBCPP_HAS_NO_INT128 1
#define _LIBCPP_DISABLE_AVAILABILITY 1
{% if linux %}
#define _LIBCPP_HAS_MUSL_LIBC 1
{% endif %}
EOF
{% endblock %}

{% block build %}
for s in src/*.cpp src/filesystem/*.cpp; do
    out=$(echo ${s} | tr '/' '_' | tr -d '\n').o
    c++ -c ${s} -o ${out}
done

ar qs libc++.a *.o
{% endblock %}

{% block install %}
cp -R include ${out}
mkdir ${out}/lib && cp libc++.a ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="-lpthread -ldl \${LDFLAGS}"
{% endblock %}
