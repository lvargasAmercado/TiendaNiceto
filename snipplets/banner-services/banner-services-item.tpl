<div class="swiper-slide banner-service-slide{% if loop.last %} mr-md-0{% endif %}">
    {% set banner_service_inner %}
        <div class="banner-service-item">
            <div class="banner-service-icon">
                {% if banner_services_icon == 'image' and banner_services_image %}
                    <img class="service-item-image lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{banner}.jpg" | static_url | settings_image_url("large") }}' {% if banner_services_title %}alt="{{ banner_services_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                {% elseif banner_services_icon == 'shipping' %}
                    {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'card' %}
                    {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'security' %}
                    {% include "snipplets/svg/security.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'returns' %}
                    {% include "snipplets/svg/returns.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'whatsapp' %}
                    {% include "snipplets/svg/whatsapp-line.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'promotions' %}
                    {% include "snipplets/svg/promotions.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% elseif banner_services_icon == 'cash' %}
                    {% include "snipplets/svg/cash.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
                {% endif %}
            </div>
            {% if banner_services_title or banner_services_description %}
                <div class="banner-service-content">
                    {% if banner_services_title %}
                        <p class="banner-service-title h5 m-0">{{ banner_services_title }}</p>
                    {% endif %}
                    {% if banner_services_description %}
                        <p class="banner-service-description m-0 font-small">{{ banner_services_description }}</p>
                    {% endif %}
                </div>
            {% endif %}
        </div>
    {% endset %}

    {% if banner_services_url %}
        <a class="banner-service-link" href="{{ banner_services_url | setting_url }}">
            {{ banner_service_inner }}
        </a>
    {% else %}
        {{ banner_service_inner }}
    {% endif %}
</div>
