Typus.setup do |config|

  # Application name.
  config.admin_title = "Make a Scene"
  # config.admin_sub_title = ""

  # When mailer_sender is set, password recover is enabled. This email
  # address will be used in Admin::Mailer.
  # config.mailer_sender = "admin@example.com"

  # Define file attachment settings.
  config.file_preview = :big
  config.file_thumbnail = :small

  # Authentication: +:none+, +:http_basic+
  # Run `rails g typus:migration` if you need an advanced authentication system.
  config.authentication = :session

  # Define username and password for +:http_basic+ authentication
  # config.username = "admin"
  # config.password = "columbia"

  # Define available languages on the admin interface.
  # config.available_locales = [:en]
  config.user_class_name = "AdminUser"
end
