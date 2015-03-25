require_relative 'base_generator.rb'
module Jekyll

  class Util
    def self.traverse_categories(categories,level,func)
      if categories != nil
        categories.each_key do |cat|
          if cat != '<nochild>'

          the_thing=level+cat
          func.call(the_thing)
          traverse_categories(categories[cat],level+cat+"/",func)
          end
        end
      end
    end
    def self.find_category_parent(category,categories,level)
      if categories != nil
        categories.each_key do |cat|
          if category != nil and category.downcase==cat.downcase
            return level+cat
          end
          find_category_parent(category,categories[cat],level+cat+"/")
        end
      end
    end
  end



  class RenderCategories < Liquid::Tag

    def initialize(tag_name, lang, tokens)
      super

      @lang=lang.strip
      @text=''

      @cats_array
    end

    def slugify(input)
      return input.gsub(' ','-').downcase
    end

    def traverse_categories(categories,level)
      if categories != nil
        @text=@text+"<ul class='dropdown-menu' role='menu' >"
        categories.each_key do |cat|
          @text=@text+"<li class='menu-item dropdown dropdown-submenu' ><a  class='dropdown-toggle' href='/#{@lang}/category/#{slugify(level+cat)}'>#{cat}</a></li>"

          traverse_categories(categories[cat],slugify(level+cat)+"/")
        end

        @text=@text+"</ul>"
      end
    end
    def render(context)
      traverse_categories(context.registers[:site].data['categories'],'')
      @text
    end
  end


  Liquid::Template.register_tag('render_categories', Jekyll::RenderCategories)



  class CategoryPageGenerator < Generator
    #safe true

    def initialize(meta_name)
      @meta_name='category'

    end


    def create_categories(meta_value)
      if @site.layouts.key? "#{@meta_name}_index"
        #meta_value=shit#level+cat


        dir = @site.config["#{@meta_name}_dir"] || "#{@meta_name}"

        meta_value_slug=meta_value.gsub(" ","-").downcase

        for lang in @site.data['languages']
          if @site.config['category_inc_ext'] == true
            @site.pages << BasePage.new(@site, @site.source, "#{lang[0]}/#{dir}", @meta_name, meta_value_slug,lang[0])
          else
            @site.pages << BasePage.new(@site, @site.source, File.join("#{lang[0]}/#{dir}", meta_value_slug), @meta_name, meta_value_slug,lang[0])
          end
        end
      end
    end



    def generate(site)
        @site=site

        Util.traverse_categories(site.data['categories'] ,'',method(:create_categories))

    end
  end


end
