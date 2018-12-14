# frozen_string_literal: true

module KubernetesDeploy
  module OptionsHelper
    def self.default_and_check_template_dir(template_dir)
      if !template_dir && ENV.key?("ENVIRONMENT")
        template_dir = "config/deploy/#{ENV['ENVIRONMENT']}"
      end

      if !template_dir || template_dir.empty?
        template_dir = "."
        puts "Using current directory as template directory"
      end

      template_dir
    end

    def self.revision_from_environment
      ENV.fetch('REVISION') do
        puts "Using 1 as default Revision"
        '1'
      end
    end
  end
end
