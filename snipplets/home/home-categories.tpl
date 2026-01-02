{% if settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
    {% set welcome_slide = settings.slider_categories | first %}
    <section class="section-home-welcome position-relative" data-store="home-categories-featured">
        <div class="container">
            <div class="home-welcome-card row align-items-center">
                <div class="col-md-6">
                    <p class="home-welcome-eyebrow text-uppercase font-small">{{ 'Bienvenido a' | translate }} {{ store.name }}</p>
                    <h2 class="home-welcome-title h2">{{ 'Tu tienda de confianza Niceto' | translate }}</h2>
                    <p class="home-welcome-text font-big">{{ 'Encontrá todo lo que necesitás para tu kiosco urbano, con envíos ágiles y atención cercana.' | translate }}</p>
                    <a href="{{ store.products_url }}" class="btn btn-primary btn-big mt-3">{{ 'Explorar productos' | translate }}</a>
                </div>
                <div class="col-md-6">
                    <div class="home-welcome-image">
                        <img 
                            src="{{ 'images/empty-placeholder.png' | static_url }}"
                            data-srcset="{{ welcome_slide.image | static_url | settings_image_url('large') }} 640w, {{ welcome_slide.image | static_url | settings_image_url('original') }} 1024w"
                            class="lazyload"
                            alt="{{ welcome_slide.title ?: store.name }}"
                        />
                        <div class="placeholder-fade"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endif %}
