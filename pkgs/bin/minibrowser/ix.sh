{% extends '//bin/webkitproc/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_MINIBROWSER=ON
{% endblock %}
