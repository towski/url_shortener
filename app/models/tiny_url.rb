class TinyUrl < ActiveRecord::Base
  validate :valid_url

  after_save :set_tiny_url

  def set_tiny_url
    hashids = Hashids.new(HASH_ID_SALT)
    # bypass validations and callbacks to set the tiny_path with the unique autoincremented id
    new_path = hashids.encode(id)
    self.tiny_path = new_path
    update_column :tiny_path, new_path
  end

  def valid_url
    begin
      uri = URI.parse(url)
      unless uri.kind_of?(URI::HTTP)
        errors.add(:url, "URL doesn't match http(s)://domain")
      end
    rescue URI::InvalidURIError
      errors.add(:url, "Problem handling URL")
    end
  end
end
