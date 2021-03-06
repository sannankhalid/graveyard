# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( fonts/stylesheet.css)

Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( home.css.scss )
Rails.application.config.assets.precompile += %w( castes.js )
Rails.application.config.assets.precompile += %w( castes.css.scss )
Rails.application.config.assets.precompile += %w( relationships.js )
Rails.application.config.assets.precompile += %w( relationships.css.scss )
Rails.application.config.assets.precompile += %w( identities.js )
Rails.application.config.assets.precompile += %w( identities.css.scss )

Rails.application.config.assets.precompile += %w( graves.js )
Rails.application.config.assets.precompile += %w( graves.css.scss )
Dir.glob("#{Rails.root}/vendor/assets/fonts/**/").each do |path|
  Rails.application.config.assets.paths << path
end