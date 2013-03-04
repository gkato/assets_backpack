module AssetsBackpack
  module ApplicationHelper

    def stored_javascript_tag(source)
      path = path_to_javascript(source).split('?')[0]
      checksum = Digest::MD5.file("#{Rails.public_path}#{path}").hexdigest
      "<script>loadAssetFromStorage('#{path}','#{checksum}');</script>"
    end

  end
end
