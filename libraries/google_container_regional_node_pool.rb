# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
require 'google/container/property/regionalnodepool_autoscaling'
require 'google/container/property/regionalnodepool_config'
require 'google/container/property/regionalnodepool_management'
require 'google/container/property/regionalnodepool_management_upgrade_options'

# A provider to manage Google Kubernetes Engine resources.
class RegionalNodePool < GcpResourceBase
  name 'google_container_regional_node_pool'
  desc 'RegionalNodePool'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :config
  attr_reader :initial_node_count
  attr_reader :version
  attr_reader :autoscaling
  attr_reader :management
  attr_reader :cluster
  attr_reader :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @config = GoogleInSpec::Container::Property::RegionalNodePoolConfig.new(@fetched['config'], to_s)
    @initial_node_count = @fetched['initialNodeCount']
    @version = @fetched['version']
    @autoscaling = GoogleInSpec::Container::Property::RegionalNodePoolAutoscaling.new(@fetched['autoscaling'], to_s)
    @management = GoogleInSpec::Container::Property::RegionalNodePoolManagement.new(@fetched['management'], to_s)
    @cluster = @fetched['cluster']
    @location = @fetched['location']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionalNodePool #{@params[:name]}"
  end

  private

  def product_url
    'https://container.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters/{{cluster}}/nodePools/{{name}}'
  end
end