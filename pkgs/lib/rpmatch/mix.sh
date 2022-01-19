{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/pullmoll/musl-rpmatch/archive/refs/tags/v1.0.tar.gz
8f5a5022fa66d94b7b0934618dfa6350
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
