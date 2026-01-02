{# Minimal site overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{% set cart_count = cart.items_count | default(0) %}

<header id="navbar" class="js-head-main fixed top-0 w-full z-50 transition-all duration-300 bg-white/80 backdrop-blur-md border-b border-gray-100" data-store="head">
	{% if settings.ad_bar %}
		{% snipplet "header/header-advertising.tpl" %}
	{% endif %}

	<div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
		<div class="flex items-center gap-4">
			<a href="#" class="js-modal-open p-2 hover:bg-gray-100 rounded-full transition-colors md:hidden" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}">
				<i data-lucide="menu" class="w-6 h-6 text-gray-800"></i>
			</a>
			<a href="{{ store.url }}" class="text-2xl font-bold tracking-tighter text-black flex items-center gap-2">
				{{ store.name }} <span class="text-xs font-normal text-gray-500 bg-gray-100 px-2 py-0.5 rounded-full tracking-wide">KIOSCO</span>
			</a>
		</div>

		<form action="{{ store.search_url }}" method="get" class="hidden md:flex items-center bg-gray-100 rounded-full px-4 py-2 w-96 transition-all focus-within:ring-1 focus-within:ring-black focus-within:bg-white">
			<i data-lucide="search" class="w-4 h-4 text-gray-400"></i>
			<input type="text" name="q" placeholder="¿Qué se te antoja hoy?" class="bg-transparent border-none outline-none text-sm ml-2 w-full placeholder-gray-500 text-gray-900">
		</form>

		<div class="flex items-center gap-6">
			<div class="hidden md:block text-right">
				<p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest">Delivery</p>
				<p class="text-xs font-medium">15-30 min</p>
			</div>
			<div id="ajax-cart" class="cart-summary" data-component="cart-button">
				<a
					{% if settings.ajax_cart and template != 'cart' %}
						href="#"
						data-toggle="#modal-cart"
						data-modal-url="modal-fullscreen-cart"
					{% else %}
						href="{{ store.cart_url }}"
					{% endif %}
					class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} relative group p-2"
					aria-label="{{ 'Carrito' | translate }}"
				>
					<i data-lucide="shopping-bag" class="w-6 h-6 text-gray-800 group-hover:text-gray-500 transition-colors"></i>
					<span class="js-cart-widget-amount absolute -top-1 -right-1 w-5 h-5 bg-black text-white text-[10px] font-bold flex items-center justify-center rounded-full {% if cart_count > 0 %}scale-100{% else %}scale-0{% endif %} transition-transform duration-300">{{ cart_count }}</span>
				</a>
			</div>
		</div>
	</div>

	<nav class="max-w-7xl mx-auto px-6 pb-4 hidden md:block">
		{% snipplet "navigation/navigation.tpl" %}
	</nav>

	{% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{% if settings.ajax_cart %}
	{% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}
