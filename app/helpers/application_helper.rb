module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << t('website.name')).join(' - ')
      end
    end
  end
  
  def puts_copyright
    created = 2013
    current_year = Time.zone.now.year
    range = (created == current_year) ? created : "#{created}-#{current_year}"
    t('copyright', scope: 'common', website: t('website.name'), year_range: range)
  end
  
  def table_sort(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    # CSS class needs to be defined for arrowup and arrowdown.
    # Check out: http://railscasts.com/episodes/228-sortable-table-columns
    # The following should work with Twitter Bootstrap
    # link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def distance_of_time_in_words_to_now_with_ago(from_time, include_seconds_or_options = {}) 
    ago = t(:ago, scope: 'datetime.distance_in_words')
    locale = I18n.locale
    locales = [:ja, :ko]
    default_s = "#{distance_of_time_in_words_to_now(from_time, include_seconds_or_options)} #{ago}"
    if locales.include?(locale)
      if(from_time..from_time+60).cover?(Time.zone.now)
        distance_of_time_in_words_to_now(from_time, include_seconds_or_options)
      else
        if locale == :ja
          "#{distance_of_time_in_words_to_now(from_time, include_seconds_or_options)}#{ago}"
        else
          default_s
        end
      end
    else
      default_s
    end
  end
end