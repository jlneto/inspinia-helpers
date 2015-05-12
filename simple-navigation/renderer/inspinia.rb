module SimpleNavigation
  module Renderer
    class Inspinia < SimpleNavigation::Renderer::Base
      def render(item_container)
        if skip_if_empty? && item_container.empty?
          ''
        else
          tag = options[:ordered] ? :ol : :ul
          content = list_content(item_container)
          style = nil   #item_container.selected? ? nil : nil
          content_tag(tag, content, item_container.dom_attributes.merge(style: style))
        end
      end

      private

      def list_content(item_container)
        item_container.items.map { |item|
          li_options = item.html_options.except(*[:link, :icon])
          item_options = item.html_options
          li_content = tag_for(item, item_options)
          classes = item.selected? ? 'active' : nil
          if include_sub_navigation?(item)
            li_content << render_sub_navigation_for(item)
          end
          content_tag(:li, li_content, li_options.merge(class: classes))
        }.join
      end

      def tag_for(item, options = {})
        icon = options.delete(:icon)
        if icon.nil? and include_sub_navigation?(item)
          icon = 'folder-o'
        end

        if suppress_link?(item)
          content_tag('span', item.name, link_options_for(item).except(:method), class: 'id1')
        else

          if icon.nil?
            hicon = ''
            hspan =  item.name
          else
            hicon = content_tag('i', '', { :class => "fa fa-#{icon}" }) if icon
            hspan = content_tag('span', item.name, { :class => 'nav-label idl'  })
          end

          if include_sub_navigation?(item)
            htoggle = content_tag('span', '', { :class => 'fa arrow id3' })
            toggle_class = ''
          else
            htoggle = ''
            toggle_class = ''
          end
          li_text = "#{hicon}#{hspan}#{htoggle}"
          link_to(li_text.html_safe, item.url, options.except(:icon,:id).merge(class: toggle_class))
        end
      end

    end
  end
end