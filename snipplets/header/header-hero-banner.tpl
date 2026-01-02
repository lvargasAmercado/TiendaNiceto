{% set hero_eyebrow = settings.head_informative_banner_01_link_text ?: 'Kiosco urbano' | translate %}
{% set hero_title = settings.head_informative_banner_01_title ?: 'Tu kiosco online' | translate %}
{% set hero_text = settings.head_informative_banner_02_title ?: 'Hacemos envíos rápidos y cuidamos cada pedido.' | translate %}
{% set hero_cta_url = settings.head_informative_banner_02_url ?: store.products_url %}
{% set hero_cta_label = settings.head_informative_banner_02_link_text ?: 'Ver productos' | translate %}

<div class="head-hero-banner" data-store="head-hero-banner">
    <span class="head-hero-glow" aria-hidden="true"></span>
    <span class="head-hero-eyebrow text-uppercase font-small">{{ hero_eyebrow }}</span>
    <h3 class="head-hero-title h5 m-0">{{ hero_title }}</h3>
    <p class="head-hero-text font-small mb-3">{{ hero_text }}</p>
    <div class="head-hero-chips">
        <span>{{ 'Envíos en el día' | translate }}</span>
        <span>{{ 'Pagá como quieras' | translate }}</span>
        <span>{{ 'Retiro en tienda' | translate }}</span>
    </div>
    <a href="{{ hero_cta_url | setting_url }}" class="btn btn-primary btn-small head-hero-cta">
        {{ hero_cta_label }}
    </a>
</div>
