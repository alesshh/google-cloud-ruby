# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/errors"
require "google/cloud/billing/v1/version"
require "google/cloud/billing/v1/cloud_catalog_pb"
require "google/cloud/billing/v1/cloud_catalog/credentials"
require "google/cloud/billing/v1/cloud_catalog/paths"


module Google
  module Cloud
    module Billing
      module V1
        module CloudCatalog
          # Service that implements CloudCatalog API.
          class Client
            include Paths

            # @private
            attr_reader :cloud_catalog_stub

            ##
            # Configuration for the CloudCatalog Client API.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "Billing", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const&.respond_to? :configure
                                  namespace.pop
                                end
                Client::Configuration.new parent_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the CloudCatalog Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new Client client object.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/cloud/billing/v1/cloud_catalog_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              credentials ||= Credentials.default scope: @config.scope
              if credentials.is_a?(String) || credentials.is_a?(Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end


              @cloud_catalog_stub = Gapic::ServiceStub.new(
                Google::Cloud::Billing::V1::CloudCatalog::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Lists all public cloud services.
            #
            # @overload list_services(request, options = nil)
            #   @param request [Google::Cloud::Billing::V1::ListServicesRequest | Hash]
            #     Lists all public cloud services.
            #   @param options [Gapic::CallOptions, Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload list_services(page_size: nil, page_token: nil)
            #   @param page_size [Integer]
            #     Requested page size. Defaults to 5000.
            #   @param page_token [String]
            #     A token identifying a page of results to return. This should be a
            #     `next_page_token` value returned from a previous `ListServices`
            #     call. If unspecified, the first page of results is returned.
            #
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [Gapic::PagedEnumerable<Google::Cloud::Billing::V1::Service>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            #
            # @return [Gapic::PagedEnumerable<Google::Cloud::Billing::V1::Service>]
            #
            # @raise [Google::Cloud::Error] if the RPC is aborted.
            #
            def list_services request, options = nil
              raise ArgumentError, "request must be provided" if request.nil?

              request = Gapic::Protobuf.coerce request, to: Google::Cloud::Billing::V1::ListServicesRequest

              # Converts hash and nil to an options object
              options = Gapic::CallOptions.new options.to_h if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.list_services.metadata.to_h

              # Set x-goog-api-client header
              metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Billing::V1::VERSION

              options.apply_defaults timeout:      @config.rpcs.list_services.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.list_services.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @cloud_catalog_stub.call_rpc :list_services, request, options: options do |response, operation|
                response = Gapic::PagedEnumerable.new @cloud_catalog_stub, :list_services, request, response, operation, options
                yield response, operation if block_given?
                return response
              end
            rescue GRPC::BadStatus => e
              raise Google::Cloud::Error.from_error(e)
            end

            ##
            # Lists all publicly available SKUs for a given cloud service.
            #
            # @overload list_skus(request, options = nil)
            #   @param request [Google::Cloud::Billing::V1::ListSkusRequest | Hash]
            #     Lists all publicly available SKUs for a given cloud service.
            #   @param options [Gapic::CallOptions, Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload list_skus(parent: nil, start_time: nil, end_time: nil, currency_code: nil, page_size: nil, page_token: nil)
            #   @param parent [String]
            #     Required. The name of the service.
            #     Example: "services/DA34-426B-A397"
            #   @param start_time [Google::Protobuf::Timestamp | Hash]
            #     Optional inclusive start time of the time range for which the pricing
            #     versions will be returned. Timestamps in the future are not allowed.
            #     The time range has to be within a single calendar month in
            #     America/Los_Angeles timezone. Time range as a whole is optional. If not
            #     specified, the latest pricing will be returned (up to 12 hours old at
            #     most).
            #   @param end_time [Google::Protobuf::Timestamp | Hash]
            #     Optional exclusive end time of the time range for which the pricing
            #     versions will be returned. Timestamps in the future are not allowed.
            #     The time range has to be within a single calendar month in
            #     America/Los_Angeles timezone. Time range as a whole is optional. If not
            #     specified, the latest pricing will be returned (up to 12 hours old at
            #     most).
            #   @param currency_code [String]
            #     The ISO 4217 currency code for the pricing info in the response proto.
            #     Will use the conversion rate as of start_time.
            #     Optional. If not specified USD will be used.
            #   @param page_size [Integer]
            #     Requested page size. Defaults to 5000.
            #   @param page_token [String]
            #     A token identifying a page of results to return. This should be a
            #     `next_page_token` value returned from a previous `ListSkus`
            #     call. If unspecified, the first page of results is returned.
            #
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [Gapic::PagedEnumerable<Google::Cloud::Billing::V1::Sku>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            #
            # @return [Gapic::PagedEnumerable<Google::Cloud::Billing::V1::Sku>]
            #
            # @raise [Google::Cloud::Error] if the RPC is aborted.
            #
            def list_skus request, options = nil
              raise ArgumentError, "request must be provided" if request.nil?

              request = Gapic::Protobuf.coerce request, to: Google::Cloud::Billing::V1::ListSkusRequest

              # Converts hash and nil to an options object
              options = Gapic::CallOptions.new options.to_h if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.list_skus.metadata.to_h

              # Set x-goog-api-client header
              metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::Billing::V1::VERSION

              header_params = {
                "parent" => request.parent
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.list_skus.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.list_skus.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @cloud_catalog_stub.call_rpc :list_skus, request, options: options do |response, operation|
                response = Gapic::PagedEnumerable.new @cloud_catalog_stub, :list_skus, request, response, operation, options
                yield response, operation if block_given?
                return response
              end
            rescue GRPC::BadStatus => e
              raise Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the CloudCatalog API.
            class Configuration
              extend Gapic::Config

              config_attr :endpoint,     "cloudbilling.googleapis.com", String
              config_attr :credentials,  nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,        nil, String, Array, nil
              config_attr :lib_name,     nil, String, nil
              config_attr :lib_version,  nil, String, nil
              config_attr(:channel_args, { "grpc.service_config_disable_resolution"=>1 }, Hash, nil)
              config_attr :interceptors, nil, Array, nil
              config_attr :timeout,      nil, Numeric, nil
              config_attr :metadata,     nil, Hash, nil
              config_attr :retry_policy, nil, Hash, Proc, nil

              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if @parent_config&.respond_to? :rpcs
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the CloudCatalog API.
              class Rpcs
                attr_reader :list_services
                attr_reader :list_skus

                def initialize parent_rpcs = nil
                  list_services_config = parent_rpcs&.list_services if parent_rpcs&.respond_to? :list_services
                  @list_services = Gapic::Config::Method.new list_services_config
                  list_skus_config = parent_rpcs&.list_skus if parent_rpcs&.respond_to? :list_skus
                  @list_skus = Gapic::Config::Method.new list_skus_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end

# rubocop:disable Lint/HandleExceptions

# Once client is loaded, load helpers.rb if it exists.
begin
  require "google/cloud/billing/v1/cloud_catalog/helpers"
rescue LoadError
end

# rubocop:enable Lint/HandleExceptions