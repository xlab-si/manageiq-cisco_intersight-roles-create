require 'optparse'
require 'manageiq-api-client'
require 'json'

# Create MIQ client
#
# @param url URL to the ManageIQ instance
# @param username username
# @param password password

def create_client(url, username, password)
  miq = ManageIQ::API::Client.new(
    :url      => url,
    :user     => username,
    :password => password
  )
  miq
end

# Create EvmRole-intersight_user, EvmGroup-intersight_user and EvmUser-intersight_user
#
# @param miq_client client instance
# @param url URL to the ManageIQ instance

def create_intersight_user(miq_client, url)

  # EvmRole-intersight_user is created here
  string_hash = {
    "action" => "create",
    "resource" =>  {
      "name" => "EvmRole-intersight_user",
      "settings" => {
        "restrictions" => { "vms" => "user" }
      },
      "features" => [
        # physical_infra_overview_view feature
        { "identifier" => "physical_infra_overview_view" },
        # Blink Loc LED
        { "identifier" => "physical_server_restart_mgmt_controller" },
        # Orders operations
        { "identifier" => "sui_orders" },
        # Display Orders
        { "identifier" => "sui_orders_view" },
        # Edit VM Tags
        { "identifier" => "sui_vm_tags" },
        # Open VMware VMRC Console
        { "identifier" => "sui_vm_vmrc_console" },
        # Open Remote Console
        { "identifier" => "sui_vm_html5_console" },
        # Display VM details
        { "identifier" => "sui_vm_details_view" },
        # View services
        { "identifier" => "sui_services_view" },
        # Display notifications
        { "identifier" => "sui_notifications" },
        # View Physical Infra Topology
        { "identifier" => "physical_infra_topology_view" },
        # View Physical Server
        { "identifier" => "physical_server_view" },
        # View Physical Storage
        { "identifier" => "physical_storage_view" },
        # View Physical Switch
        { "identifier" => "physical_switch_view" },
        # View Physical Chassis
        { "identifier" => "physical_chassis_view" },
        # View Physical Rack
        { "identifier" => "physical_rack_view" },
        # Open a management console
        { "identifier" => "ems_physical_infra_console" },
        # Edit Tags of Physical Infrastructure Providers
        { "identifier" => "ems_physical_infra_tag" },
        # Display Individual Physical Infrastructure Providers
        { "identifier" => "ems_physical_infra_show" },
        # View Event Streams
        { "identifier" => "event_streams_view" },
        # Display List of Physical Infrastructure Providers
        { "identifier" => "ems_physical_infra_show_list" },
        # Everything for Template Snapshots
        { "identifier" => "miq_template_snapshot" },
        # Edit Template Tags
        { "identifier" => "miq_template_tag" },
        # Check Compliance of Last Known Configuration
        { "identifier" => "miq_template_check_compliance" },
        # Display Timelines for Templates
        { "identifier" => "miq_template_timeline" },
        # Show Capacity & Utilization data of Templates
        { "identifier" => "miq_template_perf" },
        # Display Templates Drift
        { "identifier" => "miq_template_drift" },
        # Compare multiple Templates
        { "identifier" => "miq_template_compare" },
        # Display Timelines for Physical Infrastructure Providers
        { "identifier" => "ems_physical_infra_timeline" },
        # Display Lists of Templates related to a CI
        { "identifier" => "miq_template_show_list" },
        # Everything for VM Snapshots
        { "identifier" => "vm_snapshot" },
        # Edit VM Tags
        { "identifier" => "vm_tag" },
        # Open a VMRC console for VMs
        { "identifier" => "vm_vmrc_console" },
        # Open a web-based console for VMs
        { "identifier" => "vm_html5_console" },
        # Check Compliance of Last Known Configuration
        { "identifier" => "vm_check_compliance" },
        # Show Chargeback Preview for a VM
        { "identifier" => "vm_chargeback" },
        # Display Timelines for VMs
        { "identifier" => "vm_timeline" },
        # Show Capacity & Utilization data of VMs
        { "identifier" => "vm_perf" },
        # Display Individual Templates related to a CI
        { "identifier" => "miq_template_show" },
        # Display VMs Drift
        { "identifier" => "vm_drift" },
        # Compare multiple VMs
        { "identifier" => "vm_compare" },
        # Display Individual VMs related to a CI
        { "identifier" => "vm_show" },
        # Display Lists of VMs related to a CI
        { "identifier" => "vm_show_list" },
        # All VM and Instance Access Rules
        { "identifier" => "all_vm_rules" },
        # Show the About Information
        { "identifier" => "about" },
        # Display Lists of My Tasks
        { "identifier" => "miq_task_my_ui" },
        # Edit Time Profiles
        { "identifier" => "my_settings_time_profiles" },
        # Edit Default Views
        { "identifier" => "my_settings_default_views" },
        # Edit Visuals
        { "identifier" => "my_settings_visuals" },
        # Everything under RSS
        { "identifier" => "rss" },
        # Everything under Timelines
        { "identifier" => "timeline" },
        # Everything under Reports
        { "identifier" => "chargeback_reports" },
        # Everything under Chargeback
        { "identifier" => "chargeback" },
        # Schedules Accordion
        { "identifier" => "miq_report_schedules" },
        # Run a selected Report
        { "identifier" => "miq_report_run" },
        # View Reports
        { "identifier" => "miq_report_view" },
        # Saved Reports Accordion
        { "identifier" => "miq_report_saved_reports" },
        # Everything under Dashboard
        { "identifier" => "dashboard" },
        # Edit Datastore Tags
        { "identifier" => "storage_tag" },
        # Show Capacity & Utilization data of Datastores
        { "identifier" => "storage_perf" },
        # Display Individual Datastores
        { "identifier" => "storage_show" },
        # Display Lists of Datastores
        { "identifier" => "storage_show_list" },
        # Edit Tags of Resource Pools
        { "identifier" => "resource_pool_tag" },
        # Display Individual Resource Pools
        { "identifier" => "resource_pool_show" },
        # Display Lists of Resource Pools
        { "identifier" => "resource_pool_view" },
        # Edit Host Tags
        { "identifier" => "host_tag" },
        # Display Timelines for Hosts
        { "identifier" => "host_timeline" },
        # Show Capacity & Utilization data of Hosts
        { "identifier" => "host_perf" },
        # Display Individual Hosts
        { "identifier" => "host_show" },
        # Display Lists of Hosts
        { "identifier" => "host_show_list" },
        # Edit Tags for Clusters
        { "identifier" => "ems_cluster_tag" },
        # Display Timelines for Clusters
        { "identifier" => "ems_cluster_timeline" },
        # Show Capacity & Utilization data of Clusters
        { "identifier" => "ems_cluster_perf" },
        # Display Individual Clusters
        { "identifier" => "ems_cluster_show" },
        # Display Lists of Clusters
        { "identifier" => "ems_cluster_show_list" },
        # Edit Tags of Infrastructure Providers
        { "identifier" => "ems_infra_tag" },
        # Display Timelines for Infrastructure Providers
        { "identifier" => "ems_infra_timeline" },
        # Display Individual Infrastructure Providers
        { "identifier" => "ems_infra_show" },
        # Display Lists of Infrastructure Providers
        { "identifier" => "ems_infra_show_list" },
        # View Services
        { "identifier" => "service_view" },
        # Modify Requests
        { "identifier" => "miq_request_admin" },
        # View Requests
        { "identifier" => "miq_request_view" },
        # Instance Views
        { "identifier" => "vm_cloud_explorer" },
        # Virtual Machine Views
        { "identifier" => "vm_infra_explorer" },
        # Workloads Views
        { "identifier" => "vm_explorer" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end
  puts "Role EvmRole-intersight_user successfully created"


  # EvmGroup-intersight_user is created here
  role_id = miq_client.roles.where(:name => "EvmRole-intersight_user").first["id"]
  string_hash = {
    "description" => "EvmGroup-intersight_user",
    "role" => {
      "id" => role_id
    },
    "tenant" => { "href" => "#{url}/tenants/1" }
  }
  miq_client.connection.post "groups"  do string_hash  end
  puts "Group EvmGroup-intersight_user successfully created"

  # EvmUser-intersight_user is created here
  group_id = miq_client.groups.where(:description => "EvmGroup-intersight_user").first["id"]
  string_hash = {
    "userid" => "intersight_user",
    "password" => "test123",
    "name" => "EvmUser-Intersight_user",
    "group" => {
      "id" => group_id
    }
  }
  miq_client.connection.post "users"  do string_hash  end
  puts "User EvmUser_intersight_user successfully created"

end

# Create EvmRole-intersight_admin, EvmGroup-intersight_admin and EvmUser-intersight_admin
#
# @param miq_client client instance
# @param url URL to the ManageIQ instance

def create_intersight_admin(miq_client, url)
  string_hash = {
    "action" => "create",
    "resource" =>  {
      "name" => "EvmRole-intersight_admin",
      "settings" => {
        "restrictions" => { "vms" => "user" }
      },
      "features" => [
        # physical_infra_overview
        { "identifier" => "physical_infra_overview" },
        # ems_physical_infra
        { "identifier" => "ems_physical_infra" },
        # physical_rack
        { "identifier" => "physical_rack" },
        # physical_chassis
        { "identifier" => "physical_chassis" },
        # physical_switch
        { "identifier" => "physical_switch" },
        # physical_storage
        { "identifier" => "physical_storage" },
        # physical_server
        { "identifier" => "physical_server" },
        # firmware
        { "identifier" => "firmware" },
        
        # Orders operations
        { "identifier" => "sui_orders" },
        # Display Orders
        { "identifier" => "sui_orders_view" },
        # Edit VM Tags
        { "identifier" => "sui_vm_tags" },
        # Open VMware VMRC Console
        { "identifier" => "sui_vm_vmrc_console" },
        # Open Remote Console
        { "identifier" => "sui_vm_html5_console" },
        # Display VM details
        { "identifier" => "sui_vm_details_view" },
        # View services
        { "identifier" => "sui_services_view" },
        # Display notifications
        { "identifier" => "sui_notifications" },
        # View Physical Infra Topology
        { "identifier" => "physical_infra_topology_view" },
        # View Event Streams
        { "identifier" => "event_streams_view" },
        # Everything for Template Snapshots
        { "identifier" => "miq_template_snapshot" },
        # Edit Template Tags
        { "identifier" => "miq_template_tag" },
        # Check Compliance of Last Known Configuration
        { "identifier" => "miq_template_check_compliance" },
        # Display Timelines for Templates
        { "identifier" => "miq_template_timeline" },
        # Show Capacity & Utilization data of Templates
        { "identifier" => "miq_template_perf" },
        # Display Templates Drift
        { "identifier" => "miq_template_drift" },
        # Compare multiple Templates
        { "identifier" => "miq_template_compare" },
        # Display Lists of Templates related to a CI
        { "identifier" => "miq_template_show_list" },
        # Everything for VM Snapshots
        { "identifier" => "vm_snapshot" },
        # Edit VM Tags
        { "identifier" => "vm_tag" },
        # Open a VMRC console for VMs
        { "identifier" => "vm_vmrc_console" },
        # Open a web-based console for VMs
        { "identifier" => "vm_html5_console" },
        # Check Compliance of Last Known Configuration
        { "identifier" => "vm_check_compliance" },
        # Show Chargeback Preview for a VM
        { "identifier" => "vm_chargeback" },
        # Display Timelines for VMs
        { "identifier" => "vm_timeline" },
        # Show Capacity & Utilization data of VMs
        { "identifier" => "vm_perf" },
        # Display Individual Templates related to a CI
        { "identifier" => "miq_template_show" },
        # Display VMs Drift
        { "identifier" => "vm_drift" },
        # Compare multiple VMs
        { "identifier" => "vm_compare" },
        # Display Individual VMs related to a CI
        { "identifier" => "vm_show" },
        # Display Lists of VMs related to a CI
        { "identifier" => "vm_show_list" },
        # All VM and Instance Access Rules
        { "identifier" => "all_vm_rules" },
        # Show the About Information
        { "identifier" => "about" },
        # Display Lists of My Tasks
        { "identifier" => "miq_task_my_ui" },
        # Edit Time Profiles
        { "identifier" => "my_settings_time_profiles" },
        # Edit Default Views
        { "identifier" => "my_settings_default_views" },
        # Edit Visuals
        { "identifier" => "my_settings_visuals" },
        # Everything under RSS
        { "identifier" => "rss" },
        # Everything under Timelines
        { "identifier" => "timeline" },
        # Everything under Reports
        { "identifier" => "chargeback_reports" },
        # Everything under Chargeback
        { "identifier" => "chargeback" },
        # Schedules Accordion
        { "identifier" => "miq_report_schedules" },
        # Run a selected Report
        { "identifier" => "miq_report_run" },
        # View Reports
        { "identifier" => "miq_report_view" },
        # Saved Reports Accordion
        { "identifier" => "miq_report_saved_reports" },
        # Everything under Dashboard
        { "identifier" => "dashboard" },
        # Edit Datastore Tags
        { "identifier" => "storage_tag" },
        # Show Capacity & Utilization data of Datastores
        { "identifier" => "storage_perf" },
        # Display Individual Datastores
        { "identifier" => "storage_show" },
        # Display Lists of Datastores
        { "identifier" => "storage_show_list" },
        # Edit Tags of Resource Pools
        { "identifier" => "resource_pool_tag" },
        # Display Individual Resource Pools
        { "identifier" => "resource_pool_show" },
        # Display Lists of Resource Pools
        { "identifier" => "resource_pool_view" },
        # Edit Host Tags
        { "identifier" => "host_tag" },
        # Display Timelines for Hosts
        { "identifier" => "host_timeline" },
        # Show Capacity & Utilization data of Hosts
        { "identifier" => "host_perf" },
        # Display Individual Hosts
        { "identifier" => "host_show" },
        # Display Lists of Hosts
        { "identifier" => "host_show_list" },
        # Edit Tags for Clusters
        { "identifier" => "ems_cluster_tag" },
        # Display Timelines for Clusters
        { "identifier" => "ems_cluster_timeline" },
        # Show Capacity & Utilization data of Clusters
        { "identifier" => "ems_cluster_perf" },
        # Display Individual Clusters
        { "identifier" => "ems_cluster_show" },
        # Display Lists of Clusters
        { "identifier" => "ems_cluster_show_list" },
        # Edit Tags of Infrastructure Providers
        { "identifier" => "ems_infra_tag" },
        # Display Timelines for Infrastructure Providers
        { "identifier" => "ems_infra_timeline" },
        # Display Individual Infrastructure Providers
        { "identifier" => "ems_infra_show" },
        # Display Lists of Infrastructure Providers
        { "identifier" => "ems_infra_show_list" },
        # View Services
        { "identifier" => "service_view" },
        # Modify Requests
        { "identifier" => "miq_request_admin" },
        # View Requests
        { "identifier" => "miq_request_view" },
        # Instance Views
        { "identifier" => "vm_cloud_explorer" },
        # Virtual Machine Views
        { "identifier" => "vm_infra_explorer" },
        # Workloads Views
        { "identifier" => "vm_explorer" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end
  puts "Role EvmRole_intersight_admin successfully created"

  #EvmGroup-intersight_admin is created here
  role_id = miq_client.roles.where(:name => "EvmRole-intersight_admin").first["id"]
  string_hash = {
    "description" => "EvmGroup-intersight_admin",
    "role" => {
      "id" => role_id
    },
    "tenant" => { "href" => "#{url}/tenants/1" }
  }
  miq_client.connection.post "groups"  do string_hash  end
  puts "Group EvmGroup_intersight_admin successfully created"

  #EvmUser-intersight_admin is created here
  group_id = miq_client.groups.where(:description => "EvmGroup-intersight_admin").first["id"]
  string_hash = {
    "userid" => "intersight_admin",
    "password" => "test123",
    "name" => "EvmUser-Intersight_admin",
    "group" => {
      "id" => group_id
    }
  }
  miq_client.connection.post "users"  do string_hash  end
  puts "User EvmUser-intersight_admin successfully created"

end

options = {}
option_parser =  OptionParser.new do |opt|
  opt.banner = "Usage: #{$0} --username username --password password --url url"
  opt.on('-u', '--username USERNAME', '[Mandatory] ManageIQ username') { |o| options[:username] = o }
  opt.on('-p','--password PASSWORD', '[Mandatory] ManageIQ password') { |o| options[:password] = o }
  opt.on('--url URL', '[Mandatory] URL to the ManageIQ API') { |o| options[:url] = o }
end

option_parser.parse!

if options[:username].nil? || options[:password].nil? || options[:url].nil?
  puts option_parser.help
  exit 1
end

miq_client=create_client(options[:url], options[:username], options[:password])

create_intersight_user(miq_client, options[:url])
create_intersight_admin(miq_client, options[:url])
