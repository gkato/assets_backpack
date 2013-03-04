module AssetsBackpack

  class Engine < ::Rails::Engine
    isolate_namespace AssetsBackpack

    config.after_initialize do
      include AssetsBackpack

      override_javascript_asset_tag
    end
  end

end
