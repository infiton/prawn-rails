require "prawn-rails/document"

module PrawnRails
  class Renderer
    def self.call(template)
      %{
        @filename ||= "\#{controller.action_name}.pdf"
        controller.response.headers['Content-Disposition'] = "attachment; filename=\\\"\#{@filename}\\\""

        #{template.source.strip}
      }
    end
  end
end
