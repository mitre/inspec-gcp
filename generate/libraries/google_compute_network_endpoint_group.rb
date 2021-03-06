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

# A provider to manage Compute Engine resources.
class ComputeNetworkEndpointGroup < GcpResourceBase
  name 'google_compute_network_endpoint_group'
  desc 'NetworkEndpointGroup'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :id
  attr_reader :name
  attr_reader :description
  attr_reader :network_endpoint_type
  attr_reader :size
  attr_reader :network
  attr_reader :subnetwork
  attr_reader :default_port
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @id = @fetched['id']
    @name = @fetched['name']
    @description = @fetched['description']
    @network_endpoint_type = @fetched['networkEndpointType']
    @size = @fetched['size']
    @network = @fetched['network']
    @subnetwork = @fetched['subnetwork']
    @default_port = @fetched['defaultPort']
    @zone = @fetched['zone']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "NetworkEndpointGroup #{@params[:name]}"
  end

  def un_parse
    {
      'id' => ->(x, _) { x.nil? ? [] : ["its('id') { should cmp #{x.inspect} }"] },
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'description' => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      'network_endpoint_type' => ->(x, _) { x.nil? ? [] : ["its('network_endpoint_type') { should cmp #{x.inspect} }"] },
      'size' => ->(x, _) { x.nil? ? [] : ["its('size') { should cmp #{x.inspect} }"] },
      'network' => ->(x, _) { x.nil? ? [] : ["its('network') { should cmp #{x.inspect} }"] },
      'subnetwork' => ->(x, _) { x.nil? ? [] : ["its('subnetwork') { should cmp #{x.inspect} }"] },
      'default_port' => ->(x, _) { x.nil? ? [] : ["its('default_port') { should cmp #{x.inspect} }"] },
      'zone' => ->(x, _) { x.nil? ? [] : ["its('zone') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'NetworkEndpointGroup'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_compute_network_endpoint_group',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/networkEndpointGroups/{{name}}'
  end
end
