class I18nTimeZone < ActiveSupport::TimeZone
  def to_s
    translated_name = I18n.t(name, :scope => :timezones, :default => name)
    "(GMT#{formatted_offset}) #{translated_name}"
  end
end