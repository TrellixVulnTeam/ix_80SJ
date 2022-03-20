{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz
sha:bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/jpeg
lib/tiff
lib/sdl/2
{% endblock %}
