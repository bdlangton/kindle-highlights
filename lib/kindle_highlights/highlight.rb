module KindleHighlights
  class Highlight
    attr_accessor :asin, :text, :note, :location

    def self.from_html_elements(book:, html_elements:)
      new(
        asin: book.asin,
        text: html_elements.children.search("div.kp-notebook-highlight").first.text.squish,
        note: html_elements.children.search("div.kp-notebook-note span#note").first.text.squish,
        location: html_elements.children.search("input#kp-annotation-location").first.attributes["value"].value,
      )
    end

    def initialize(asin:, text:, note:, location:)
      @asin = asin
      @text = text
      @note = note
      @location = location
    end

    def to_s
      text
    end
  end
end
