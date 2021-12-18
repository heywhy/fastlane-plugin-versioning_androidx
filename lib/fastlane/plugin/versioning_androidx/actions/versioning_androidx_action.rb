require 'fastlane/action'
require_relative '../helper/versioning_androidx_helper'

module Fastlane
  module Actions
    class VersioningAndroidxAction < Action
      VERSION_CODE_RE = Fastlane::Helper::VersioningAndroidxHelper::VERSION_CODE_RE
      VERSION_NAME_RE = Fastlane::Helper::VersioningAndroidxHelper::VERSION_NAME_RE

      def self.run(params)
        path = File.absolute_path(params[:manifest_path])
        manifest =
          File.open(path) do |f|
            f.read
          end

        if params[:version_name]
          value = params[:version_name]
          manifest.gsub!(VERSION_NAME_RE, "android:versionName=\"#{value}\"")
        end

        if params[:version_code]
          value = params[:version_code]
          manifest.gsub!(VERSION_CODE_RE, "android:versionCode=\"#{value}\"")
        end

        if IO.write(path, manifest) > 0
          UI.success('Android Manifest update successfully')
        end
      end

      def self.description
        "Android Versioning Plugin for Fastlane - easily Get / Set versionCode and versionName on your Android project."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :manifest_path,
                               description: "The path to the AndroidManifest.xml",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :version_code,
                               description: "Set versionCode to the given value",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :version_name,
                                description: "Set versionName to the given value",
                                  optional: true,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        [:android].include?(platform)
      end
    end
  end
end
