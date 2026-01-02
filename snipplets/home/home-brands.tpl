{% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home {% if settings.brands_colors %}section-brands-home-colors{% endif %} overflow-none" data-store="home-brands">
		<div class="container">
			<div class="row align-items-center">
				{% if settings.brands_title %}
					<div class="col-md-2">
						<h2 class="h6 mb-3 m-md-0">{{ settings.brands_title }}</h2>
					</div>
				{% endif %}
				<div class="{% if settings.brands_title %}col-md-10{% else %}col-12{% endif %}">
					<div class="js-swiper-brands swiper-container text-center">
						<div class="js-swiper-brands-wrapper swiper-wrapper">
							{% for slide in settings.brands %}
								<div class="swiper-slide brand-slide text-center">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% endif %}
										<div class="home-circle-image home-circle-image-md opacity-10-line">
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
										</div>
									{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
					</div>
					<div class="js-swiper-brands-prev swiper-button-prev swiper-button-outside svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
					<div class="js-swiper-brands-next swiper-button-next swiper-button-outside svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
