<div class="nav-secondary {% if settings.desktop_nav_colors and settings.header_colors %}py-2 my-1{% else %}pb-3{% endif %}">
	<div class="nav-secondary-inner">
		<ul class="list nav-secondary-list" role="list">
			{% for item in menus[settings.head_secondary_menu] %}
				<li class="secondary-menu-item nav-secondary-item">
					<a class="secondary-menu-link nav-secondary-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
				</li>
			{% endfor %}
		</ul>
	</div>
</div>
