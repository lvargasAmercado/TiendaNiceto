{% set primary_navigation = navigation | slice(0, 4) %}
<div class="nav-desktop">
    <ul class="js-nav-desktop-list nav-desktop-list" data-store="navigation" data-component="menu">
        <span class="js-nav-desktop-list-arrow js-nav-desktop-list-arrow-left nav-desktop-list-arrow nav-desktop-list-arrow-left disable" style="display: none">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</span>
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'megamenu' : true, 'navigation': primary_navigation } %}
        <span class="js-nav-desktop-list-arrow js-nav-desktop-list-arrow-right nav-desktop-list-arrow nav-desktop-list-arrow-right" style="display: none">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</span>
    </ul>
</div>
