# Inspinia-helpers
Tools to use the Inspinia Theme with a Rails App
https://wrapbootstrap.com/theme/inspinia-responsive-admin-theme-WB0R5L90S

## simple_navigation Renderer 
https://github.com/codeplant/simple-navigation

1. Create a folder in _app/navigation_renderers_
2. Create your renderer and put it in there (e.g. _my_custom_renderer.rb_)
3. Add it to the load path in _config/application.rb_ (Rails 3 and 4) or _config/environment.rb_ (Rails 2)
4. Tell simple-navigation about your renderer in an initializer file, like _config/initializers/simple_navigation.rb_:

``` ruby
SimpleNavigation.register_renderer inspinia: Inspinia
SimpleNavigation.register_renderer inspinia_breadcrumb: InspiniaBreadcrumb
```

Then you can use the renderer in the render_navigation call:

``` haml
#navigation= render_navigation(expand_all: true, renderer: :inspinia)
```

Or you can also use it without registering, just specify your class:

``` haml
#navigation= render_navigation(expand_all: true, renderer: Inspinia)
```

## Helpers
based on the bootstrap helpers project http://fullscreen.github.io/bh/#overview
