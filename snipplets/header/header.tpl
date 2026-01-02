{# Minimal site overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{% set head_position_mobile = 'position-sticky' %}
{% set head_position_desktop = settings.head_fix_desktop ? 'position-sticky-md' : 'position-relative-md' %}

<header class="js-head-main head-main head-colors minimal-head {{ head_position_mobile }} {{ head_position_desktop }} transition-soft" data-store="head">
	{% if settings.ad_bar %}
		{% snipplet "header/header-advertising.tpl" %}
	{% endif %}

	<div class="container-fluid">
		<div class="minimal-head-bar row align-items-center no-gutters">
			<div class="col-auto d-md-none">
				{% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
			</div>
			<div class="col-auto d-none d-md-flex align-items-center header-logo-wrapper">
				{{ component('logos/logo', {logo_size: 'medium', logo_img_classes: 'logo-img transition-soft', logo_text_classes: 'logo-text h4 m-0'}) }}
			</div>
			<div class="col text-center d-md-none header-logo-wrapper">
				{{ component('logos/logo', {logo_size: 'medium', logo_img_classes: 'logo-img transition-soft', logo_text_classes: 'logo-text h4 m-0'}) }}
			</div>
			<div class="col d-none d-md-block header-search">
				{% include "snipplets/header/header-search.tpl" %}
			</div>
			<div class="col-auto d-md-none">
				{% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
			</div>
			<div class="col-auto d-none d-md-flex align-items-center">
				{% include "snipplets/header/header-utilities.tpl" with {use_account: true, icon_only: true} %}
			</div>
			<div class="col-auto">
				{% include "snipplets/header/header-utilities.tpl" %}
			</div>
		</div>
	</div>

	<nav class="minimal-head-nav container-fluid d-none d-md-block">
		{% snipplet "navigation/navigation.tpl" %}
	</nav>

	{% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{% if settings.ajax_cart %}
	{% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}
