module Holidays
  # This file is generated by the Ruby Holiday gem.
  #
  # Definitions loaded: data/dk.yaml, data/common_methods.yaml
  #
  # To use the definitions in the file, load them right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'path/to/dk'
  #
  # More definitions are available at http://code.dunae.ca/holidays.
  module DK # :nodoc:
    DEFINED_REGIONS = [:dk, :dk_]

    HOLIDAYS_BY_MONTH = {
      5 => [{:mday => 1, :name => "Arbejdernes kampdag", :regions => [:dk]},
            {:mday => 5, :type => :informal, :name => "Danmarks befrielse", :regions => [:dk]}],
      0 => [{:function => lambda { |year| easter(year)-49 }, :type => :informal, :name => "Fastelavn", :regions => [:dk]},
            {:function => lambda { |year| easter(year)-7 }, :name => "Palmesøndag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)-3 }, :name => "Skærtorsdag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)-2 }, :name => "Langfredag", :regions => [:dk]},
            {:function => lambda { |year| easter(year) }, :name => "Påskedag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)+1 }, :name => "2. påskedag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)+26 }, :name => "Store Bededag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)+40 }, :name => "Kristi Himmelfartsdag", :regions => [:dk, :dk]},
            {:function => lambda { |year| easter(year)+49 }, :name => "2. Pinsedag", :regions => [:dk]},
            {:function => lambda { |year| easter(year)+50 }, :name => "Pinsedag", :regions => [:dk]}],
      11 => [{:mday => 10, :type => :informal, :name => "Mortensaften", :regions => [:dk]}],
      6 => [{:mday => 5, :name => "Grundlovsdag", :regions => [:dk]},
            {:mday => 15, :type => :informal, :name => "Valdemarsdag og Genforeningsdag", :regions => [:dk]},
            {:mday => 23, :type => :informal, :name => "Sankt Hans aften", :regions => [:dk]}],
      1 => [{:mday => 1, :name => "Nytårsdag", :regions => [:dk]}],
      12 => [{:mday => 13, :type => :informal, :name => "Sankt Lucia", :regions => [:dk]},
            {:mday => 24, :name => "Juleaftensdag", :regions => [:dk]},
            {:mday => 25, :name => "1. juledag", :regions => [:dk]},
            {:mday => 26, :name => "2. juledag", :regions => [:dk_]}],
      4 => [{:mday => 1, :type => :informal, :name => "1. april", :regions => [:dk]},
            {:mday => 9, :type => :informal, :name => "Danmarks besættelse", :regions => [:dk]},
            {:mday => 16, :type => :informal, :name => "Dronningens fødselsdag", :regions => [:dk]}]
    }

# Get the date of Easter in a given year.
#
# +year+ must be a valid Gregorian year.
#
# Returns a Date object.
#--
# from http://snippets.dzone.com/posts/show/765
# TODO: check year to ensure Gregorian
def self.easter(year)
  y = year
  a = y % 19
  b = y / 100
  c = y % 100
  d = b / 4
  e = b % 4
  f = (b + 8) / 25
  g = (b - f + 1) / 3
  h = (19 * a + b - d - g + 15) % 30
  i = c / 4
  k = c % 4
  l = (32 + 2 * e + 2 * i - h - k) % 7
  m = (a + 11 * h + 22 * l) / 451
  month = (h + l - 7 * m + 114) / 31
  day = ((h + l - 7 * m + 114) % 31) + 1
  Date.civil(year, month, day)
end



  end
end

Holidays.merge_defs(Holidays::DK::DEFINED_REGIONS, Holidays::DK::HOLIDAYS_BY_MONTH)
