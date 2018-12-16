# Namespaced Routes

## Objectives

1. Understand the use of `scope` and `namespace` in `routes.rb`.
2. Create a module scoped controller.

## Lesson

We're going to explore different ways of routing things in our blog application
to help us organize and group certain routes and controllers more logically.

#### Blog Stats

1.) We decide that we want to keep track of some basic blog statistics, such as how
many posts and authors we have. We start by creating a `stats_controller.rb`
with an `index` action and corresponding view.

We can't actually browse to it yet because we need to set up a route. Let's add it to `routes.rb`:
It's really just for blog admins, and we want to set up a URL scheme to segregate admin things into their own logical space.

```ruby


# config/routes.rb

get '/admin/stats', to: 'stats#index'
```
OR as you add more routes it is easier to use resources

```ruby
# config\routes.rb

scope '/admin' do
  resources :stats, only: [:index]
end
```

Now we can reload `/admin/stats`, and it still works. Notice our new route is
resourced. Now that we don't have to manually prefix `/admin`, we can go back to
using resourced routes within the `/admin` scope.

If you run `rake routes`, you'll see that the new `/admin/stats` helpers are
`stats_path` and `stats_url`.

#### Scoping With Modules

Scoping works nicely to group our URLs together logically, but what happens when
we have a bunch of controllers that are handling admin functions?

We want to group all our admin controllers logically to make it easier to
maintain and add to the app, so let's add an `/admin` directory under
`/controllers` where all the admin controllers will go:

`mkdir app/controllers/admin`

Now let's move our `stats_controller.rb` into the `/admin` folder.

When you create a new folder under `/controllers`, Rails will automatically pick
that up as a `module` and expect you to namespace the controller accordingly. We
need to modify our `admin/stats_controller.rb` to look like this:

```ruby
# controllers/admin/stats_controller.rb

class Admin::StatsController < ApplicationController
  def index

    ...

  end
end
```

Now that we have our controller in a module, Rails will expect the views to
match and look in...  

 `/app/views/admin/stats`

**Top-tip:** The `views` folder for a controller module (in this case `/admin`) expects a
subfolder structure that matches the names of the controllers (in this case
`/admin/stats`).

If we try to reload `/admin/stats` now, we will get an error because we need to
tell our routes about our new module.

```ruby
# config/routes.rb

scope '/admin', module: 'admin' do
  resources :stats, only: [:index]
end
```

We're telling `scope` that we want to use `/admin` as a URL prefix, and we're
also letting Rails know that all of the included routes will be handled by
controllers in the `admin` module.

If we reload `/admin/stats`, everything should work just like it did, but now we
are logically organizing our controllers.

#### Namespace

Right now, our route is scoped as `scope '/admin', module: 'admin'`, which is
fine but perhaps a bit less DRY than we'd like.

Fortunately, Rails gives us a shortcut here. When we want to route with a module
_and_ use that module's name as the URL prefix, we can use the `namespace`
method instead of `scope, module`.

```ruby
# config/routes.rb

namespace :admin do
  resources :stats, only: [:index]
end
```

If we reload `/admin/stats`, everything still works, but we've simplified the
declaration of the routes. The `namespace` method makes the assumption that the
path prefix and module name match, saving us some typing.

**Top-tip:** There is one important difference between `scope '/admin', module: 'admin'` and
`namespace :admin`, and it's in the URL helpers. Remember above that using
`scope` gave us a `stats_path` helper. But now that we are using `namespace`,
run `rake routes` again. You'll see that the helper is now prefixed with
`admin_`, so `stats_path` becomes `admin_stats_path`. If you switch from `scope`
to `namespace`, take care to update any URL helpers you have in use!

## Summary

We learned how to organize our URLs by using `scope` to group them with an
`/admin` prefix; how to further organize our controllers using directories and
modules; and how to use `scope, module` or `namespace` in our routes.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/namespaced-routes-reading'>Namespaced Routes</a> on Learn.co and start learning to code for free.</p>
