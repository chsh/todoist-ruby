class Todoist::Base
  protected
  def http
    self.class.send :http
  end
  def self.http
    Todoist::HTTP
  end
  def alter_hash(hash)
    hash.each do |key, value|
      iv = "@#{key}"
      instance_variable_set iv, value
      unless self.respond_to? key
        self.class.send :define_method, key do
          instance_variable_get iv
        end
      end
    end
  end
end
