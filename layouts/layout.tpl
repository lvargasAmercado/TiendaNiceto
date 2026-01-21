<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
        <link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400,700') }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/lucide@latest"></script>
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />

        {# Preload LCP home, category and product page elements #}

        {% snipplet 'preload-images.tpl' %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        <style>
            {# Font families #}

            {{ component(
                'fonts',{
                    font_weights: '400,700',
                    font_settings: 'settings.font_headings, settings.font_rest'
                })
            }}

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}
        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>
        <style>
            :root {
                --niceto-ink: #111111;
                --niceto-cream: #fafafa;
                --niceto-cream-strong: #ffffff;
                --niceto-orange: #e67e22;
                --niceto-orange-deep: #c8640d;
                --niceto-shadow: 0 16px 32px rgba(0, 0, 0, 0.12);
            }

            .template-content {
                padding-top: 7.5rem;
            }

            @media (max-width: 767px) {
                .template-content {
                    padding-top: 7rem;
                }
            }

            .template-home .template-content {
                padding-top: 0;
            }

            body {
                font-family: var(--body-font);
                background-color: var(--niceto-cream);
                color: var(--niceto-ink);
            }

            .font-display {
                font-family: var(--heading-font);
                letter-spacing: -0.02em;
            }

            .fade-in-up {
                animation: fadeInUp 0.6s ease-out forwards;
                opacity: 0;
                transform: translateY(20px);
            }

            @keyframes fadeInUp {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .product-card {
                transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .product-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 20px -8px rgba(0, 0, 0, 0.08);
            }

            .niceto-header {
                background: #e7e4e1;
                color: var(--niceto-ink);
                border-bottom: 1px solid #d8d2cb;
                box-shadow: var(--niceto-shadow);
            }

            .niceto-header__bottom {
                background: #e67e22;
                color: #fff;
                border-top: 1px solid #c8640d;
            }

            .niceto-header__mobile {
                background: #e67e22;
                color: #fff;
            }

            .niceto-header.is-scrolled {
                box-shadow: 0 18px 38px rgba(0, 0, 0, 0.18);
            }

            .niceto-icon-btn {
                width: 40px;
                height: 40px;
                border-radius: 9999px;
                border: 1px solid rgba(17, 17, 17, 0.2);
                background: rgba(17, 17, 17, 0.04);
                color: var(--niceto-ink);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                transition: transform 0.2s ease, background 0.2s ease, border-color 0.2s ease;
            }

            .niceto-icon-btn:hover {
                background: #fff;
                border-color: rgba(17, 17, 17, 0.35);
                transform: translateY(-1px);
            }

            .niceto-icon-btn--accent {
                background: #fff;
                color: var(--niceto-ink);
                border-color: rgba(17, 17, 17, 0.2);
            }

            .niceto-icon-btn--accent:hover {
                background: var(--niceto-orange);
                color: #fff;
                border-color: var(--niceto-orange);
            }

            .niceto-search {
                position: relative;
                width: 40px;
                height: 40px;
                border-radius: 9999px;
                border: 1px solid rgba(17, 17, 17, 0.2);
                background: #fff;
                overflow: hidden;
                transition: width 0.25s ease, background 0.25s ease, border-color 0.25s ease;
            }

            .niceto-search-icon {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--niceto-ink);
                pointer-events: none;
            }

            .niceto-search-input {
                width: 100%;
                height: 100%;
                padding: 0 12px 0 34px;
                border: none;
                outline: none;
                background: transparent;
                color: var(--niceto-ink);
                font-size: 12px;
                opacity: 0;
                transition: opacity 0.2s ease;
            }

            .niceto-search-input::placeholder {
                color: rgba(17, 17, 17, 0.55);
            }

            .niceto-search:focus-within {
                width: 220px;
                background: #fff;
                border-color: rgba(17, 17, 17, 0.45);
            }

            .niceto-search:focus-within .niceto-search-input {
                opacity: 1;
            }

            @media (max-width: 640px) {
                .niceto-search:focus-within {
                    width: 70vw;
                }
            }

            .niceto-cart-count {
                background: var(--niceto-orange);
                color: #fff;
                font-size: 10px;
                font-weight: 700;
                width: 20px;
                height: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 9999px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            }

            .niceto-pill {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 6px 12px;
                border-radius: 9999px;
                font-size: 10px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.2em;
                border: 1px solid rgba(17, 17, 17, 0.2);
                background: #fff;
                color: var(--niceto-ink);
            }

            .niceto-pill--light {
                background: #fff;
                color: var(--niceto-ink);
                border-color: rgba(17, 17, 17, 0.2);
            }

            .niceto-pill svg {
                width: 14px;
                height: 14px;
            }

            .niceto-nav .nav-desktop-list {
                display: flex;
                align-items: center;
                gap: 1.75rem;
                padding: 0;
                margin: 0;
            }

            .niceto-nav .nav-list-link {
                color: rgba(255, 255, 255, 0.9) !important;
                font-size: 11px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.22em;
                padding: 6px 0;
                position: relative;
                transition: color 0.2s ease;
            }

            .niceto-nav .nav-list-link:hover,
            .niceto-nav .nav-list-link.selected {
                color: #fff !important;
            }

            .niceto-nav .nav-list-link::after {
                content: "";
                position: absolute;
                left: 0;
                right: 0;
                bottom: -0.25rem;
                height: 2px;
                background: currentColor;
                opacity: 0;
                transform: translateY(4px);
                transition: opacity 0.2s ease, transform 0.2s ease;
            }

            .niceto-nav .nav-list-link:hover::after,
            .niceto-nav .nav-list-link.selected::after {
                opacity: 1;
                transform: translateY(0);
            }

            .niceto-chip {
                display: inline-flex;
                align-items: center;
                padding: 6px 12px;
                border-radius: 9999px;
                font-size: 10px;
                font-weight: 700;
                letter-spacing: 0.2em;
                text-transform: uppercase;
                border: 1px solid rgba(17, 17, 17, 0.15);
                background: #fff;
                color: var(--niceto-ink);
                white-space: nowrap;
                transition: color 0.2s ease, border-color 0.2s ease, background 0.2s ease;
            }

            .niceto-chip:hover {
                border-color: var(--niceto-orange);
                color: var(--niceto-orange);
            }

            .niceto-chip.is-active {
                background: var(--niceto-ink);
                color: #fff;
                border-color: var(--niceto-ink);
            }

            .niceto-header__mobile .niceto-chip {
                background: rgba(255, 255, 255, 0.12);
                border-color: rgba(255, 255, 255, 0.35);
                color: #fff;
            }

            .niceto-header__mobile .niceto-chip:hover {
                border-color: #fff;
                color: #fff;
            }

            .niceto-header__mobile .niceto-chip.is-active {
                background: #fff;
                color: var(--niceto-ink);
                border-color: #fff;
            }

            .hide-scrollbar::-webkit-scrollbar {
                display: none;
            }

            .hide-scrollbar {
                -ms-overflow-style: none;
                scrollbar-width: none;
            }

            #toast {
                visibility: hidden;
                min-width: 250px;
                background-color: #111;
                color: #fff;
                text-align: center;
                border-radius: 9999px;
                padding: 12px 24px;
                position: fixed;
                z-index: 100;
                left: 50%;
                bottom: 30px;
                transform: translateX(-50%) translateY(20px);
                font-size: 13px;
                font-weight: 500;
                opacity: 0;
                transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            }

            #toast.show {
                visibility: visible;
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }

            .filter-btn.active {
                background-color: #111;
                color: #fff;
                border-color: #111;
            }
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    {% set body_classes = ['minimal-theme', 'template-' ~ (template | replace('.', '-'))] %}
    {% if customer %}
        {% set body_classes = body_classes | merge(['customer-logged-in']) %}
    {% endif %}
    <body class="{{ body_classes | join(' ') }} antialiased">
        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}
        {% snipplet "header/header-modals.tpl" %}

        {# Page content #}

        <main class="template-content">
            {% template_content %}
        </main>

        {# Quickshop modal #}

        {% snipplet "grid/quick-shop.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {# Google reCAPTCHA on register page #}

        {% if template == 'account.register' %}
            {% if not store.hasContactFormsRecaptcha() %}
                {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
            {% endif %}
            <script type="text/javascript">
                var recaptchaCallback = function() {
                    jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
                };
            </script>
        {% endif %}

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

        {% if store.assorted_js %}
            <script>
                LS.ready.then(function() {
                    var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
                    jQueryNuvem('body').append(trackingCode);
                });
            </script>
        {% endif %}

        {% include "snipplets/whatsapp-floating.tpl" %}
        <script>
            if (window.lucide && typeof window.lucide.createIcons === 'function') {
                window.lucide.createIcons();
            }
        </script>
    </body>
</html>
