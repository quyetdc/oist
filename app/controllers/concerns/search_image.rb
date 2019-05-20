require 'flickr_fu'

module SearchImage
  def search_image_flickr key_search
    flickr = Flickr.new('./config/flickr.yml')
    imgs = flickr.photos.search(:tags => key_search)
    imgs_flickr = Hash.new
    imgs.each_with_index do |img, index|
      imgs_flickr = imgs_flickr.merge!("img_#{index}" => {url: img.url, views: img.views})
    end
    imgs_flickr = imgs_flickr.values.sort_by{|hsh| -hsh[:views]}
    imgs_flickr = imgs_flickr.first(10)
  end

  def search_image key_search
    Unsplash::Photo.search(key_search)
  end
end
