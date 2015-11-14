#!/usr/bin/env ruby
# encoding=utf-8

require 'grape'
require 'json'
require 'yaml'
require_relative 'lib/json_template_api/template'
require_relative 'lib/json_template_api/git'

module JSONTemplateAPI
  class App < Grape::API
    format :json

    helpers do
      def app_root
        @app_root ||= File.dirname(__FILE__)
      end

      def config
        @config ||= YAML.load_file(File.join(app_root, 'config/config.yaml'))
      end
    end

    resource :template do
      desc 'create a file from template with context from posted JSON'

      params do
        requires :template, type: String,  desc: 'template'
        requires :filename, type: String,  desc: 'filename'
      end

      post :add do
        template = File.join(app_root, config['template_dir'], params['template'])
        file     = File.join(app_root, config['data_dir'],     params['filename'])

        output = JSONTemplateAPI::Template.write(template: template, file: file, params: params)
        JSONTemplateAPI::Git.commit(comment: "added #{params['filename']}", data_dir: config['data_dir'])

        output
      end
    end
  end
end
