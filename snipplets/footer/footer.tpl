{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-footer js-hide-footer-while-scrolling footer-minimal {% if settings.footer_colors %}footer-colors{% endif %} display-when-content-ready overflow-none" data-store="footer">
	{% if template != 'password' %}
		<div class="container">
			<div class="footer-main row">
				<div class="col-md-4 footer-column">
					<div class="footer-brand">
						{{ component('logos/logo', {logo_size: 'medium', logo_img_classes: 'footer-logo-img transition-soft', logo_text_classes: 'h4 m-0'}) }}
						{% if has_footer_about %}
							<p class="footer-tagline">{{ settings.footer_about_description }}</p>
						{% endif %}
					</div>
					{% if has_social_network %}
						<div class="footer-social">
							{% include "snipplets/social/social-links.tpl" %}
						</div>
					{% endif %}
					{% if settings.news_show %}
						<div class="footer-newsletter">
							{% include 'snipplets/newsletter.tpl' %}
						</div>
					{% endif %}
				</div>
				<div class="col-md-4 footer-column">
					{% if has_footer_menu %}
						<h3 class="footer-title">{{ settings.footer_menu_title ?: "Navegación" | translate }}</h3>
						{% include "snipplets/navigation/navigation-foot.tpl" %}
					{% endif %}
					{% if has_footer_menu_secondary %}
						<h3 class="footer-title mt-3">{{ settings.footer_menu_secondary_title ?: "Más" | translate }}</h3>
						{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
					{% endif %}
				</div>
				<div class="col-md-4 footer-column">
					{% if has_footer_contact_info %}
						<h3 class="footer-title">{{ settings.footer_contact_title ?: "Contacto" | translate }}</h3>
						{% include "snipplets/contact-links.tpl" with {footer: true} %}
					{% endif %}
				</div>
			</div>

			{% if has_shipping_payment_logos or has_languages or has_seal_logos %}
				<div class="footer-divider"></div>
				<div class="footer-extras">
					{% if has_shipping_payment_logos or has_languages %}
						<div class="row align-items-center">
							{% if has_payment_logos %}
								<div class="col-md footer-payments-shipping-logos mb-3 mb-md-0">
									<span class="footer-subtitle">{{ "Medios de pago" | translate }}</span>
									<span class="d-inline-block align-middle">
										{{ component('payment-shipping-logos', {'type' : 'payments'}) }}
									</span>
								</div>
							{% endif %}

							{% if has_shipping_logos %}
								<div class="col-md footer-payments-shipping-logos mb-3 mb-md-0">
									<span class="footer-subtitle">{{ "Medios de envío" | translate }}</span>
									<span class="d-inline-block align-middle">
										{{ component('payment-shipping-logos', {'type' : 'shipping'}) }}
									</span>
								</div>
							{% endif %}

							{% if has_languages %}
								<div class="col-md-auto">
									<span class="footer-subtitle d-block mb-2">{{ "Idiomas y monedas" | translate }}</span>
									{% include "snipplets/navigation/navigation-lang.tpl" %}
								</div>
							{% endif %}
						</div>
					{% endif %}

					{% if has_seal_logos %}
						<div class="row text-center">
							<div class="col pt-3">
								{% if store.afip or ebit %}
									{% if store.afip %}
										<div class="footer-logo afip seal-afip">
											{{ store.afip | raw }}
										</div>
									{% endif %}
									{% if ebit %}
										<div class="footer-logo ebit seal-ebit">
											{{ ebit }}
										</div>
									{% endif %}
								{% endif %}
								{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
									{% if "seal_img.jpg" | has_custom_image %}
										<div class="footer-logo custom-seal">
											{% if settings.seal_url != '' %}
												<a href="{{ settings.seal_url | setting_url }}" target="_blank">
											{% endif %}
												<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
											{% if settings.seal_url != '' %}
												</a>
											{% endif %}
										</div>
									{% endif %}
									{% if settings.custom_seal_code %}
										<div class="custom-seal custom-seal-code">
											{{ settings.custom_seal_code | raw }}
										</div>
									{% endif %}
								{% endif %}
							</div>
						</div>
					{% endif %}
				</div>
			{% endif %}
		</div>
	{% endif %}

	<div class="js-footer-legal footer-legal">
		<div class="container">
			<div class="row align-items-center text-center text-md-left">
				<div class="col-md font-smallest">
					<div class="d-inline-block mr-md-2">
						{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
					</div>
					{{ component('claim-info', {
							container_classes: "font-smallest d-md-inline-block mt-md-0 mt-3",
							divider_classes: "mx-1 d-none d-md-inline-block",
							text_classes: {text_consumer_defense: 'd-inline-block'},
							link_classes: {
								link_consumer_defense: "btn-link font-smallest",
								link_order_cancellation: "btn-link font-smallest d-md-inline-block d-block mt-2 mt-md-0 mb-2 mb-md-0 w-100 w-md-auto",
							},
						}) 
					}}
				</div>
				<div class="col-md-auto">
					{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse
					con las mismas palabras y con su apropiado link a Tienda Nube;
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
					manter visivél e com um link funcionando.
					#}
					{{ new_powered_by_link }}
				</div>
			</div>
		</div>
	</div>
</footer>
