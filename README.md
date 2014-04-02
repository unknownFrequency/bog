Sample application for developing slides for GMU Rails course.

Steps:

* Clone the repository
* Run `rake db:setup` in order to create your database and populate it with the seed data
* Run `rails server` (make sure you aren't running another server, or run on a different port, e.g. `rails s --port 3500`
* Navigate to http://localhost:3000 (assuming you ran it on the default port 3000)

Also note that we've incorporated Twitter Bootstrap ( http://getbootstrap.com ) for CSS layout and styling. We also have a custom form helper (`bootstrap_form_field`) which does some nice styling during form validation. In the Gemfile, you'll see that we added the 'bootstrap-sass' Gem which lets you write Sass instead of plain CSS for Bootstrap.