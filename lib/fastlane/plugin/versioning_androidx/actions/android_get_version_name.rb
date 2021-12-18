require 'fastlane/action'
require_relative '../helper/versioning_androidx_helper'

module Fastlane
  module Actions
    class AndroidGetVersionNameAction < Action
      VERSION_NAME_RE = Fastlane::Helper::VersioningAndroidxHelper::VERSION_NAME_RE

      def self.run(params)
        path = File.absolute_path(params[:manifest_path])

        File.open(path) do |f|
          manifest = f.read
          VERSION_NAME_RE.match(manifest)[1]
        end
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :manifest_path,
                               description: "The path to the AndroidManifest.xml",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        [:android].include?(platform)
      end
    end
  end
end
