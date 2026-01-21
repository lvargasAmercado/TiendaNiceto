{% set featured_products = sections.primary.products | default([]) %}
{% set sale_products = sections.sale.products | default([]) %}
{% set new_products = sections.new.products | default([]) %}
{% set categories_title = settings.main_categories_title | default('Categorías principales') %}
{% set categories_kicker = settings.home_categories_kicker %}
{% set categories_link_label = settings.home_categories_link_label %}
{% set categories_link_url = settings.home_categories_link_url ? settings.home_categories_link_url | setting_url : store.products_url %}
{% set hero_kicker = settings.home_hero_kicker %}
{% set hero_title_line_1 = settings.home_hero_title_line_1 %}
{% set hero_title_line_2 = settings.home_hero_title_line_2 %}
{% set hero_description = settings.home_hero_description %}
{% set hero_primary_label = settings.home_hero_primary_label %}
{% set hero_primary_link = settings.home_hero_primary_link ? settings.home_hero_primary_link | setting_url : store.products_url %}
{% set hero_secondary_label = settings.home_hero_secondary_label %}
{% set hero_secondary_link = settings.home_hero_secondary_link ? settings.home_hero_secondary_link | setting_url : store.products_url %}
{% set hero_info_1_label = settings.home_hero_info_01_label %}
{% set hero_info_1_value = settings.home_hero_info_01_value %}
{% set hero_info_2_label = settings.home_hero_info_02_label %}
{% set hero_info_2_value = settings.home_hero_info_02_value %}
{% set hero_info_3_label = settings.home_hero_info_03_label %}
{% set hero_info_3_value = settings.home_hero_info_03_value %}
{% set hero_image_custom = 'home_hero_background.jpg' | has_custom_image %}
{% set hero_image_url = hero_image_custom ? ('home_hero_background.jpg' | static_url | settings_image_url('huge')) : ('images/TendaNiceto_1580x700px.jpg' | static_url) %}
{% set products_link_label = settings.home_products_link_label %}
{% set featured_title = settings.featured_products_title %}
{% set featured_kicker = settings.featured_products_kicker ? settings.featured_products_kicker : settings.featured_products_title %}
{% set featured_subtitle = settings.featured_products_subtitle %}
{% set sale_title = settings.sale_products_title %}
{% set sale_kicker = settings.sale_products_kicker ? settings.sale_products_kicker : settings.sale_products_title %}
{% set sale_subtitle = settings.sale_products_subtitle %}
{% set new_title = settings.new_products_title %}
{% set new_kicker = settings.new_products_kicker ? settings.new_products_kicker : settings.new_products_title %}
{% set new_subtitle = settings.new_products_subtitle %}
{% set combos_handle = settings.home_combos_category_handle ? settings.home_combos_category_handle | lower : 'combos' %}
{% set combos_kicker = settings.home_combos_kicker %}
{% set combos_title_override = settings.home_combos_title %}
{% set combos_subtitle = settings.home_combos_subtitle %}
{% set combos_link_label = settings.home_combos_link_label %}
{% set combo_kicker = settings.banner_01_kicker %}
{% set combos_category = null %}
{% for category in categories %}
    {% if category.handle == combos_handle or category.name | lower == combos_handle %}
        {% set combos_category = category %}
    {% endif %}
{% endfor %}
{% set combos_products = [] %}
{% if combos_category and combos_category.products is not empty %}
    {% set combos_products = combos_category.products %}
{% elseif sections.promotion.products %}
    {% for product in sections.promotion.products %}
        {% if product.category and (product.category.handle == combos_handle or product.category.name | lower == combos_handle) %}
            {% set combos_products = combos_products | merge([product]) %}
        {% endif %}
    {% endfor %}
{% endif %}
{% set combos_url = combos_category ? combos_category.url : store.products_url %}
{% set combos_title = combos_title_override ? combos_title_override : (combos_category ? combos_category.name : 'Combos') %}

<style>
    .niceto-hero-card {
        position: relative;
        z-index: 1;
        overflow: hidden;
        border-radius: 32px;
        min-height: 360px;
        background: #fff;
        border: 1px solid #f1f1f1;
        color: var(--niceto-ink);
        box-shadow: var(--niceto-shadow);
    }

    .niceto-hero-media {
        position: absolute;
        inset: 0;
        z-index: 0;
        overflow: hidden;
    }

    .niceto-hero-media img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.5;
        filter: saturate(1.05);
    }

    .niceto-hero-overlay {
        position: absolute;
        inset: 0;
        z-index: 2;
        background: linear-gradient(120deg, rgba(255, 255, 255, 0.88) 0%, rgba(255, 255, 255, 0.72) 50%, rgba(255, 255, 255, 0.6) 100%);
    }

    .niceto-hero-content {
        position: relative;
        z-index: 3;
        display: grid;
        gap: 2rem;
        align-items: center;
        padding: 2rem;
    }

    .niceto-hero-logo-blur {
        position: absolute;
        inset: 0;
        z-index: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0.12;
        filter: blur(14px);
        transform: scale(1.15);
        pointer-events: none;
    }

    .niceto-hero-logo-blur a {
        pointer-events: none;
    }

    .niceto-hero-logo-img {
        max-width: 70%;
        height: auto;
    }

    .niceto-hero-logo-text {
        font-size: clamp(2.5rem, 10vw, 5.5rem);
        font-weight: 700;
        color: rgba(17, 17, 17, 0.55);
        text-transform: uppercase;
        letter-spacing: 0.08em;
    }

    .niceto-hero-glow {
        position: absolute;
        inset: 0;
        z-index: 0;
        background:
            radial-gradient(circle at 20% 0%, rgba(230, 126, 34, 0.12), transparent 55%),
            radial-gradient(circle at 85% 10%, rgba(0, 0, 0, 0.04), transparent 60%);
        pointer-events: none;
    }

    .niceto-kicker {
        font-size: 0.65rem;
        letter-spacing: 0.32em;
        text-transform: uppercase;
        font-weight: 700;
        color: var(--niceto-orange);
        display: inline-flex;
        align-items: center;
        gap: 0.6rem;
    }

    .niceto-kicker::before {
        content: "";
        width: 14px;
        height: 2px;
        background: var(--niceto-orange);
        border-radius: 999px;
    }

    .niceto-kicker--dark {
        color: var(--niceto-orange);
    }

    .niceto-kicker--dark::before {
        background: var(--niceto-orange);
    }

    .niceto-muted {
        color: rgba(17, 17, 17, 0.6);
    }

    .niceto-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.9rem 1.8rem;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.2em;
        transition: transform 0.2s ease, background 0.2s ease, color 0.2s ease, border-color 0.2s ease;
    }

    .niceto-btn--primary {
        background: var(--niceto-orange);
        color: #fff;
    }

    .niceto-btn--primary:hover {
        background: var(--niceto-orange-deep);
        transform: translateY(-1px);
    }

    .niceto-btn--ghost {
        border: 1px solid #d9d9d9;
        color: #111;
        background: transparent;
    }

    .niceto-btn--ghost:hover {
        background: #111;
        border-color: #111;
        color: #fff;
    }

    .niceto-link {
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.24em;
        color: var(--niceto-ink);
        border-bottom: 2px solid transparent;
        padding-bottom: 4px;
        transition: color 0.2s ease, border-color 0.2s ease;
    }

    .niceto-link:hover {
        color: var(--niceto-orange-deep);
        border-color: var(--niceto-orange);
    }

    .niceto-category-card {
        background: #fff;
        border-radius: 22px;
        border: 1px solid #f1f1f1;
        padding: 1.5rem;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
    }

    .niceto-category-card:hover {
        transform: translateY(-4px);
        border-color: var(--niceto-orange);
        box-shadow: 0 18px 30px rgba(18, 10, 6, 0.12);
    }

    .niceto-category-image {
        width: 64px;
        height: 64px;
        border-radius: 18px;
        background: #f5f5f5;
        border: 1px solid #eeeeee;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        transition: transform 0.2s ease, border-color 0.2s ease;
    }

    .niceto-category-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .niceto-category-card:hover .niceto-category-image {
        border-color: var(--niceto-orange);
        transform: scale(1.03);
    }

    .niceto-product-card {
        background: #fff;
        border-radius: 26px;
        border: 1px solid #f1f1f1;
        box-shadow: 0 14px 30px rgba(0, 0, 0, 0.06);
    }

    .niceto-product-card:hover {
        border-color: rgba(17, 17, 17, 0.2);
    }

    .niceto-eyebrow {
        font-size: 10px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.24em;
        color: rgba(17, 17, 17, 0.45);
    }

    .niceto-add-btn {
        background: var(--niceto-ink);
        color: #fff;
    }

    .niceto-add-btn:hover {
        background: var(--niceto-orange);
    }

    .niceto-hero-info {
        background: #ffffff;
        border: 1px solid #ededed;
        border-radius: 18px;
        padding: 1rem 1.2rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .niceto-hero-info span {
        font-size: 0.75rem;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: rgba(17, 17, 17, 0.6);
        font-weight: 600;
    }

    .niceto-hero-info p {
        margin: 0;
        line-height: 1.2;
    }

    .fade-in-up {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }

    .fade-in-up.visible {
        opacity: 1;
        transform: translateY(0);
    }

    .product-card {
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05), 0 10px 10px -5px rgba(0, 0, 0, 0.01);
    }

    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    ::-webkit-scrollbar-thumb {
        background: rgba(17, 17, 17, 0.2);
        border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: rgba(17, 17, 17, 0.35);
    }

    #toast {
        visibility: hidden;
        min-width: 250px;
        background-color: var(--niceto-ink);
        color: #fff;
        text-align: center;
        border-radius: 9999px;
        padding: 14px 20px;
        position: fixed;
        z-index: 100;
        left: 50%;
        bottom: 30px;
        transform: translateX(-50%) translateY(20px);
        font-size: 13px;
        font-weight: 600;
        opacity: 0;
        transition: all 0.3s ease;
        box-shadow: 0 12px 25px rgba(18, 10, 6, 0.2);
    }

    #toast.show {
        visibility: visible;
        opacity: 1;
        transform: translateX(-50%) translateY(0);
    }

    @media (min-width: 768px) {
        .niceto-hero-card {
            min-height: 420px;
        }

        .niceto-hero-content {
            grid-template-columns: 1.1fr 0.9fr;
            padding: 3rem;
        }
    }
</style>


<section class="relative pt-28 md:pt-36 pb-14 px-6 md:px-12">
    <div class="niceto-hero-glow"></div>
    <div class="max-w-6xl mx-auto relative">
        <div class="niceto-hero-card fade-in-up">
            <div class="niceto-hero-media" aria-hidden="true">
                <img src="{{ hero_image_url }}" alt="{{ store.name }}">
            </div>
            <div class="niceto-hero-logo-blur" aria-hidden="true">
                {{ component('logos/logo', {logo_img_classes: 'niceto-hero-logo-img', logo_text_classes: 'niceto-hero-logo-text'}) }}
            </div>
            <div class="niceto-hero-overlay"></div>
            <div class="niceto-hero-content">
                <div>
                    {% if hero_kicker %}
                        <span class="niceto-kicker">{{ hero_kicker }}</span>
                    {% endif %}
                    {% if hero_title_line_1 or hero_title_line_2 %}
                        <h1 class="font-display text-4xl md:text-6xl mb-6 leading-[0.95] text-gray-900">
                            {{ hero_title_line_1 }}
                            {% if hero_title_line_2 %}
                                <br>
                                <span class="text-gray-400">{{ hero_title_line_2 }}</span>
                            {% endif %}
                        </h1>
                    {% endif %}
                    {% if hero_description %}
                        <p class="text-base md:text-lg text-gray-500 mb-8 max-w-md">{{ hero_description }}</p>
                    {% endif %}
                    <div class="flex flex-wrap gap-3">
                        {% if hero_primary_label %}
                            <a href="{{ hero_primary_link }}" class="niceto-btn niceto-btn--primary">
                                {{ hero_primary_label }}
                            </a>
                        {% endif %}
                        {% if hero_secondary_label %}
                            <a href="{{ hero_secondary_link }}" class="niceto-btn niceto-btn--ghost">
                                {{ hero_secondary_label }}
                            </a>
                        {% endif %}
                    </div>
                </div>
                <div class="hidden md:flex flex-col gap-3">
                    {% if hero_info_1_label or hero_info_1_value %}
                        <div class="niceto-hero-info">
                            <i data-lucide="timer" class="w-5 h-5 text-gray-600"></i>
                            <div>
                                {% if hero_info_1_label %}
                                    <span>{{ hero_info_1_label }}</span>
                                {% endif %}
                                {% if hero_info_1_value %}
                                    <p class="text-lg font-semibold text-gray-900">{{ hero_info_1_value }}</p>
                                {% endif %}
                            </div>
                        </div>
                    {% endif %}
                    {% if hero_info_2_label or hero_info_2_value %}
                        <div class="niceto-hero-info">
                            <i data-lucide="package" class="w-5 h-5 text-gray-600"></i>
                            <div>
                                {% if hero_info_2_label %}
                                    <span>{{ hero_info_2_label }}</span>
                                {% endif %}
                                {% if hero_info_2_value %}
                                    <p class="text-lg font-semibold text-gray-900">{{ hero_info_2_value }}</p>
                                {% endif %}
                            </div>
                        </div>
                    {% endif %}
                    {% if hero_info_3_label or hero_info_3_value %}
                        <div class="niceto-hero-info">
                            <i data-lucide="shield-check" class="w-5 h-5 text-gray-600"></i>
                            <div>
                                {% if hero_info_3_label %}
                                    <span>{{ hero_info_3_label }}</span>
                                {% endif %}
                                {% if hero_info_3_value %}
                                    <p class="text-lg font-semibold text-gray-900">{{ hero_info_3_value }}</p>
                                {% endif %}
                            </div>
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</section>

{% if settings.main_categories %}
    <section class="py-14 px-6 md:px-12">
        <div class="max-w-6xl mx-auto">
            <div class="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-8 fade-in-up">
                <div>
                    {% if categories_kicker %}
                        <p class="niceto-kicker niceto-kicker--dark">{{ categories_kicker }}</p>
                    {% endif %}
                    <h2 class="text-2xl md:text-3xl font-display tracking-tight">{{ categories_title }}</h2>
                </div>
                {% if categories_link_label %}
                    <a href="{{ categories_link_url }}" class="niceto-link">{{ categories_link_label }}</a>
                {% endif %}
            </div>
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
                {% for category in categories | slice(0, 6) %}
                    {% set category_image = category.images is not empty ? (category.images | first | category_image_url('large')) : ('images/empty-placeholder.png' | static_url) %}
                    <a href="{{ category.url }}" class="niceto-category-card flex flex-col items-center justify-center gap-3 text-center">
                        <div class="niceto-category-image">
                            <img src="{{ category_image }}" alt="{{ category.name }}" loading="lazy">
                        </div>
                        <span class="text-sm font-semibold">{{ category.name }}</span>
                    </a>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}

{% if sale_products | length > 0 %}
    <section class="py-16 px-6 md:px-12">
        <div class="max-w-6xl mx-auto">
            <div class="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-10 fade-in-up">
                <div>
                    {% if sale_kicker %}
                        <p class="niceto-kicker niceto-kicker--dark">{{ sale_kicker }}</p>
                    {% endif %}
                    {% if sale_title %}
                        <h2 class="text-3xl md:text-4xl font-display tracking-tight">{{ sale_title }}</h2>
                    {% endif %}
                    {% if sale_subtitle %}
                        <p class="niceto-muted text-sm">{{ sale_subtitle }}</p>
                    {% endif %}
                </div>
                {% if products_link_label %}
                    <a href="{{ store.products_url }}" class="niceto-link">{{ products_link_label }}</a>
                {% endif %}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                {% for product in sale_products | slice(0, 8) %}
                    <div class="product-card niceto-product-card p-4 cursor-pointer flex flex-col h-full fade-in-up">
                        <div class="relative aspect-square mb-4 bg-gray-50 rounded-2xl overflow-hidden group">
                            <a href="{{ product.url }}" class="absolute inset-0">
                                <img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-110 transition-transform duration-500">
                            </a>
                            {% if product.available and product.display_price %}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                                    <button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add niceto-add-btn absolute bottom-3 right-3 w-10 h-10 rounded-full flex items-center justify-center shadow-lg transform translate-y-12 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:scale-110" aria-label="Agregar {{ product.name }}">
                                        <i data-lucide="plus" class="w-5 h-5"></i>
                                    </button>
                                </form>
                            {% endif %}
                        </div>
                        <div class="mt-auto">
                            {% if product.category %}
                                <p class="niceto-eyebrow mb-1">{{ product.category.name }}</p>
                            {% endif %}
                            <h3 class="text-sm font-semibold leading-tight mb-2 min-h-[40px]">
                                <a href="{{ product.url }}" class="hover:underline">{{ product.name }}</a>
                            </h3>
                            {% if product.display_price %}
                                <p class="text-base font-bold">{{ product.price | money }}</p>
                            {% endif %}
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}

{% if featured_products | length > 0 %}
    <section class="py-16 px-6 md:px-12">
        <div class="max-w-6xl mx-auto">
            <div class="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-10 fade-in-up">
                <div>
                    {% if featured_kicker %}
                        <p class="niceto-kicker niceto-kicker--dark">{{ featured_kicker }}</p>
                    {% endif %}
                    {% if featured_title %}
                        <h2 class="text-3xl md:text-4xl font-display tracking-tight">{{ featured_title }}</h2>
                    {% endif %}
                    {% if featured_subtitle %}
                        <p class="niceto-muted text-sm">{{ featured_subtitle }}</p>
                    {% endif %}
                </div>
                {% if products_link_label %}
                    <a href="{{ store.products_url }}" class="niceto-link">{{ products_link_label }}</a>
                {% endif %}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                {% for product in featured_products | slice(0, 8) %}
                    <div class="product-card niceto-product-card p-4 cursor-pointer flex flex-col h-full fade-in-up">
                        <div class="relative aspect-square mb-4 bg-gray-50 rounded-2xl overflow-hidden group">
                            <a href="{{ product.url }}" class="absolute inset-0">
                                <img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-110 transition-transform duration-500">
                            </a>
                            {% if product.available and product.display_price %}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                                    <button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add niceto-add-btn absolute bottom-3 right-3 w-10 h-10 rounded-full flex items-center justify-center shadow-lg transform translate-y-12 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:scale-110" aria-label="Agregar {{ product.name }}">
                                        <i data-lucide="plus" class="w-5 h-5"></i>
                                    </button>
                                </form>
                            {% endif %}
                        </div>
                        <div class="mt-auto">
                            {% if product.category %}
                                <p class="niceto-eyebrow mb-1">{{ product.category.name }}</p>
                            {% endif %}
                            <h3 class="text-sm font-semibold leading-tight mb-2 min-h-[40px]">
                                <a href="{{ product.url }}" class="hover:underline">{{ product.name }}</a>
                            </h3>
                            {% if product.display_price %}
                                <p class="text-base font-bold">{{ product.price | money }}</p>
                            {% endif %}
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}

{% if new_products | length > 0 %}
    <section class="py-16 px-6 md:px-12">
        <div class="max-w-6xl mx-auto">
            <div class="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-10 fade-in-up">
                <div>
                    {% if new_kicker %}
                        <p class="niceto-kicker niceto-kicker--dark">{{ new_kicker }}</p>
                    {% endif %}
                    {% if new_title %}
                        <h2 class="text-3xl md:text-4xl font-display tracking-tight">{{ new_title }}</h2>
                    {% endif %}
                    {% if new_subtitle %}
                        <p class="niceto-muted text-sm">{{ new_subtitle }}</p>
                    {% endif %}
                </div>
                {% if products_link_label %}
                    <a href="{{ store.products_url }}" class="niceto-link">{{ products_link_label }}</a>
                {% endif %}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                {% for product in new_products | slice(0, 8) %}
                    <div class="product-card niceto-product-card p-4 cursor-pointer flex flex-col h-full fade-in-up">
                        <div class="relative aspect-square mb-4 bg-gray-50 rounded-2xl overflow-hidden group">
                            <a href="{{ product.url }}" class="absolute inset-0">
                                <img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-110 transition-transform duration-500">
                            </a>
                            {% if product.available and product.display_price %}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                                    <button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add niceto-add-btn absolute bottom-3 right-3 w-10 h-10 rounded-full flex items-center justify-center shadow-lg transform translate-y-12 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:scale-110" aria-label="Agregar {{ product.name }}">
                                        <i data-lucide="plus" class="w-5 h-5"></i>
                                    </button>
                                </form>
                            {% endif %}
                        </div>
                        <div class="mt-auto">
                            {% if product.category %}
                                <p class="niceto-eyebrow mb-1">{{ product.category.name }}</p>
                            {% endif %}
                            <h3 class="text-sm font-semibold leading-tight mb-2 min-h-[40px]">
                                <a href="{{ product.url }}" class="hover:underline">{{ product.name }}</a>
                            </h3>
                            {% if product.display_price %}
                                <p class="text-base font-bold">{{ product.price | money }}</p>
                            {% endif %}
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}

{% if settings.banner_01_show %}
    {% set combo_title = settings.banner_01_title | default('Combo Cine en Casa') %}
    {% set combo_description = settings.banner_01_description | default('Llevate 2 Coca-Cola 1.5L + Lays Clásicas + Chocolate Block con un 20% OFF.') %}
    {% set combo_button = settings.banner_01_button | default('VER COMBOS') %}
    {% set combo_url = settings.banner_01_url ? settings.banner_01_url | setting_url : store.products_url %}
    {% set combo_image_custom = "banner_01.jpg" | has_custom_image %}
    {% set combo_image_url = combo_image_custom ? ("banner_01.jpg" | static_url | settings_image_url('huge')) : ("images/home_promo_image.jpg" | static_url) %}

    <section class="py-20 px-6">
        <div class="max-w-6xl mx-auto bg-black text-white rounded-[2rem] overflow-hidden relative fade-in-up">
            <div class="absolute top-0 right-0 w-64 h-64 bg-gray-800 rounded-full blur-[100px] opacity-50 pointer-events-none"></div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 p-12 md:p-20 items-center relative z-10">
                <div>
                    {% if combo_kicker %}
                        <span class="text-xs font-bold tracking-[0.2em] text-gray-400 uppercase mb-4 block">{{ combo_kicker }}</span>
                    {% endif %}
                    <h2 class="text-4xl md:text-5xl font-bold tracking-tight mb-6 !text-white">{{ combo_title }}</h2>
                    <p class="text-gray-400 text-lg mb-8 font-light">{{ combo_description }}</p>
                    {% if combo_button %}
                        <a href="{{ combo_url }}" class="bg-white text-black px-8 py-3 rounded-full font-bold tracking-wide hover:bg-gray-200 transition-colors inline-flex items-center">
                            {{ combo_button }}
                        </a>
                    {% endif %}
                </div>
                <div class="flex justify-center">
                    <img src="{{ combo_image_url }}" alt="{{ combo_title }}" class="rounded-2xl shadow-2xl rotate-3 hover:rotate-0 transition-transform duration-500 w-3/4 object-cover grayscale-[10%]">
                </div>
            </div>
        </div>
    </section>
{% endif %}

{% if combos_products | length > 0 %}
    <section class="py-16 px-6 border-t border-gray-100 bg-white">
        <div class="max-w-6xl mx-auto">
            <div class="flex flex-col md:flex-row md:items-end md:justify-between gap-4 mb-10 fade-in-up">
                <div>
                    {% if combos_kicker %}
                        <p class="niceto-kicker niceto-kicker--dark">{{ combos_kicker }}</p>
                    {% endif %}
                    {% if combos_title %}
                        <h2 class="text-2xl md:text-3xl font-display tracking-tight">{{ combos_title }}</h2>
                    {% endif %}
                    {% if combos_subtitle %}
                        <p class="niceto-muted text-sm">{{ combos_subtitle }}</p>
                    {% endif %}
                </div>
                {% if combos_link_label %}
                    <a href="{{ combos_url }}" class="niceto-link">{{ combos_link_label }}</a>
                {% endif %}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                {% for product in combos_products | slice(0, 8) %}
                    <div class="product-card niceto-product-card p-4 cursor-pointer flex flex-col h-full fade-in-up">
                        <div class="relative aspect-square mb-4 bg-gray-50 rounded-2xl overflow-hidden group">
                            <a href="{{ product.url }}" class="absolute inset-0">
                                <img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-110 transition-transform duration-500">
                            </a>
                            {% if product.available and product.display_price %}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                                    <button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add niceto-add-btn absolute bottom-3 right-3 w-10 h-10 rounded-full flex items-center justify-center shadow-lg transform translate-y-12 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:scale-110" aria-label="Agregar {{ product.name }}">
                                        <i data-lucide="plus" class="w-5 h-5"></i>
                                    </button>
                                </form>
                            {% endif %}
                        </div>
                        <div class="mt-auto">
                            {% if product.category %}
                                <p class="niceto-eyebrow mb-1">{{ product.category.name }}</p>
                            {% endif %}
                            <h3 class="text-sm font-semibold leading-tight mb-2 min-h-[40px]">
                                <a href="{{ product.url }}" class="hover:underline">{{ product.name }}</a>
                            </h3>
                            {% if product.display_price %}
                                <p class="text-base font-bold">{{ product.price | money }}</p>
                            {% endif %}
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}

<div id="toast">Producto agregado al carrito</div>

<script>
    if (window.lucide && typeof window.lucide.createIcons === 'function') {
        window.lucide.createIcons();
    }

    function showToast(message) {
        const toast = document.getElementById("toast");
        toast.innerText = message;
        toast.className = "show";
        setTimeout(function () {
            toast.className = toast.className.replace("show", "");
        }, 3000);
    }

    document.querySelectorAll('.js-niceto-add').forEach((button) => {
        button.addEventListener('click', () => {
            const name = button.getAttribute('data-product-name');
            if (name) {
                showToast(`Agregaste ${name} al carrito`);
            }
        });
    });

    const observerOptions = {
        threshold: 0.1,
        rootMargin: "0px 0px -50px 0px"
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in-up').forEach(el => {
        observer.observe(el);
    });

    const nav = document.getElementById('navbar');
    const handleScroll = () => {
        if (!nav) {
            return;
        }
        if (window.scrollY > 40) {
            nav.classList.add('is-scrolled');
        } else {
            nav.classList.remove('is-scrolled');
        }
    };

    handleScroll();
    window.addEventListener('scroll', handleScroll);
</script>
