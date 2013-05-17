module Features
  module DateHelpers
    def select_birthday day, month, year
      base = "birthday"
      select day.to_s,   from: "gate_#{base}_3i"
      select month.to_s, from: "gate_#{base}_2i"
      select year.to_s,  from: "gate_#{base}_1i"
    end
  end
end
