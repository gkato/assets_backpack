module AssetsBackpack

  class Engine < ::Rails::Engine
    isolate_namespace AssetsBackpack

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end

    config.after_initialize do
      include AssetsBackpack

      override_javascript_asset_tag
    end

  end

end
