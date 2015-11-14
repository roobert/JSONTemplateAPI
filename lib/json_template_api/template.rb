#!/usr/bin/env ruby
#encoding=utf-8

require 'erubis'

module JSONTemplateAPI
  module Template
    def self.write(template: template, file: file, params: params)
      File.open(File.join(file), 'w+') do |file|
        @output = Erubis::Eruby.new(File.read(template)).result(binding())
        file.write @output
      end

      @output
    end
  end
end
