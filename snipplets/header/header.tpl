{# Minimal site overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{% set cart_count = cart.items_count | default(0) %}
{% set header_logo_custom = 'header_logo_image.jpg' | has_custom_image %}
{% set header_logo_url = header_logo_custom ? ('header_logo_image.jpg' | static_url | settings_image_url('large')) : ('images/JPG_TiendaNiceto_575x230px.jpg' | static_url) %}
{% set header_delivery_label = settings.header_delivery_label %}
{% set header_search_placeholder = settings.header_search_placeholder %}

<header id="navbar" class="js-head-main niceto-header fixed top-0 w-full z-50 transition-all duration-300" data-store="head">
	{% if settings.ad_bar %}
		{% snipplet "header/header-advertising.tpl" %}
	{% endif %}

	<div class="niceto-header__top">
		<div class="max-w-6xl mx-auto px-4 sm:px-6 py-3 md:py-4">
			<div class="grid grid-cols-[auto_1fr_auto] md:grid-cols-[1fr_auto_1fr] items-center gap-3">
				<div class="flex items-center gap-2 sm:gap-3">
					<a href="#" class="js-modal-open js-fullscreen-modal-open niceto-icon-btn" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
						<i data-lucide="menu" class="w-5 h-5"></i>
					</a>
					<form action="{{ store.search_url }}" method="get" class="niceto-search" role="search">
						<i data-lucide="search" class="niceto-search-icon w-4 h-4"></i>
						<input type="search" name="q" placeholder="{{ header_search_placeholder }}" class="niceto-search-input" aria-label="{{ 'Buscar' | translate }}">
					</form>
					{% if header_delivery_label %}
						<div class="hidden xl:flex items-center gap-2 text-[10px] font-semibold uppercase tracking-[0.3em] text-gray-500">
							<span class="w-1.5 h-1.5 rounded-full bg-black/30"></span>
							{{ header_delivery_label }}
						</div>
					{% endif %}
				</div>

				<div class="flex items-center justify-center">
					<a href="{{ store.url }}" class="inline-flex items-center">
						<img src="{{ header_logo_url }}" alt="{{ store.name }}" class="h-10 sm:h-12 md:h-14 w-auto object-contain">
					</a>
				</div>

				<div class="flex items-center justify-end gap-2 sm:gap-3">
					{% if store.phone %}
						<a href="tel:{{ store.phone }}" class="hidden lg:inline-flex niceto-pill niceto-pill--light" aria-label="{{ 'Ventas' | translate }}">
							<i data-lucide="phone" class="w-4 h-4"></i>
							<span>Ventas {{ store.phone }}</span>
						</a>
					{% endif %}
					<a href="{% if not customer %}{{ store.customer_login_url }}{% else %}{{ store.customer_home_url }}{% endif %}" class="hidden md:inline-flex niceto-icon-btn" aria-label="{{ 'Cuenta' | translate }}">
						<i data-lucide="user" class="w-5 h-5"></i>
					</a>
					<div id="ajax-cart" class="cart-summary flex-shrink-0" data-component="cart-button">
						<a
							{% if settings.ajax_cart and template != 'cart' %}
								href="#"
								data-toggle="#modal-cart"
								data-modal-url="modal-fullscreen-cart"
							{% else %}
								href="{{ store.cart_url }}"
							{% endif %}
							class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} relative niceto-icon-btn niceto-icon-btn--accent"
							aria-label="{{ 'Carrito' | translate }}"
						>
							<i data-lucide="shopping-bag" class="w-5 h-5"></i>
							<span class="js-cart-widget-amount absolute -top-1 -right-1 niceto-cart-count {% if cart_count > 0 %}scale-100{% else %}scale-0{% endif %} transition-transform duration-300">{{ cart_count }}</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="niceto-header__bottom hidden md:block">
		<div class="max-w-6xl mx-auto px-4 sm:px-6 py-2 flex items-center justify-between gap-6">
			<nav class="niceto-nav flex-1">
				{% snipplet "navigation/navigation.tpl" %}
			</nav>
			{% if header_delivery_label %}
				<div class="hidden lg:flex items-center gap-3">
					<span class="niceto-pill">
						<i data-lucide="timer" class="w-4 h-4"></i>
						{{ header_delivery_label }}
					</span>
				</div>
			{% endif %}
		</div>
	</div>

	{% if navigation and navigation is not empty %}
		<div class="niceto-header__mobile md:hidden">
			<div class="max-w-6xl mx-auto px-4 pb-3">
				<div class="flex gap-2 overflow-x-auto hide-scrollbar">
					{% for item in navigation | slice(0, 6) %}
						<a href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}" class="niceto-chip {% if item.current %}is-active{% endif %}">{{ item.name }}</a>
					{% endfor %}
				</div>
			</div>
		</div>
	{% endif %}

	{% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{% if settings.ajax_cart %}
	{% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}
