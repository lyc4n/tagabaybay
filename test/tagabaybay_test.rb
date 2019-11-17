require "test_helper"

class TagabaybayTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tagabaybay::VERSION
  end

  Tagabaybay::Mapping::ALL.each do |convertible, conversion|
    define_method "test_it_converts_#{convertible}_correctly" do
      assert_equal(Tagabaybay::Transliterator.process(convertible), conversion, "Wrong output")
    end
  end

  def test_it_converts_tagalog_words_properly
    assert_equal(Tagabaybay::Transliterator.process("Pilipino"), "ᜉᜒᜎᜒᜉᜒᜈᜓ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("masa"), "ᜋᜐ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("puso"), "ᜉᜓᜐᜓ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("banga"), "ᜊᜅ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("habang"), "ᜑᜊᜅ᜔", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("mahal kita"), "ᜋᜑᜎ᜔ ᜃᜒᜆ", "Wrong output")
  end

  def test_it_keeps_unknown_values
    assert_equal(Tagabaybay::Transliterator.process("malupit ❤️"), "ᜋᜎᜓᜉᜒᜆ᜔ ❤️", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("pook-sapot"), "ᜉᜓᜂᜃ᜔-ᜐᜉᜓᜆ᜔", "Wrong output")
  end
end
