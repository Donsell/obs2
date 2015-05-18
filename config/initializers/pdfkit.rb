# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.wkhtmltopdf = "C:\\wkhtmltopdf\\bin\\wkhtmltopdf.exe"
  config.default_options = {
    :page_size => 'letter',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost" 
end