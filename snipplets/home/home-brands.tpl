{% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home {% if settings.brands_colors %}section-brands-home-colors{% endif %} overflow-none" data-store="home-brands">
		<div class="container">
			<div class="brands-header d-flex flex-column flex-md-row align-items-start align-items-md-center justify-content-between">
				{% if settings.brands_title %}
					<h2 class="section-title h5 m-0">{{ settings.brands_title }}</h2>
				{% endif %}
				<div class="brands-controls d-none d-md-flex align-items-center">
					<button type="button" class="js-swiper-brands-prev swiper-button-prev swiper-button-minimal" aria-label="{{ 'Anterior' | translate }}">
						{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
					</button>
					<button type="button" class="js-swiper-brands-next swiper-button-next swiper-button-minimal" aria-label="{{ 'Siguiente' | translate }}">
						{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
					</button>
				</div>
			</div>
			<div class="brands-slider">
				<div
					class="js-swiper-brands swiper-container text-center"
					data-brands-autoplay="2600"
					data-brands-speed="600"
					data-brands-gap="24"
					data-brands-mobile="2.2"
					data-brands-tablet="4"
					data-brands-desktop="6"
					data-brands-wide="8"
				>
					<div class="js-swiper-brands-wrapper swiper-wrapper">
						{% for slide in settings.brands %}
							<div class="swiper-slide brand-slide text-center">
								{% if slide.link %}
									<a href="{{ slide.link | setting_url }}" class="brand-link" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
								{% endif %}
									<span class="brand-logo">
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									</span>
								{% if slide.link %}
									</a>
								{% endif %}
							</div>
						{% endfor %}
					</div>
				</div>
				<div class="brands-controls d-flex d-md-none align-items-center justify-content-center">
					<button type="button" class="js-swiper-brands-prev swiper-button-prev swiper-button-minimal" aria-label="{{ 'Anterior' | translate }}">
						{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
					</button>
					<button type="button" class="js-swiper-brands-next swiper-button-next swiper-button-minimal" aria-label="{{ 'Siguiente' | translate }}">
						{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
					</button>
				</div>
			</div>
		</div>
	</section>
{% endif %}
