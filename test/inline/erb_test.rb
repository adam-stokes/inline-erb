require "test_helper"

class Inline::ErbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Inline::Erb::VERSION
  end

  def test_render_context
    tpl = Inline::Erb.render('tpl_test', name: 'john')
    assert_match tpl.strip(), 'Hi, john'
  end
end

__END__

@@ tpl_test

Hi, <%= name %>
