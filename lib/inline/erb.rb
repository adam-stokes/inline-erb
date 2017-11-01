require "inline/erb/version"
require 'erb'

module Inline
  module Erb
    class TemplateRenderer
      def self.empty_binding
        binding
      end

      def self.render(template_content, locals = {})
        b = empty_binding
        locals.each { |k, v| b.local_variable_set(k, v) }
        ERB.new(template_content).result(b)
      end
    end

    # Reads from a embedded template
    #
    # @param src String - The data found after __END__
    # @param context Hash - variables to pass into template
    # @return Rendered Template
    #
    # @example
    #     inline_template('vhost.conf',
    #                     server_name: "example.com")
    #
    #     __END__
    #     @@ vhost.conf
    #     server { name <%= server_name %> }
    def inline_template(name, **context)
      templates = {}
      begin
        app, data = File.read(caller.first.split(":").first).split("__END__", 2)
      rescue Errno::ENOENT
        app, data = nil
      end

      data.strip!
      if data
        template = nil
        data.each_line do |line|
          if line =~ /^@@\s*(.*\S)\s*$/
            template = String.new
            templates[$1.to_s] = template
          elsif
            template << line
          end
        end

        TemplateRenderer.render(templates[name], context)
      end
    end
    module_function :inline_template

  end
end
