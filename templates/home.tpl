{% set featured_products = sections.primary.products | default([]) %}
{% set category_icon_map = {
    'Bebidas': 'glass-water',
    'Golosinas': 'candy',
    'Snacks': 'cookie',
    'Tabaco': 'cigarette',
    'Almacén': 'shopping-basket',
    'Farmacia': 'pill'
} %}

<style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #fafafa;
        color: #111;
        overflow-x: hidden;
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

    .btn-primary {
        position: relative;
        overflow: hidden;
        transition: all 0.3s ease;
    }

    .btn-primary::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #333;
        transform: scaleX(0);
        transform-origin: bottom right;
        transition: transform 0.3s ease-out;
        z-index: -1;
    }

    .btn-primary:hover::after {
        transform: scaleX(1);
        transform-origin: bottom left;
    }

    .btn-primary:hover {
        color: #fff;
    }

    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    ::-webkit-scrollbar-thumb {
        background: #ddd;
        border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: #bbb;
    }

    #toast {
        visibility: hidden;
        min-width: 250px;
        background-color: #111;
        color: #fff;
        text-align: center;
        border-radius: 4px;
        padding: 16px;
        position: fixed;
        z-index: 100;
        left: 50%;
        bottom: 30px;
        transform: translateX(-50%);
        font-size: 14px;
        opacity: 0;
        transition: opacity 0.3s, bottom 0.3s;
    }

    #toast.show {
        visibility: visible;
        opacity: 1;
        bottom: 50px;
    }
</style>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<header class="pt-32 pb-16 px-6 md:px-12 bg-white">
    <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
        <div class="fade-in-up">
            <h1 class="text-5xl md:text-7xl font-bold tracking-tight text-gray-900 mb-6 leading-[0.9]">
                Tus antojos,<br>
                <span class="text-gray-400">al instante.</span>
            </h1>
            <p class="text-lg text-gray-500 mb-8 max-w-md font-light">Desde chocolates importados hasta esenciales de farmacia. {{ store.name }} te lo lleva en minutos.</p>
            <div class="flex gap-4">
                <a href="{{ store.products_url }}" class="btn-primary bg-black text-white px-8 py-4 rounded-full text-sm font-bold tracking-widest z-10 inline-flex items-center">
                    VER PRODUCTOS
                </a>
                <a href="{{ store.products_url }}" class="px-8 py-4 rounded-full text-sm font-bold tracking-widest border border-gray-200 hover:border-black transition-colors inline-flex items-center">
                    OFERTAS
                </a>
            </div>
        </div>
        <div class="relative h-[400px] md:h-[500px] bg-gray-50 rounded-3xl overflow-hidden fade-in-up delay-200 group">
            <img src="{{ 'images/TendaNiceto_1080x1080px.jpg' | static_url }}" alt="{{ store.name }}" class="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105">
            <div class="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent"></div>
        </div>
    </div>
</header>

<section class="py-16 px-6 bg-[#FAFAFA]">
    <div class="max-w-7xl mx-auto">
        <h2 class="text-2xl font-bold mb-8 tracking-tight">Categorías</h2>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
            {% for category in categories | slice(0, 6) %}
                {% set icon_name = category_icon_map[category.name] | default('shopping-basket') %}
                <a href="{{ category.url }}" class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:border-black transition-all duration-300 cursor-pointer flex flex-col items-center justify-center gap-3 group">
                    <div class="p-3 bg-gray-50 rounded-full group-hover:bg-black group-hover:text-white transition-colors duration-300">
                        <i data-lucide="{{ icon_name }}" class="w-6 h-6"></i>
                    </div>
                    <span class="text-sm font-medium text-gray-700 group-hover:text-black">{{ category.name }}</span>
                </a>
            {% endfor %}
        </div>
    </div>
</section>

<section class="py-20 px-6 bg-white">
    <div class="max-w-7xl mx-auto">
        <div class="flex justify-between items-end mb-12 fade-in-up">
            <div>
                <h2 class="text-3xl font-bold tracking-tight mb-2">Destacados</h2>
                <p class="text-gray-500 text-sm">Lo mejor de la semana seleccionado para vos.</p>
            </div>
            <a href="{{ store.products_url }}" class="text-sm font-bold border-b-2 border-transparent hover:border-black transition-all pb-1">Ver todo</a>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {% for product in featured_products | slice(0, 8) %}
                <div class="product-card bg-white rounded-3xl p-4 border border-gray-100 cursor-pointer flex flex-col h-full fade-in-up">
                    <div class="relative aspect-square mb-4 bg-gray-50 rounded-2xl overflow-hidden group">
                        <a href="{{ product.url }}" class="absolute inset-0">
                            <img src="{{ product.featured_image | product_image_url('large') }}" alt="{{ product.name }}" class="w-full h-full object-cover mix-blend-multiply group-hover:scale-110 transition-transform duration-500">
                        </a>
                        {% if product.available and product.display_price %}
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                                <button type="submit" data-product-name="{{ product.name }}" class="js-niceto-add absolute bottom-3 right-3 bg-black text-white w-10 h-10 rounded-full flex items-center justify-center shadow-lg transform translate-y-12 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 hover:scale-110" aria-label="Agregar {{ product.name }}">
                                    <i data-lucide="plus" class="w-5 h-5"></i>
                                </button>
                            </form>
                        {% endif %}
                    </div>
                    <div class="mt-auto">
                        {% if product.category %}
                            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">{{ product.category.name }}</p>
                        {% endif %}
                        <h3 class="text-sm font-semibold text-gray-900 leading-tight mb-2 min-h-[40px]">
                            <a href="{{ product.url }}" class="hover:underline">{{ product.name }}</a>
                        </h3>
                        {% if product.display_price %}
                            <p class="text-base font-bold text-black">{{ product.price | money }}</p>
                        {% endif %}
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
</section>

<section class="py-20 px-6">
    <div class="max-w-7xl mx-auto bg-black text-white rounded-[2rem] overflow-hidden relative fade-in-up">
        <div class="absolute top-0 right-0 w-64 h-64 bg-gray-800 rounded-full blur-[100px] opacity-50 pointer-events-none"></div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 p-12 md:p-20 items-center relative z-10">
            <div>
                <span class="text-xs font-bold tracking-[0.2em] text-gray-400 uppercase mb-4 block">Trending</span>
                <h2 class="text-4xl md:text-5xl font-bold tracking-tight mb-6 !text-white">Combo Cine en Casa</h2>
                <p class="text-gray-400 text-lg mb-8 font-light">Llevate 2 Coca-Cola 1.5L + Lays Clásicas + Chocolate Block con un 20% OFF.</p>
                <a href="{{ store.products_url }}" class="bg-white text-black px-8 py-3 rounded-full font-bold tracking-wide hover:bg-gray-200 transition-colors inline-flex items-center">
                    VER COMBOS
                </a>
            </div>
            <div class="flex justify-center">
                <img src="https://images.unsplash.com/photo-1527960471264-932f39eb5846?q=80&w=1000&auto=format&fit=crop" alt="Snacks" class="rounded-2xl shadow-2xl rotate-3 hover:rotate-0 transition-transform duration-500 w-3/4 object-cover grayscale-[20%]">
            </div>
        </div>
    </div>
</section>

<section class="py-16 border-t border-gray-100 bg-white">
    <div class="max-w-7xl mx-auto px-6">
        <p class="text-center text-xs font-bold text-gray-400 uppercase tracking-widest mb-10">Nuestros Partners</p>
        {% if settings.brands and settings.brands is not empty %}
            <div class="relative">
                <div class="js-swiper-brands swiper-container py-4" data-brands-autoplay="2200" data-brands-speed="650" data-brands-gap="28" data-brands-mobile="2.6" data-brands-tablet="4" data-brands-desktop="5" data-brands-wide="6">
                    <div class="swiper-wrapper items-center">
                        {% for brand in settings.brands %}
                            {% set brand_title = brand.title | default('Partner #' ~ loop.index) %}
                            <div class="swiper-slide flex justify-center">
                                <div class="w-28 h-28 rounded-full border border-gray-200 shadow-sm bg-white/80 flex items-center justify-center overflow-hidden">
                                    {% if brand.image %}
                                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ brand.image | static_url | settings_image_url('large') }}" class="lazyload w-16 h-16 object-contain" alt="{{ brand_title }}">
                                    {% else %}
                                        <span class="text-xs font-semibold text-gray-600 text-center px-3 leading-tight">{{ brand_title }}</span>
                                    {% endif %}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
                <div class="hidden md:flex absolute inset-y-0 left-0 items-center pointer-events-none">
                    <button type="button" class="js-swiper-brands-prev pointer-events-auto w-10 h-10 rounded-full bg-white border border-gray-200 shadow text-gray-700 flex items-center justify-center">
                        <i data-lucide="chevron-left" class="w-5 h-5"></i>
                    </button>
                </div>
                <div class="hidden md:flex absolute inset-y-0 right-0 items-center pointer-events-none">
                    <button type="button" class="js-swiper-brands-next pointer-events-auto w-10 h-10 rounded-full bg-white border border-gray-200 shadow text-gray-700 flex items-center justify-center">
                        <i data-lucide="chevron-right" class="w-5 h-5"></i>
                    </button>
                </div>
            </div>
        {% else %}
            <div class="flex flex-wrap justify-center gap-12 md:gap-20 opacity-40 grayscale">
                <span class="text-xl font-bold tracking-tighter">COCA-COLA</span>
                <span class="text-xl font-bold tracking-tighter">MILKA</span>
                <span class="text-xl font-bold tracking-tighter">LAY'S</span>
                <span class="text-xl font-bold tracking-tighter">FERNET BRANCA</span>
                <span class="text-xl font-bold tracking-tighter">HEINEKEN</span>
            </div>
        {% endif %}
    </div>
</section>

<div id="toast">Producto agregado al carrito</div>

<script>
    lucide.createIcons();

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

    window.addEventListener('scroll', () => {
        const nav = document.getElementById('navbar');
        if (window.scrollY > 50) {
            nav.classList.add('shadow-sm');
            nav.classList.replace('py-4', 'py-3');
        } else {
            nav.classList.remove('shadow-sm');
            nav.classList.replace('py-3', 'py-4');
        }
    });
</script>
