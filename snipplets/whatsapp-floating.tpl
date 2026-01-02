{% if store.whatsapp %}
    <a class="floating-whatsapp" href="{{ store.whatsapp }}" target="_blank" rel="noopener" data-store="floating-whatsapp">
        <span class="floating-whatsapp-ripple" aria-hidden="true"></span>
        {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "floating-whatsapp-icon"} %}
        <span class="floating-whatsapp-label font-small">
            {{ 'Escribinos' | translate }}
        </span>
    </a>
{% endif %}
