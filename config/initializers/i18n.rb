
# Enable locale fallbacks for I18n (makes lookups for any locale fall back to
# the I18n.default_locale when a translation can not be found)
# src: http://stackoverflow.com/a/7621851
Rails.application.config.i18n.fallbacks = true
# tell the default locale loading mechanism to look in sub-directories
Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
