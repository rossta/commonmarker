# frozen_string_literal: true

require "test_helper"

class TestFootnotes < Minitest::Test
  def test_to_html
    md = <<~MARKDOWN
      # footnotes
      Let's render some footnotes[^1]

      [^1]: This is a footnote
    MARKDOWN
    expected = <<~HTML
      <h1>footnotes</h1>
      <p>Let's render some footnotes<sup class="footnote-ref"><a href="#fn-1" id="fnref-1" data-footnote-ref>1</a></sup></p>
      <section class="footnotes" data-footnotes>
      <ol>
      <li id="fn-1">
      <p>This is a footnote <a href="#fnref-1" class="footnote-backref" data-footnote-backref aria-label="Back to content">↩</a></p>
      </li>
      </ol>
      </section>
    HTML

    assert_equal(expected, Commonmarker.to_html(md, options: { extension: { footnotes: true } }))
  end
end
