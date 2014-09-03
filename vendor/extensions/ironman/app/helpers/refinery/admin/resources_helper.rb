module Refinery
  module Admin
    module ResourcesHelper
      def s3_uploader_form(options = {}, &block)
        uploader = S3Uploader.new(options)
        form_tag(uploader.url, uploader.form_options) do
          uploader.fields.map do |name, value|
            hidden_field_tag(name, value)
          end.join.html_safe + capture(&block)
        end
      end

      class S3Uploader
        def initialize(options)
          @options = options.reverse_merge(
            id: "fileupload",
            aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
            aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
            bucket: ENV["AWS_S3_BUCKET"],
            acl: "public-read",
            expiration: 10.hours.from_now.utc,
            max_file_size: 500.megabytes,
            as: "file"
          )
        end

        def form_options
          {
            id: @options[:id],
            method: "post",
            authenticity_token: false,
            multipart: true,
            data: {
              post: @options[:post],
              as: @options[:as],
              app_dialog: @options[:app_dialog],
              field: @options[:field],
              update_resource: @options[:update_resource],
              update_text: @options[:update_text],
              thumbnail: @options[:thumbnail],
              callback: @options[:callback],
              conditions: @options[:conditions],
              current_link: @options[:current_link],
              patch: @options[:patch]
            }
          }
        end

        def fields
          {
            :key => key,
            "AWSAccessKeyId" => @options[:aws_access_key_id],
            :acl => @options[:acl],
            :policy => policy,
            :signature => signature
          }
        end

        def key
          @key ||= "uploads/#{SecureRandom.hex}/${filename}"
        end

        def url
          "https://#{@options[:bucket]}.s3.amazonaws.com/"
        end

        def policy
          Base64.encode64(policy_data.to_json).gsub("\n", "")
        end

        def policy_data
          {
            expiration: @options[:expiration],
            conditions: [
              ["starts-with", "$utf8", ""],
              ["starts-with", "$key", ""],
              ["content-length-range", 0, @options[:max_file_size]],
              {bucket: @options[:bucket]},
              {acl: @options[:acl]}
            ]
          }
        end

        def signature
          Base64.encode64(
            OpenSSL::HMAC.digest(
              OpenSSL::Digest::Digest.new('sha1'),
              @options[:aws_secret_access_key], policy
            )
          ).gsub("\n", "")
        end
      end
    end
  end
end
