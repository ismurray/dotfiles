# frozen_string_literal: true

require 'pp'

# Custom colorization for output - One Dark Pro theme
class ColorizedPrettyPrint
  # One Dark Pro color palette
  COLORS = {
    reset:        "\e[0m",
    bold:         "\e[1m",
    # One Dark Pro specific colors
    chalky:       "\e[38;5;215m",  # #e5c07b - Yellow/Orange for classes
    coral:        "\e[38;5;204m",  # #e06c75 - Red/Pink for symbols/keys
    cyan:         "\e[38;5;80m",   # #56b6c2 - Cyan for numbers
    green:        "\e[38;5;114m",  # #98c379 - Green for strings
    purple:       "\e[38;5;176m",  # #c678dd - Purple for constants/booleans
    malibu:       "\e[38;5;74m",   # #61afef - Blue for methods
    whiskey:      "\e[38;5;209m",  # #d19a66 - Orange for parameters
    gray:         "\e[38;5;145m",  # #abb2bf - Gray for punctuation
    white:        "\e[38;5;255m",  # White for text
    dark_gray:    "\e[38;5;59m",   # #5c6370 - Comments/nil
  }

  def self.format_value(value)
    case value
    when NilClass
      "#{COLORS[:dark_gray]}nil#{COLORS[:reset]}"
    when TrueClass
      "#{COLORS[:whiskey]}true#{COLORS[:reset]}"
    when FalseClass
      "#{COLORS[:whiskey]}false#{COLORS[:reset]}"
    when String
      "#{COLORS[:green]}#{value.inspect}#{COLORS[:reset]}"
    when Symbol
      "#{COLORS[:cyan]}#{value.inspect}#{COLORS[:reset]}"
    when Numeric
      "#{COLORS[:whiskey]}#{value}#{COLORS[:reset]}"
    when Time, Date, DateTime
      "#{COLORS[:cyan]}#{value}#{COLORS[:reset]}"
    when IPAddr
      "#{COLORS[:purple]}#{value}#{COLORS[:reset]}"
    when Hash
      "#{COLORS[:gray]}#{value.inspect}#{COLORS[:reset]}"
    else
      value.inspect
    end
  end
end

# Configure Pry printing
Pry.config.print = proc do |output, value, _pry_|
  if defined?(ActiveRecord) && value.is_a?(ActiveRecord::Base)
    # Format ActiveRecord objects with One Dark Pro colors
    output.puts "#{ColorizedPrettyPrint::COLORS[:chalky]}#<#{value.class}#{ColorizedPrettyPrint::COLORS[:reset]} #{ColorizedPrettyPrint::COLORS[:coral]}id#{ColorizedPrettyPrint::COLORS[:gray]}:#{ColorizedPrettyPrint::COLORS[:reset]} #{ColorizedPrettyPrint::COLORS[:whiskey]}#{value.id}#{ColorizedPrettyPrint::COLORS[:gray]},#{ColorizedPrettyPrint::COLORS[:reset]}"
    
    value.attributes.each do |key, val|
      formatted_value = ColorizedPrettyPrint.format_value(val)
      output.puts "  #{ColorizedPrettyPrint::COLORS[:coral]}#{key}#{ColorizedPrettyPrint::COLORS[:gray]}:#{ColorizedPrettyPrint::COLORS[:reset]} #{formatted_value}#{ColorizedPrettyPrint::COLORS[:gray]},#{ColorizedPrettyPrint::COLORS[:reset]}"
    end
    
    output.puts "#{ColorizedPrettyPrint::COLORS[:gray]}>#{ColorizedPrettyPrint::COLORS[:reset]}"
  elsif defined?(ActiveRecord) && value.is_a?(ActiveRecord::Relation)
    PP.pp(value.to_a, output)
  else
    PP.pp(value, output)
  end
end

# Enable color output
Pry.config.color = true

# Set prompt to show Rails environment with One Dark Pro color
if defined?(Rails)
  Pry.config.prompt_name = "#{ColorizedPrettyPrint::COLORS[:purple]}#{Rails.env}#{ColorizedPrettyPrint::COLORS[:reset]}"
end
