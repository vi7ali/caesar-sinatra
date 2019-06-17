# frozen_string_literal: true

# Cipher object takes a string and an offset
# and produces an encrypted string using caesar cipher
class Cipher
  attr_reader :str, :offset
  def initialize(**args)
    @str = args[:str]
    @offset = args[:offset]
  end

  def encrypt
    result = ''
    str.each_codepoint do |c|
      if c >= 65 && c <= 90
        result += (65 + ((c - 65 + offset) % 26)).chr
      elsif c >= 97 && c <= 122
        result += (97 + ((c - 97 + offset) % 26)).chr
      else
        result += c.chr
      end
    end
    result
  end
end
