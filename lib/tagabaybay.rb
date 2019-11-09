require "tagabaybay/version"

module Tagabaybay
  class Error < StandardError; end

  module Mapping
    TRIPLES = {
      "nga" => "ᜅ",
      "ngi" => "ᜅᜒ",
      "nge" => "ᜅᜒ",
      "ngo" => "ᜅᜓ",
      "ngu" => "ᜅᜓ",
    }

    DOUBLES = {
      "ng" => "ᜅ᜔",
      "ka" => "ᜃ",
      "ke" => "ᜃᜒ",
      "ki" => "ᜃᜒ",
      "ko" => "ᜃᜓᜓ",
      "ku" => "ᜃᜓᜓ",
      "ga" => "ᜄ",
      "ge" => "ᜄᜒ",
      "gi" => "ᜄᜒ",
      "go" => "ᜅᜓ",
      "gu" => "ᜅᜓ",
      "ta" => "ᜆ",
      "te" => "ᜆᜒ",
      "ti" => "ᜆᜒ",
      "to" => "ᜆᜓ",
      "tu" => "ᜆᜓ",
      "da" => "ᜇ",
      "de" => "ᜇᜒ",
      "di" => "ᜇᜒ",
      "do" => "ᜇᜓ",
      "du" => "ᜇᜓ",
      "ra" => "ᜇ",
      "re" => "ᜇᜒ",
      "ri" => "ᜇᜒ",
      "ro" => "ᜇᜓ",
      "ru" => "ᜇᜓ",
      "na" => "ᜈ",
      "ne" => "ᜈᜒ",
      "ni" => "ᜈᜒ",
      "no" => "ᜈᜓ",
      "nu" => "ᜈᜓ",
      "pa" => "ᜉ",
      "pe" => "ᜉᜒ",
      "pi" => "ᜉᜒ",
      "po" => "ᜉᜓ",
      "pu" => "ᜉᜓ",
      "ba" => "ᜊ",
      "be" => "ᜊᜒ",
      "bi" => "ᜊᜒ",
      "bo" => "ᜊᜓ",
      "bu" => "ᜊᜓ",
      "ma" => "ᜋ",
      "me" => "ᜋᜒ",
      "mi" => "ᜋᜒ",
      "mo" => "ᜋᜓ",
      "mu" => "ᜋᜓ",
      "ya" => "ᜌ",
      "ye" => "ᜌᜒ",
      "yi" => "ᜌᜒ",
      "yo" => "ᜌᜓ",
      "yu" => "ᜌᜓ",
      "la" => "ᜎ",
      "le" => "ᜎᜒ",
      "li" => "ᜎᜒ",
      "lo" => "ᜎᜓ",
      "lu" => "ᜎᜓ",
      "wa" => "ᜏ",
      "we" => "ᜏᜒ",
      "wi" => "ᜏᜒ",
      "wo" => "ᜏᜓ",
      "wu" => "ᜏᜓ",
      "sa" => "ᜐ",
      "se" => "ᜐᜒ",
      "si" => "ᜐᜒ",
      "so" => "ᜐᜓ",
      "su" => "ᜐᜓ",
      "ha" => "ᜑ",
      "he" => "ᜑᜒ",
      "hi" => "ᜑᜒ",
      "ho" => "ᜑᜓ",
      "hu" => "ᜑᜓ",
    }

    SINGLES = {
      " " => " ",
      "a" => "ᜀ",
      "i" => "ᜁ",
      "e" => "ᜁ",
      "u" => "ᜂ",
      "o" => "ᜂ",

      "k" => "ᜃ᜔",
      "g" => "ᜄ᜔",
      "t" => "ᜆ᜔",
      "d" => "ᜇ᜔",
      "r" => "ᜇ᜔",
      "n" => "ᜈ᜔",
      "p" => "ᜉ᜔",
      "b" => "ᜊ᜔",
      "m" => "ᜋ᜔",
      "y" => "ᜌ᜔",
      "l" => "ᜎ᜔",
      "w" => "ᜏ᜔",
      "s" => "ᜐ᜔",
      "h" => "ᜑ᜔"
    }

    ALL = TRIPLES.merge(DOUBLES).merge(SINGLES)
  end

  class Transliterator
    def self.process(text)
      tagabaybay = Transliterator.new
      tagabaybay.process(text)
    end

    def process(text)
      to_translate = text.dup.downcase
      translated   = ""

      while to_translate.length > 0
       match, converted = find_match(to_translate)
       translated += converted
       to_translate.sub!(match, "")
      end

      translated
    end

    private

    def find_match(text)
      matched = Mapping::ALL.find do |matcher, _baybayin|
        Regexp.new("^#{matcher}") =~ text
      end
      raise "Unable to match mapping for #{text}" unless matched
      matched
    end
  end
end

