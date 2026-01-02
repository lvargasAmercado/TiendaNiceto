{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set footer_description = settings.footer_about_description | default('Reinventando la experiencia del kiosco. Simple, rápido y con estilo.') %}

<footer class="js-footer bg-[#111] text-white pt-20 pb-10 border-t border-gray-900" data-store="footer">
	{% if template != 'password' %}
		<div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
			<div>
				<h3 class="text-2xl font-bold tracking-tighter mb-6">{{ store.name }}</h3>
				<p class="text-gray-500 text-sm leading-relaxed">{{ footer_description }}</p>
				{% if has_social_network %}
					<div class="mt-6 flex gap-4 text-gray-400">
						{% include "snipplets/social/social-links.tpl" %}
					</div>
				{% endif %}
			</div>
			<div>
				<h4 class="text-xs font-bold uppercase tracking-widest mb-6 text-gray-400">Categorías</h4>
				<ul class="space-y-3 text-sm text-gray-300">
					{% for category in categories | slice(0, 3) %}
						<li><a href="{{ category.url }}" class="hover:text-white transition-colors">{{ category.name }}</a></li>
					{% endfor %}
				</ul>
			</div>
			<div>
				<h4 class="text-xs font-bold uppercase tracking-widest mb-6 text-gray-400">Soporte</h4>
				<ul class="space-y-3 text-sm text-gray-300">
					<li><a href="{{ store.help_url }}" class="hover:text-white transition-colors">Ayuda</a></li>
					<li><a href="{{ store.contact_url }}" class="hover:text-white transition-colors">Contacto</a></li>
					{% if store.blog %}
						<li><a href="{{ store.blog }}" class="hover:text-white transition-colors">Blog</a></li>
					{% endif %}
				</ul>
			</div>
			<div>
				<h4 class="text-xs font-bold uppercase tracking-widest mb-6 text-gray-400">Newsletter</h4>
				<form method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" class="flex border-b border-gray-700 pb-2" data-store="footer-newsletter-form">
					<input type="email" name="email" placeholder="Tu email" class="bg-transparent w-full outline-none text-sm placeholder-gray-600" required>
					<div class="winnie-pooh" style="display: none;">
						<label for="winnie-pooh-footer">No completar este campo</label>
						<input id="winnie-pooh-footer" type="text" name="winnie-pooh" />
					</div>
					<input type="hidden" name="name" value="Sin nombre" />
					<input type="hidden" name="message" value="Pedido de inscripción a newsletter" />
					<input type="hidden" name="type" value="newsletter" />
					<button type="submit" name="contact" class="text-xs font-bold uppercase hover:text-gray-300">OK</button>
				</form>
			</div>
		</div>
	{% endif %}

	<div class="max-w-7xl mx-auto px-6 text-center md:text-left pt-8 border-t border-gray-900 flex flex-col md:flex-row justify-between items-center text-xs text-gray-600">
		<div class="mb-4 md:mb-0">
			<p>© {{ "now" | date("%Y") }} {{ store.name }}. {{ store.address.city | default('') }}</p>
			<div class="mt-2 text-[11px]">
				{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
			</div>
			<div class="mt-2">
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
		</div>
		<div class="flex flex-col items-center md:items-end gap-3">
			<div class="flex gap-4">
				<i data-lucide="credit-card" class="w-4 h-4"></i>
				<i data-lucide="banknote" class="w-4 h-4"></i>
			</div>
			<div class="text-[11px]">
				{{ new_powered_by_link }}
			</div>
		</div>
	</div>
</footer>
