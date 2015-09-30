class Setting < ActiveRecord::Base
  self.inheritance_column = nil

  validates_presence_of :key,  on: :create
  validates_presence_of :type, on: :create

  validates_format_of :key, with: /\w+/, on: :create
  validates_format_of :type, with: \
    /\A(STRING|INTEGER|TEXT|BOOLEAN|PASSWORD|ENUM\(.*\))\z/i \
    , on: :create

  def self.method_missing(key, *value)
    setting_key = key.to_s.match(/^(\w+)\=?$/)[1]
    setting_set = !key.to_s.match(/\=$/).nil?

    setting = super(:find_by_key, setting_key)

    if setting.nil?
      super
    elsif setting_set
      setting.value = value.first.to_json
      setting.save
      return value.first
    else
      return setting.value
    end
  end

  def human_key
    key.gsub(/-/, '_').split('_').collect(&:capitalize).join(' ') rescue "null"
  end

  def human_value
    value.to_s rescue "null"
  end

  def value
    JSON.parse(super)['value'] rescue nil
  end

  def self.by_group
    list = Hash.new

    all.each do |s|
      s.group.nil? && s.group = "Other"
      list[s.group].push(s) rescue list[s.group] = [s]
    end

    return list
  end
end
