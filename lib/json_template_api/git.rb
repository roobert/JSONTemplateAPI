#!/usr/bin/env ruby
# encoding=utf-8

require 'logger'
require 'git'

module JSONTemplateAPI
  module Git
    def self.commit(data_dir: nil, comment: nil)
      repo = ::Git.open(data_dir, log: Logger.new(STDOUT))
      repo.pull
      repo.add(all: true)
      repo.commit(comment)
      repo.push
    rescue => error
      error.to_s
    end
  end
end
