{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/mad/libmad-0.15.1b.tar.gz
1be543bc30c56fb6bea1d7bf6a64e66c
{% endblock %}

{% block bld_tool %}
#bin/auto/conf/2/69
#bin/auto/make/1/16
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
