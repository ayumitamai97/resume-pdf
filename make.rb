require "PDFKit"
require "erb"
require "pry"

PDFKit.configure do |config|
  config.wkhtmltopdf = `which wkhtmltopdf`.to_s.strip
  config.default_options = {
    encoding:                "UTF-8",  # エンコーディング
    page_size:               "A4",     # ページのサイズ
    margin_top:              "0.25in", # 余白の設定
    margin_right:            "1in",
    margin_bottom:           "0.25in",
    margin_left:             "1in",
    disable_smart_shrinking: false
  }
end

erb_file = File.open("pdf.html.erb").read
rendered_html = ERB.new(erb_file).result

file = open("RubyPDFExample.pdf","w")
file.puts PDFKit.new(rendered_html).to_pdf
file.close


