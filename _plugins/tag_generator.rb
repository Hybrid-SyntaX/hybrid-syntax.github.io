require_relative 'base_generator.rb'
module Jekyll

  class TagPageGenerator < Generator
    #safe true

    def initialize(meta_name)
      @meta_name="tag"
      @plural_meta_name="tags"
    end



    def generate(site)
      if site.layouts.key? "#{@meta_name}_index"
        dir = site.config["#{@meta_name}_dir"] || "#{@meta_name}"

        site.send("#@plural_meta_name").each_key do |meta_value|
          meta_value_slug=meta_value.gsub(" ","-")

          for lang in site.data['languages']
            if lang[1]['default']==false
              #dir="#{lang[0]}/#{dir}"
            end
            if site.config['category_inc_ext'] == true
              site.pages << BasePage.new(site, site.source, File.join("#{lang[0]}/#{dir}"), @meta_name, meta_value_slug,lang[0])
            else
              site.pages << BasePage.new(site, site.source, File.join("#{lang[0]}/#{dir}", meta_value_slug), @meta_name, meta_value_slug,lang[0])
            end
          end

        end
      end
    end
  end

end
