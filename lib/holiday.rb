require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]


end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash.each do |season, holidays|
    if season.to_s == "winter"
      holidays.each { |holiday, supplies| supplies << supply }
    end
  end

  holiday_supplies

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
      holidays.each do |holiday, supplies|
        if holiday.to_s == "memorial_day"
        supplies << supply
      end
    end
  end

  holiday_supplies
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  # remember to return the updated hash
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holidays|
    if season.to_s == "winter"
      winter_supplies.push(holidays.values)
    end
  end

  winter_supplies.flatten

end

def capitalize_words(word, split_by)
  if word.split(split_by).length  > 1
    words = word.split(split_by).map { |w| w.capitalize}
    return "#{words.join(" ")}"
  else
    return word == "BBQ" ? "#{word}" : "#{word.capitalize}"
  end
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize}:"

    holidays.each do |holiday, supplies|
      holiday_fixed = capitalize_words(holiday.to_s, "_")

      supply_fixed = supplies.map { |supply| capitalize_words(supply.to_s, " ")}
      puts "  #{holiday_fixed}: #{supply_fixed.join(", ")}"

    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  result = []
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        result << holiday
      end
    end
  end
  result

end
