require 'optparse'
require 'manageiq-api-client'
require 'json'

possible_actions= %w[assign_feature unassign_feature list_role create_role]

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

# Create EvmRole-intersight_user
#
# @param miq_client client instance

def create_EvmRole_intersight_user(miq_client)
  string_hash = {
    "action" => "create",
    "resource" =>  {
      "name" => "EvmRole-intersight_user",
      "settings" => {
        "restrictions" => { "vms" => "user" }
      },
      "features" => [
        # physical_infra_overview_view feature
        { "href" => "#{url}/roles/10/features/1047" },
        # Blink Loc LED
        { "href" => "#{url}/roles/10/features/1442" },
        
        # Orders operations
        { "href" => "#{url}/roles/10/features/1533" },
        # Display Orders
        { "href" => "#{url}/roles/10/features/1532" },
        # Edit VM Tags
        { "href" => "#{url}/roles/10/features/1525" },
        # Open VMware VMRC Console
        { "href" => "#{url}/roles/10/features/1523" },
        # Open Remote Console
        { "href" => "#{url}/roles/10/features/1522" },
        # Display VM details
        { "href" => "#{url}/roles/10/features/1517" },
        # View services
        { "href" => "#{url}/roles/10/features/1502" },
        # Display notifications
        { "href" => "#{url}/roles/10/features/1495" },
        # View Physical Infra Topology
        { "href" => "#{url}/roles/10/features/1464" },
        # View Physical Server
        { "href" => "#{url}/roles/10/features/1427" },
        # View Physical Storage
        { "href" => "#{url}/roles/10/features/1416" },
        # View Physical Switch
        { "href" => "#{url}/roles/10/features/1409" },
        # View Physical Chassis
        { "href" => "#{url}/roles/10/features/1400" },
        # View Physical Rack
        { "href" => "#{url}/roles/10/features/1394" },
        # Open a management console
        { "href" => "#{url}/roles/10/features/1386" },
        # Edit Tags of Physical Infrastructure Providers
        { "href" => "#{url}/roles/10/features/1381" },
        # Display Individual Physical Infrastructure Providers
        { "href" => "#{url}/roles/10/features/1377" },
        # View Event Streams
        { "href" => "#{url}/roles/10/features/1479" },
        # Display List of Physical Infrastructure Providers
        { "href" => "#{url}/roles/10/features/1376" },
        # Everything for Template Snapshots
        { "href" => "#{url}/roles/10/features/1292" },
        # Edit Template Tags
        { "href" => "#{url}/roles/10/features/1285" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/roles/10/features/1280" },
        # Display Timelines for Templates
        { "href" => "#{url}/roles/10/features/1277" },
        # Show Capacity & Utilization data of Templates
        { "href" => "#{url}/roles/10/features/1276" },
        # Display Templates Drift
        { "href" => "#{url}/roles/10/features/1275" },
        # Compare multiple Templates
        { "href" => "#{url}/roles/10/features/1274" },
        # Display Timelines for Physical Infrastructure Providers
        { "href" => "#{url}/roles/10/features/1378" },
        # Display Lists of Templates related to a CI
        { "href" => "#{url}/roles/10/features/1272" },
        # Everything for VM Snapshots
        { "href" => "#{url}/roles/10/features/1262" },
        # Edit VM Tags
        { "href" => "#{url}/roles/10/features/1242" },
        # Open a VMRC console for VMs
        { "href" => "#{url}/roles/10/features/1240" },
        # Open a web-based console for VMs
        { "href" => "#{url}/roles/10/features/1239" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/roles/10/features/1224" },
        # Show Chargeback Preview for a VM
        { "href" => "#{url}/roles/10/features/1221" },
        # Display Timelines for VMs
        { "href" => "#{url}/roles/10/features/1220" },
        # Show Capacity & Utilization data of VMs
        { "href" => "#{url}/roles/10/features/1217" },
        # Display Individual Templates related to a CI
        { "href" => "#{url}/roles/10/features/1273" },
        # Display VMs Drift
        { "href" => "#{url}/roles/10/features/1216" },
        # Compare multiple VMs
        { "href" => "#{url}/roles/10/features/1215" },
        # Display Individual VMs related to a CI
        { "href" => "#{url}/roles/10/features/1214" },
        # Display Lists of VMs related to a CI
        { "href" => "#{url}/roles/10/features/1210" },
        # All VM and Instance Access Rules
        { "href" => "#{url}/roles/10/features/1134" },
        # Show the About Information
        { "href" => "#{url}/roles/10/features/716" },
        # Display Lists of My Tasks
        { "href" => "#{url}/roles/10/features/604" },
        # Edit Time Profiles
        { "href" => "#{url}/roles/10/features/595" },
        # Edit Default Views
        { "href" => "#{url}/roles/10/features/593" },
        # Edit Visuals
        { "href" => "#{url}/roles/10/features/592" },
        # Everything under RSS
        { "href" => "#{url}/roles/10/features/406" },
        # Everything under Timelines
        { "href" => "#{url}/roles/10/features/402" },
        # Everything under Reports
        { "href" => "#{url}/roles/10/features/384" },
        # Everything under Chargeback
        { "href" => "#{url}/roles/10/features/383" },
        # Schedules Accordion
        { "href" => "#{url}/roles/10/features/352" },
        # Run a selected Report
        { "href" => "#{url}/roles/10/features/346" },
        # View Reports
        { "href" => "#{url}/roles/10/features/337" },
        # Saved Reports Accordion
        { "href" => "#{url}/roles/10/features/330" },
        # Everything under Dashboard
        { "href" => "#{url}/roles/10/features/323" },
        # Edit Datastore Tags
        { "href" => "#{url}/roles/10/features/312" },
        # Show Capacity & Utilization data of Datastores
        { "href" => "#{url}/roles/10/features/309" },
        # Display Individual Datastores
        { "href" => "#{url}/roles/10/features/308" },
        # Display Lists of Datastores
        { "href" => "#{url}/roles/10/features/307" },
        # Edit Tags of Resource Pools
        { "href" => "#{url}/roles/10/features/301" },
        # Display Individual Resource Pools
        { "href" => "#{url}/roles/10/features/299" },
        # Display Lists of Resource Pools
        { "href" => "#{url}/roles/10/features/298" },
        # Edit Host Tags
        { "href" => "#{url}/roles/10/features/278" },
        # Display Timelines for Hosts
        { "href" => "#{url}/roles/10/features/271" },
        # Show Capacity & Utilization data of Hosts
        { "href" => "#{url}/roles/10/features/270" },
        # Display Individual Hosts
        { "href" => "#{url}/roles/10/features/268" },
        # Display Lists of Hosts
        { "href" => "#{url}/roles/10/features/267" },
        # Edit Tags for Clusters
        { "href" => "#{url}/roles/10/features/261" },
        # Display Timelines for Clusters
        { "href" => "#{url}/roles/10/features/257" },
        # Show Capacity & Utilization data of Clusters
        { "href" => "#{url}/roles/10/features/256" },
        # Display Individual Clusters
        { "href" => "#{url}/roles/10/features/255" },
        # Display Lists of Clusters
        { "href" => "#{url}/roles/10/features/254" },
        # Edit Tags of Infrastructure Providers
        { "href" => "#{url}/roles/10/features/232" },
        # Display Timelines for Infrastructure Providers
        { "href" => "#{url}/roles/10/features/229" },
        # Display Individual Infrastructure Providers
        { "href" => "#{url}/roles/10/features/228" },
        # Display Lists of Infrastructure Providers
        { "href" => "#{url}/roles/10/features/227" },
        # View Services
        { "href" => "#{url}/roles/10/features/87" },
        # Modify Requests
        { "href" => "#{url}/roles/10/features/35" },
        # View Requests
        { "href" => "#{url}/roles/10/features/29" },
        # Instance Views
        { "href" => "#{url}/roles/10/features/11" },
        # Virtual Machine Views
        { "href" => "#{url}/roles/10/features/6" },
        # Workloads Views
        { "href" => "#{url}/roles/10/features/2" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end

  puts "Role EvmRole_intersight_user successfully created"
end

# Create EvmRole-intersight_admin
#
# @param miq_client client instance

def create_EvmRole_intersight_admin(miq_client)
  string_hash = {
    "action" => "create",
    "resource" =>  {
      "name" => "EvmRole-intersight_admin",
      "settings" => {
        "restrictions" => { "vms" => "user" }
      },
      "features" => [
        # physical_infra_overview
        { "href" => "#{url}/roles/10/features/1046" },
        # ems_physical_infra
        { "href" => "#{url}/roles/10/features/1374" },
        # physical_rack
        { "href" => "#{url}/roles/10/features/1393" },
        # physical_chassis
        { "href" => "#{url}/roles/10/features/1399" },
        # physical_switch
        { "href" => "#{url}/roles/10/features/1408" },
        # physical_storage
        { "href" => "#{url}/roles/10/features/1415" },
        # physical_server
        { "href" => "#{url}/roles/10/features/1426" },
        # firmware
        { "href" => "#{url}/roles/10/features/1451" },
        
        # Orders operations
        { "href" => "#{url}/roles/10/features/1533" },
        # Display Orders
        { "href" => "#{url}/roles/10/features/1532" },
        # Edit VM Tags
        { "href" => "#{url}/roles/10/features/1525" },
        # Open VMware VMRC Console
        { "href" => "#{url}/roles/10/features/1523" },
        # Open Remote Console
        { "href" => "#{url}/roles/10/features/1522" },
        # Display VM details
        { "href" => "#{url}/roles/10/features/1517" },
        # View services
        { "href" => "#{url}/roles/10/features/1502" },
        # Display notifications
        { "href" => "#{url}/roles/10/features/1495" },
        # View Physical Infra Topology
        { "href" => "#{url}/roles/10/features/1464" },
        # View Event Streams
        { "href" => "#{url}/roles/10/features/1479" },
        # Everything for Template Snapshots
        { "href" => "#{url}/roles/10/features/1292" },
        # Edit Template Tags
        { "href" => "#{url}/roles/10/features/1285" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/roles/10/features/1280" },
        # Display Timelines for Templates
        { "href" => "#{url}/roles/10/features/1277" },
        # Show Capacity & Utilization data of Templates
        { "href" => "#{url}/roles/10/features/1276" },
        # Display Templates Drift
        { "href" => "#{url}/roles/10/features/1275" },
        # Compare multiple Templates
        { "href" => "#{url}/roles/10/features/1274" },
        # Display Lists of Templates related to a CI
        { "href" => "#{url}/roles/10/features/1272" },
        # Everything for VM Snapshots
        { "href" => "#{url}/roles/10/features/1262" },
        # Edit VM Tags
        { "href" => "#{url}/roles/10/features/1242" },
        # Open a VMRC console for VMs
        { "href" => "#{url}/roles/10/features/1240" },
        # Open a web-based console for VMs
        { "href" => "#{url}/roles/10/features/1239" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/roles/10/features/1224" },
        # Show Chargeback Preview for a VM
        { "href" => "#{url}/roles/10/features/1221" },
        # Display Timelines for VMs
        { "href" => "#{url}/roles/10/features/1220" },
        # Show Capacity & Utilization data of VMs
        { "href" => "#{url}/roles/10/features/1217" },
        # Display Individual Templates related to a CI
        { "href" => "#{url}/roles/10/features/1273" },
        # Display VMs Drift
        { "href" => "#{url}/roles/10/features/1216" },
        # Compare multiple VMs
        { "href" => "#{url}/roles/10/features/1215" },
        # Display Individual VMs related to a CI
        { "href" => "#{url}/roles/10/features/1214" },
        # Display Lists of VMs related to a CI
        { "href" => "#{url}/roles/10/features/1210" },
        # All VM and Instance Access Rules
        { "href" => "#{url}/roles/10/features/1134" },
        # Show the About Information
        { "href" => "#{url}/roles/10/features/716" },
        # Display Lists of My Tasks
        { "href" => "#{url}/roles/10/features/604" },
        # Edit Time Profiles
        { "href" => "#{url}/roles/10/features/595" },
        # Edit Default Views
        { "href" => "#{url}/roles/10/features/593" },
        # Edit Visuals
        { "href" => "#{url}/roles/10/features/592" },
        # Everything under RSS
        { "href" => "#{url}/roles/10/features/406" },
        # Everything under Timelines
        { "href" => "#{url}/roles/10/features/402" },
        # Everything under Reports
        { "href" => "#{url}/roles/10/features/384" },
        # Everything under Chargeback
        { "href" => "#{url}/roles/10/features/383" },
        # Schedules Accordion
        { "href" => "#{url}/roles/10/features/352" },
        # Run a selected Report
        { "href" => "#{url}/roles/10/features/346" },
        # View Reports
        { "href" => "#{url}/roles/10/features/337" },
        # Saved Reports Accordion
        { "href" => "#{url}/roles/10/features/330" },
        # Everything under Dashboard
        { "href" => "#{url}/roles/10/features/323" },
        # Edit Datastore Tags
        { "href" => "#{url}/roles/10/features/312" },
        # Show Capacity & Utilization data of Datastores
        { "href" => "#{url}/roles/10/features/309" },
        # Display Individual Datastores
        { "href" => "#{url}/roles/10/features/308" },
        # Display Lists of Datastores
        { "href" => "#{url}/roles/10/features/307" },
        # Edit Tags of Resource Pools
        { "href" => "#{url}/roles/10/features/301" },
        # Display Individual Resource Pools
        { "href" => "#{url}/roles/10/features/299" },
        # Display Lists of Resource Pools
        { "href" => "#{url}/roles/10/features/298" },
        # Edit Host Tags
        { "href" => "#{url}/roles/10/features/278" },
        # Display Timelines for Hosts
        { "href" => "#{url}/roles/10/features/271" },
        # Show Capacity & Utilization data of Hosts
        { "href" => "#{url}/roles/10/features/270" },
        # Display Individual Hosts
        { "href" => "#{url}/roles/10/features/268" },
        # Display Lists of Hosts
        { "href" => "#{url}/roles/10/features/267" },
        # Edit Tags for Clusters
        { "href" => "#{url}/roles/10/features/261" },
        # Display Timelines for Clusters
        { "href" => "#{url}/roles/10/features/257" },
        # Show Capacity & Utilization data of Clusters
        { "href" => "#{url}/roles/10/features/256" },
        # Display Individual Clusters
        { "href" => "#{url}/roles/10/features/255" },
        # Display Lists of Clusters
        { "href" => "#{url}/roles/10/features/254" },
        # Edit Tags of Infrastructure Providers
        { "href" => "#{url}/roles/10/features/232" },
        # Display Timelines for Infrastructure Providers
        { "href" => "#{url}/roles/10/features/229" },
        # Display Individual Infrastructure Providers
        { "href" => "#{url}/roles/10/features/228" },
        # Display Lists of Infrastructure Providers
        { "href" => "#{url}/roles/10/features/227" },
        # View Services
        { "href" => "#{url}/roles/10/features/87" },
        # Modify Requests
        { "href" => "#{url}/roles/10/features/35" },
        # View Requests
        { "href" => "#{url}/roles/10/features/29" },
        # Instance Views
        { "href" => "#{url}/roles/10/features/11" },
        # Virtual Machine Views
        { "href" => "#{url}/roles/10/features/6" },
        # Workloads Views
        { "href" => "#{url}/roles/10/features/2" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end
  
  puts "Role EvmRole_intersight_admin successfully created"
end

# Remove methods are just for easier development purposes
def remove_EvmRole_intersight_admin(miq_client)
  string_hash = {
    "action" => "delete",
  }
  role_id = miq_client.roles.where(:name => "EvmRole-intersight_admin").first["id"]
  miq_client.connection.post "roles/#{role_id}"  do string_hash  end
  puts "Role EvmRole_intersight_admin successfully deleted"
end

def remove_EvmRole_intersight_user(miq_client)
  string_hash = {
    "action" => "delete",
  }
  role_id = miq_client.roles.where(:name => "EvmRole-intersight_user").first["id"]
  miq_client.connection.post "roles/#{role_id}"  do string_hash  end
  puts "Role EvmRole_intersight_user successfully deleted"
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

create_EvmRole_intersight_user(miq_client)
create_EvmRole_intersight_admin(miq_client)
# remove_EvmRole_intersight_admin(miq_client)
# remove_EvmRole_intersight_user(miq_client)
