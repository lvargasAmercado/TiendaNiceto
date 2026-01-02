{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% if settings.grid_columns_desktop == '5' %}
		{% paginate by 50 %}
	{% else %}
		{% paginate by 48 %}
	{% endif %}
{% endif %}

{% if not show_help %}
	{% if products %}
		{% include 'snipplets/grid/filters-modals.tpl' %}
		<section class="js-category-controls-prev category-controls-sticky-detector"></section>
	{% endif %}

	<main class="flex-1 pt-24 pb-20 px-4 md:px-8 max-w-[1600px] mx-auto w-full">
		<div class="flex flex-col md:flex-row md:items-end justify-between mb-8 gap-4 fade-in-up">
			<div>
				<nav class="flex text-xs text-gray-500 mb-2 gap-2">
					{% include 'snipplets/breadcrumbs.tpl' %}
				</nav>
				<h1 class="text-3xl md:text-4xl font-bold tracking-tight text-gray-900">{{ category.name }}</h1>
				{% if category.description %}
					<p class="text-sm text-gray-500 mt-2 max-w-2xl">{{ category.description }}</p>
				{% endif %}
			</div>

			<div class="md:hidden w-full relative">
				<i data-lucide="search" class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400"></i>
				<form action="{{ store.search_url }}" method="get">
					<input type="text" name="q" placeholder="Buscar..." class="w-full bg-white border border-gray-200 rounded-lg py-2 pl-10 pr-4 text-sm">
				</form>
			</div>

			{% if products %}
				<div class="flex items-center gap-2">
					<span class="text-sm text-gray-500 hidden md:inline">Ordenar por:</span>
					<a href="#" class="js-modal-open text-sm font-medium border border-gray-200 rounded-full px-4 py-2 hover:border-black transition-colors" data-toggle="#sort-by">
						Recomendados
					</a>
				</div>
			{% endif %}
		</div>

		<div class="flex flex-col lg:flex-row gap-8">
			<aside class="w-full lg:w-64 flex-shrink-0 fade-in-up">
				<div class="sticky top-24">
					<h3 class="font-bold text-sm uppercase tracking-widest mb-4 hidden lg:block">Categorías</h3>
					<div class="flex lg:flex-col gap-2 overflow-x-auto hide-scrollbar pb-2 lg:pb-0">
						<a href="{{ store.products_url }}" class="filter-btn whitespace-nowrap px-4 py-2 lg:px-0 lg:py-1.5 lg:pl-3 text-sm rounded-full lg:rounded-md border border-gray-200 lg:border-transparent lg:text-left transition-colors {% if not category or category.id == 0 %}active{% else %}text-gray-500 hover:text-black hover:bg-gray-50{% endif %}">Ver Todo</a>
						{% for filter_category in filter_categories %}
							<a href="{{ filter_category.url }}" class="filter-btn whitespace-nowrap px-4 py-2 lg:px-0 lg:py-1.5 lg:pl-3 text-sm rounded-full lg:rounded-md border border-gray-200 lg:border-transparent lg:text-left transition-colors {% if category.id == filter_category.id %}active{% else %}text-gray-500 hover:text-black hover:bg-gray-50{% endif %}">{{ filter_category.name }}</a>
						{% endfor %}
					</div>

					{% if product_filters is not empty %}
						<div class="mt-8 hidden lg:block border-t border-gray-100 pt-6">
							<h3 class="font-bold text-sm uppercase tracking-widest mb-4">Filtros</h3>
							{% include "snipplets/grid/filters.tpl" %}
						</div>
					{% endif %}
				</div>
			</aside>

			<div class="flex-1">
				{% if has_applied_filters %}
					<div class="mb-4 flex justify-end">
						{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
					</div>
				{% endif %}
				<div class="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4 md:gap-6" id="products-grid">
					{% for product in products %}
						<div class="product-card bg-white rounded-xl overflow-hidden border border-gray-100 cursor-pointer group flex flex-col fade-in-up" style="animation-delay: {{ (loop.index0 % 4) * 100 + 200 }}ms;">
							<div class="relative aspect-square bg-gray-50 overflow-hidden">
								<a href="{{ product.url }}" class="absolute inset-0">
									<img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-105 transition-transform duration-500">
								</a>
								{% if product.available and product.display_price %}
									<form class="js-product-form" method="post" action="{{ store.cart_url }}">
										<input type="hidden" name="add_to_cart" value="{{ product.id }}" />
										<button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add absolute bottom-3 right-3 w-8 h-8 md:w-10 md:h-10 bg-white text-black rounded-full flex items-center justify-center shadow-md transform translate-y-10 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:bg-black hover:text-white" aria-label="Agregar {{ product.name }}">
											<i data-lucide="plus" class="w-4 h-4 md:w-5 md:h-5"></i>
										</button>
									</form>
								{% endif %}
								{% if loop.index <= 2 %}
									<span class="absolute top-3 left-3 bg-black text-white text-[10px] font-bold px-2 py-1 rounded-full uppercase tracking-widest">Hot</span>
								{% endif %}
							</div>
							<div class="p-4 flex-1 flex flex-col">
								{% if product.category %}
									<span class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mb-1">{{ product.category.name }}</span>
								{% endif %}
								<h3 class="text-sm font-medium text-gray-900 leading-snug mb-2 line-clamp-2"><a href="{{ product.url }}">{{ product.name }}</a></h3>
								<div class="mt-auto flex items-center justify-between">
									{% if product.display_price %}
										<span class="text-base font-bold text-black">{{ product.price | money }}</span>
									{% endif %}
								</div>
							</div>
						</div>
					{% endfor %}
				</div>

				<div class="mt-16 text-center">
					{% include 'snipplets/grid/pagination.tpl' %}
				</div>
			</div>
		</div>
	</main>

	<div id="toast" class="flex items-center gap-2">
		<i data-lucide="check-circle" class="w-4 h-4 text-green-400"></i>
		<span id="toast-message">Producto agregado</span>
	</div>

	<script>
		document.querySelectorAll('.js-niceto-add').forEach((button) => {
			button.addEventListener('click', () => {
				const name = button.getAttribute('data-product-name');
				if (!name) {
					return;
				}
				const toast = document.getElementById('toast');
				const msg = document.getElementById('toast-message');
				msg.innerText = `Agregado: ${name}`;
				toast.classList.add('show');
				setTimeout(() => toast.classList.remove('show'), 2500);
			});
		});

		const buttons = document.querySelectorAll('.filter-btn');
		buttons.forEach(btn => {
			btn.addEventListener('click', () => {
				buttons.forEach(b => b.classList.remove('active', 'bg-black', 'text-white', 'border-black'));
				buttons.forEach(b => {
					if (!b.classList.contains('active')) b.classList.add('text-gray-500');
				});
				btn.classList.add('active');
				btn.classList.remove('text-gray-500');
			});
		});
	</script>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
