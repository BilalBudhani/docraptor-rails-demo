class InvoicesController < ApplicationController

  def show
    docraptor = DocRaptor::DocApi.new
    resp = docraptor.create_doc(
      test: true,
      document_content: render_to_string,
      name: "invoice-001.pdf",
      document_type: "pdf",
      prince_options: {
        media: "screen"
      }
    )
    send_data resp, filename: "invoice-001.pdf", type: "application/pdf"
  end
end