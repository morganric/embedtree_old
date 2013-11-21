module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  
	require 'embedly'
  require 'json'

  def associate_tags
    
    require 'nokogiri'
    require 'open-uri'
    require 'open_uri_redirections'

    @post_url = @post.url.sub(/^https?\:\/\//, '')
    @post_url = "http://" + @post_url
  
    @open_url = open(@post_url).read
    @doc = Nokogiri::HTML(@open_url)

    unless @doc.css('meta[name="keywords"], a[rel="tag"][itemprop="keywords"]').to_a == [] || @doc == nil
      @post_tags = @doc.css('meta[name="keywords"], a[rel="tag"][itemprop="keywords"]')[0]['content'].split(",")

      @post_tags.each do |tag|
        @post.tag_list << tag
      end
    end

  end

  def embedly(url)

    embedly_api = Embedly::API.new :key => 'd30e91b2207a40469be014c739c2ddb3', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.oembed :url => url
    @post.image =  obj[0].thumbnail_url
    @post.embed_code = obj[0].html
    @post.title = obj[0].title
    @post.description = obj[0].description
    associate_tags
   
    @type = Type.find_or_create_by_name(obj[0].type)
    @provider = Provider.find_or_create_by_name_and_url(obj[0].provider_name, obj[0].provider_url)
    @author = Author.find_or_create_by_name_and_url(obj[0].author_name, obj[0].author_url)


  end

  def post_count(post)
      UserPost.where(:post_id => post).count
  end

  def posted(user,post)
    if UserPost.where(:user_id => user.id, :post_id => post.id) != []
      return true
    else
      return false
    end
  end

end
