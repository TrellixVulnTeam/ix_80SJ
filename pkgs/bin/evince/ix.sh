{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://download.gnome.org/sources/evince/43/evince-43.0.tar.xz
sha:66be0de4b47b1130486103988cc152c04aea95950ba3ef16dc20c2ef6b681d47
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/gtk/3
lib/handy
lib/secret
lib/archive
lib/poppler
lib/rsvg/dl
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block run_data %}
aux/adwaita/icons
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/scripts/dlfcn
{% endblock %}

{% block meson_flags %}
gtk_doc=false
user_doc=false
nautilus=false
previewer=false
thumbnailer=false
introspection=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|+multipage||' \
    -e 's|ev_libdir, ev_backends_subdir|ev_datadir, ev_backends_subdir|' \
    -i meson.build
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

func=register_evince_backend

for x in pdf comics djvu tiff; do
    echo "${x}document ${func} ${func}_${x}"

    for l in obj/backend/${x}/lib${x}document.a.p/*.o; do
        llvm-objcopy --preserve-dates --redefine-sym "${func}=${func}_${x}" ${l}
    done
done | dl_stubs > stub.c

cc -o evince stub.c $(find -type f -name '*.o' | grep -v 'evinced.p' | grep -v 'test-')
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
cp ${tmp}/evince ${out}/bin/evince
{{hooks.wrap_xdg_binary('evince')}}
{% endblock %}
