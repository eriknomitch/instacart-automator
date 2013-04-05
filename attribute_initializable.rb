# ------------------------------------------------
# CLASS->ATTRIBUTE-INITIALIZABLE -----------------
# ------------------------------------------------
class AttributeInitializable
  def initialize(attributes={})
    attributes.each do |key, value|
      if self.respond_to? "#{key}="
        self.send "#{key}=", value
      else
        warn "Warning: #{self} not responding to #{key}="
      end
    end
  end
end
