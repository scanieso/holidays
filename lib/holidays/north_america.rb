module Holidays
  # This file is generated by the Ruby Holiday gem.
  #
  # Definitions loaded: data/ca.yaml, data/common_methods.yaml, data/north_america_informal.yaml, data/mx.yaml, data/us.yaml
  #
  # To use the definitions in the file, load them right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'path/to/north_america'
  #
  # More definitions are available at http://code.dunae.ca/holidays.
  module NORTH_AMERICA # :nodoc:
    DEFINED_REGIONS = [:ca, :ca_qc, :us, :mx, :ca_nf, :ca_nt, :ca_nu, :ca_ab, :ca_on, :ca_sk, :ca_mb, :ca_bc, :ca_ns, :ca_yk]

    HOLIDAYS_BY_MONTH = {
      5 => [{:function => lambda { |year| ca_victoria_day(year) }, :name => "Victoria Day", :regions => [:ca]},
            {:function => lambda { |year| ca_victoria_day(year) }, :name => "National Patriotes Day", :regions => [:ca_qc]},
            {:wday => 0, :week => 3, :type => :informal, :name => "Father's Day", :regions => [:us, :ca]},
            {:mday => 1, :name => "D\xC3\xADa del Trabajo", :regions => [:mx]},
            {:mday => 5, :name => "La Batalla de Puebla", :regions => [:mx]},
            {:wday => 1, :week => -1, :name => "Memorial Day", :regions => [:us]}],
      0 => [{:function => lambda { |year| easter(year)-2 }, :name => "Good Friday", :regions => [:ca, :us, :mx]},
            {:function => lambda { |year| easter(year)+1 }, :name => "Easter Monday", :regions => [:ca_qc]},
            {:function => lambda { |year| easter(year)-3 }, :name => "Good Thursday", :regions => [:mx]},
            {:function => lambda { |year| easter(year) }, :name => "Easter Sunday", :regions => [:mx]}],
      11 => [{:mday => 11, :name => "Rememberance Day", :regions => [:ca]},
            {:mday => 2, :name => "Dia de Muertos", :regions => [:mx]},
            {:wday => 1, :week => 3, :name => "D\xC3\xADa de la Revoluci\xC3\xB3n", :regions => [:mx]},
            {:mday => 11, :name => "Veterans Day", :regions => [:us]},
            {:wday => 4, :week => 4, :name => "Thanksgiving Day", :regions => [:us]}],
      6 => [{:mday => 24, :name => "Discovery Day", :regions => [:ca_nf]},
            {:mday => 24, :name => "Fête Nationale", :regions => [:ca_qc]},
            {:mday => 21, :name => "National Aboriginal Day", :regions => [:ca_nt]}],
      1 => [{:mday => 1, :name => "New Year's Day", :regions => [:ca, :mx, :us]},
            {:mday => 2, :name => "New Year's", :regions => [:ca_qc]},
            {:mday => 2, :name => "New Year's Day", :regions => [:mx]},
            {:wday => 1, :week => 3, :name => "Martin Luther King, Jr. Day", :regions => [:us]},
            {:function => lambda { |year| us_inauguration_day(year) }, :name => "Inauguration Day", :regions => [:us]}],
      12 => [{:mday => 25, :name => "Christmas Day", :regions => [:ca, :mx, :us]},
            {:mday => 26, :name => "Boxing Day", :regions => [:ca]},
            {:mday => 12, :name => "Our Lady of Guadalupe's day", :regions => [:mx]}],
      7 => [{:mday => 1, :name => "Canada Day", :regions => [:ca]},
            {:mday => 12, :name => "Orangemen's Day", :regions => [:ca_nf]},
            {:mday => 9, :name => "Nunavut Day", :regions => [:ca_nu]},
            {:mday => 4, :name => "Independence Day", :regions => [:us]}],
      2 => [{:wday => 1, :week => 3, :name => "Family Day", :regions => [:ca_ab, :ca_on, :ca_sk]},
            {:wday => 1, :week => 3, :name => "Louis Riel Day", :regions => [:ca_mb]},
            {:mday => 2, :type => :informal, :name => "Groundhog Day", :regions => [:us, :ca]},
            {:mday => 14, :type => :informal, :name => "Valentine's Day", :regions => [:us, :ca]},
            {:wday => 1, :week => 1, :name => "D\xC3\xADa de la Constituci\xC3\xB3n", :regions => [:mx]}],
      8 => [{:wday => 1, :week => 1, :name => "BC Day", :regions => [:ca_bc]},
            {:wday => 1, :week => 1, :name => "Saskatchewan Day", :regions => [:ca_sk]},
            {:wday => 1, :week => 1, :name => "Heritage Day", :regions => [:ca_ab]},
            {:wday => 1, :week => 1, :name => "Natal Day", :regions => [:ca_ns]},
            {:wday => 1, :week => 1, :name => "Civic Holiday", :regions => [:ca_on]},
            {:wday => 1, :week => 3, :name => "Discovery Day", :regions => [:ca_yk]}],
      3 => [{:mday => 23, :name => "St. George's Day", :regions => [:ca_nf]},
            {:mday => 17, :type => :informal, :name => "St. Patrick's Day", :regions => [:us, :ca]},
            {:wday => 1, :week => 3, :name => "Natalicio de Benito Ju\xC3\xA1rez", :regions => [:mx]},
            {:wday => 1, :week => 3, :name => "Presidents' Day", :regions => [:us]}],
      9 => [{:wday => 1, :week => 1, :name => "Labour Day", :regions => [:ca]},
            {:mday => 16, :name => "D\xC3\xADa de Independencia", :regions => [:mx]},
            {:wday => 1, :week => 1, :name => "Labor Day", :regions => [:us]}],
      4 => [{:mday => 1, :type => :informal, :name => "April Fool's Day", :regions => [:us, :ca]},
            {:mday => 22, :type => :informal, :name => "Earth Day", :regions => [:us, :ca]}],
      10 => [{:wday => 1, :week => 2, :name => "Thanksgiving", :regions => [:ca]},
            {:mday => 31, :type => :informal, :name => "Halloween", :regions => [:us, :ca]},
            {:wday => 1, :week => 2, :name => "Columbus Day", :regions => [:us]}]
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


# Monday on or before May 24
def self.ca_victoria_day(year)
  date = Date.civil(year,5,24)
  if date.wday > 1
    date -= (date.wday - 1)
  elsif date.wday == 0
    date -= 6
  end
  date
end

# January 20, every fourth year, following Presidential election
def self.us_inauguration_day(year)
  year % 4 == 1 ? 20 : nil
end


  end
end

Holidays.merge_defs(Holidays::NORTH_AMERICA::DEFINED_REGIONS, Holidays::NORTH_AMERICA::HOLIDAYS_BY_MONTH)
