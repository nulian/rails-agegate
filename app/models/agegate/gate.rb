module Agegate
  class Gate
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    
    attr_accessor :birthday

    validates_presence_of :birthday
    
    def initialize(attributes = {})
      send("birthday=", convert_date(attributes, :birthday))
    end
    
    def persisted?
      false
    end

    def gate_pass?
      if birthday.nil?
        false
      else
        (birthday + Rails.application.config.agegate.min_age.years) < Date.today
      end
    end

  private
 
    def convert_date(hash, date_symbol_or_string)
      attribute = date_symbol_or_string.to_s
      if hash.has_value?('')
        nil
      else
        begin
          Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i)
        rescue
          nil
        end
      end
    end

  end
end
