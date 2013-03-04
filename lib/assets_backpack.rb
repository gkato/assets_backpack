require "assets_backpack/engine"

module AssetsBackpack

  def override_javascript_asset_tag
    ActionView::Helpers::AssetTagHelper::JavascriptIncludeTag.class_eval do
      alias_method :asset_tag_original, :asset_tag
      def asset_tag(source, options)
        local_storage = options["local_storage"]
        return asset_tag_original(source, options) unless local_storage

        js_include = %q{
<script type="text/javascript" src="http://addyosmani.github.com/basket.js/dist/basket.full.min.js"></script>
<script>
  function loadAssetFromStorage(url_asset, checksum){
    var storage = window.localStorage;
    stored_ck = storage.getItem(url_asset);
    if(!stored_ck){
      storage.setItem(url_asset, checksum);
    } else {
      if(checksum != stored_ck) {
        basket.remove(url_asset);
        storage.removeItem(stored_ck);
        storage.setItem(url_asset, checksum);
      }
    }
    basket.require({ url: url_asset, key: url_asset });
  }
</script>
        }
        path = path_to_asset(source).split('?')[0]
        checksum = Digest::MD5.file("#{Rails.public_path}#{path}").hexdigest
        tag = "<script>loadAssetFromStorage('#{path}','#{checksum}');</script>"
        unless @js_code
          @js_code = true
          return "#{js_include}\n#{tag}"
        end
        tag
      end
    end
  end

end
