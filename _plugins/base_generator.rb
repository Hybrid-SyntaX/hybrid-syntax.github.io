module Jekyll
  class BasePage < Page
    def initialize(site, base, dir, meta_name,meta_value,lang)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "#{meta_name}_index.html")
      self.data[meta_name] = meta_value

      self.data["lang"] = lang
      self.data["page_name"] = meta_value

      puts @meta_name
      meta_title_prefix = site.config["#{meta_name}_title_prefix"] || "#{meta_name}"
      meta_value_title=meta_value.split('/').last.gsub('-',' ')
      meta_value_title=site.data['specialcase'][meta_value_title] || meta_value_title.capitalize
      self.data['title'] =  "#{meta_value_title} #{meta_name}"
    end
  end





end
