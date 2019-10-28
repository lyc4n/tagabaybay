require "test_helper"

class TagabaybayTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tagabaybay::VERSION
  end

  def test_it_converts_properly
    assert_equal(Tagabaybay::Transliterator.process("Pilipino"), "ᜉᜒᜎᜒᜉᜒᜈᜓ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("masa"), "ᜋᜐ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("puso"), "ᜉᜓᜐᜓ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("banga"), "ᜊᜅ", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("habang"), "ᜑᜊᜅ᜔", "Wrong output")
    assert_equal(Tagabaybay::Transliterator.process("mahal kita"), "ᜋᜑᜎ᜔ ᜃᜒᜆ", "Wrong output")
  end
end
