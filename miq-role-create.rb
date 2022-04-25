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
        { "href" => "#{url}/features/1047" },
        # Blink Loc LED
        { "href" => "#{url}/features/1442" },
        # Orders operations
        { "href" => "#{url}/features/1533" },
        # Display Orders
        { "href" => "#{url}/features/1532" },
        # Edit VM Tags
        { "href" => "#{url}/features/1525" },
        # Open VMware VMRC Console
        { "href" => "#{url}/features/1523" },
        # Open Remote Console
        { "href" => "#{url}/features/1522" },
        # Display VM details
        { "href" => "#{url}/features/1517" },
        # View services
        { "href" => "#{url}/features/1502" },
        # Display notifications
        { "href" => "#{url}/features/1495" },
        # View Physical Infra Topology
        { "href" => "#{url}/features/1464" },
        # View Physical Server
        { "href" => "#{url}/features/1427" },
        # View Physical Storage
        { "href" => "#{url}/features/1416" },
        # View Physical Switch
        { "href" => "#{url}/features/1409" },
        # View Physical Chassis
        { "href" => "#{url}/features/1400" },
        # View Physical Rack
        { "href" => "#{url}/features/1394" },
        # Open a management console
        { "href" => "#{url}/features/1386" },
        # Edit Tags of Physical Infrastructure Providers
        { "href" => "#{url}/features/1381" },
        # Display Individual Physical Infrastructure Providers
        { "href" => "#{url}/features/1377" },
        # View Event Streams
        { "href" => "#{url}/features/1479" },
        # Display List of Physical Infrastructure Providers
        { "href" => "#{url}/features/1376" },
        # Everything for Template Snapshots
        { "href" => "#{url}/features/1292" },
        # Edit Template Tags
        { "href" => "#{url}/features/1285" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/features/1280" },
        # Display Timelines for Templates
        { "href" => "#{url}/features/1277" },
        # Show Capacity & Utilization data of Templates
        { "href" => "#{url}/features/1276" },
        # Display Templates Drift
        { "href" => "#{url}/features/1275" },
        # Compare multiple Templates
        { "href" => "#{url}/features/1274" },
        # Display Timelines for Physical Infrastructure Providers
        { "href" => "#{url}/features/1378" },
        # Display Lists of Templates related to a CI
        { "href" => "#{url}/features/1272" },
        # Everything for VM Snapshots
        { "href" => "#{url}/features/1262" },
        # Edit VM Tags
        { "href" => "#{url}/features/1242" },
        # Open a VMRC console for VMs
        { "href" => "#{url}/features/1240" },
        # Open a web-based console for VMs
        { "href" => "#{url}/features/1239" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/features/1224" },
        # Show Chargeback Preview for a VM
        { "href" => "#{url}/features/1221" },
        # Display Timelines for VMs
        { "href" => "#{url}/features/1220" },
        # Show Capacity & Utilization data of VMs
        { "href" => "#{url}/features/1217" },
        # Display Individual Templates related to a CI
        { "href" => "#{url}/features/1273" },
        # Display VMs Drift
        { "href" => "#{url}/features/1216" },
        # Compare multiple VMs
        { "href" => "#{url}/features/1215" },
        # Display Individual VMs related to a CI
        { "href" => "#{url}/features/1214" },
        # Display Lists of VMs related to a CI
        { "href" => "#{url}/features/1210" },
        # All VM and Instance Access Rules
        { "href" => "#{url}/features/1134" },
        # Show the About Information
        { "href" => "#{url}/features/716" },
        # Display Lists of My Tasks
        { "href" => "#{url}/features/604" },
        # Edit Time Profiles
        { "href" => "#{url}/features/595" },
        # Edit Default Views
        { "href" => "#{url}/features/593" },
        # Edit Visuals
        { "href" => "#{url}/features/592" },
        # Everything under RSS
        { "href" => "#{url}/features/406" },
        # Everything under Timelines
        { "href" => "#{url}/features/402" },
        # Everything under Reports
        { "href" => "#{url}/features/384" },
        # Everything under Chargeback
        { "href" => "#{url}/features/383" },
        # Schedules Accordion
        { "href" => "#{url}/features/352" },
        # Run a selected Report
        { "href" => "#{url}/features/346" },
        # View Reports
        { "href" => "#{url}/features/337" },
        # Saved Reports Accordion
        { "href" => "#{url}/features/330" },
        # Everything under Dashboard
        { "href" => "#{url}/features/323" },
        # Edit Datastore Tags
        { "href" => "#{url}/features/312" },
        # Show Capacity & Utilization data of Datastores
        { "href" => "#{url}/features/309" },
        # Display Individual Datastores
        { "href" => "#{url}/features/308" },
        # Display Lists of Datastores
        { "href" => "#{url}/features/307" },
        # Edit Tags of Resource Pools
        { "href" => "#{url}/features/301" },
        # Display Individual Resource Pools
        { "href" => "#{url}/features/299" },
        # Display Lists of Resource Pools
        { "href" => "#{url}/features/298" },
        # Edit Host Tags
        { "href" => "#{url}/features/278" },
        # Display Timelines for Hosts
        { "href" => "#{url}/features/271" },
        # Show Capacity & Utilization data of Hosts
        { "href" => "#{url}/features/270" },
        # Display Individual Hosts
        { "href" => "#{url}/features/268" },
        # Display Lists of Hosts
        { "href" => "#{url}/features/267" },
        # Edit Tags for Clusters
        { "href" => "#{url}/features/261" },
        # Display Timelines for Clusters
        { "href" => "#{url}/features/257" },
        # Show Capacity & Utilization data of Clusters
        { "href" => "#{url}/features/256" },
        # Display Individual Clusters
        { "href" => "#{url}/features/255" },
        # Display Lists of Clusters
        { "href" => "#{url}/features/254" },
        # Edit Tags of Infrastructure Providers
        { "href" => "#{url}/features/232" },
        # Display Timelines for Infrastructure Providers
        { "href" => "#{url}/features/229" },
        # Display Individual Infrastructure Providers
        { "href" => "#{url}/features/228" },
        # Display Lists of Infrastructure Providers
        { "href" => "#{url}/features/227" },
        # View Services
        { "href" => "#{url}/features/87" },
        # Modify Requests
        { "href" => "#{url}/features/35" },
        # View Requests
        { "href" => "#{url}/features/29" },
        # Instance Views
        { "href" => "#{url}/features/11" },
        # Virtual Machine Views
        { "href" => "#{url}/features/6" },
        # Workloads Views
        { "href" => "#{url}/features/2" }
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
        { "href" => "#{url}/features/1046" },
        # ems_physical_infra
        { "href" => "#{url}/features/1374" },
        # physical_rack
        { "href" => "#{url}/features/1393" },
        # physical_chassis
        { "href" => "#{url}/features/1399" },
        # physical_switch
        { "href" => "#{url}/features/1408" },
        # physical_storage
        { "href" => "#{url}/features/1415" },
        # physical_server
        { "href" => "#{url}/features/1426" },
        # firmware
        { "href" => "#{url}/features/1451" },
        
        # Orders operations
        { "href" => "#{url}/features/1533" },
        # Display Orders
        { "href" => "#{url}/features/1532" },
        # Edit VM Tags
        { "href" => "#{url}/features/1525" },
        # Open VMware VMRC Console
        { "href" => "#{url}/features/1523" },
        # Open Remote Console
        { "href" => "#{url}/features/1522" },
        # Display VM details
        { "href" => "#{url}/features/1517" },
        # View services
        { "href" => "#{url}/features/1502" },
        # Display notifications
        { "href" => "#{url}/features/1495" },
        # View Physical Infra Topology
        { "href" => "#{url}/features/1464" },
        # View Event Streams
        { "href" => "#{url}/features/1479" },
        # Everything for Template Snapshots
        { "href" => "#{url}/features/1292" },
        # Edit Template Tags
        { "href" => "#{url}/features/1285" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/features/1280" },
        # Display Timelines for Templates
        { "href" => "#{url}/features/1277" },
        # Show Capacity & Utilization data of Templates
        { "href" => "#{url}/features/1276" },
        # Display Templates Drift
        { "href" => "#{url}/features/1275" },
        # Compare multiple Templates
        { "href" => "#{url}/features/1274" },
        # Display Lists of Templates related to a CI
        { "href" => "#{url}/features/1272" },
        # Everything for VM Snapshots
        { "href" => "#{url}/features/1262" },
        # Edit VM Tags
        { "href" => "#{url}/features/1242" },
        # Open a VMRC console for VMs
        { "href" => "#{url}/features/1240" },
        # Open a web-based console for VMs
        { "href" => "#{url}/features/1239" },
        # Check Compliance of Last Known Configuration
        { "href" => "#{url}/features/1224" },
        # Show Chargeback Preview for a VM
        { "href" => "#{url}/features/1221" },
        # Display Timelines for VMs
        { "href" => "#{url}/features/1220" },
        # Show Capacity & Utilization data of VMs
        { "href" => "#{url}/features/1217" },
        # Display Individual Templates related to a CI
        { "href" => "#{url}/features/1273" },
        # Display VMs Drift
        { "href" => "#{url}/features/1216" },
        # Compare multiple VMs
        { "href" => "#{url}/features/1215" },
        # Display Individual VMs related to a CI
        { "href" => "#{url}/features/1214" },
        # Display Lists of VMs related to a CI
        { "href" => "#{url}/features/1210" },
        # All VM and Instance Access Rules
        { "href" => "#{url}/features/1134" },
        # Show the About Information
        { "href" => "#{url}/features/716" },
        # Display Lists of My Tasks
        { "href" => "#{url}/features/604" },
        # Edit Time Profiles
        { "href" => "#{url}/features/595" },
        # Edit Default Views
        { "href" => "#{url}/features/593" },
        # Edit Visuals
        { "href" => "#{url}/features/592" },
        # Everything under RSS
        { "href" => "#{url}/features/406" },
        # Everything under Timelines
        { "href" => "#{url}/features/402" },
        # Everything under Reports
        { "href" => "#{url}/features/384" },
        # Everything under Chargeback
        { "href" => "#{url}/features/383" },
        # Schedules Accordion
        { "href" => "#{url}/features/352" },
        # Run a selected Report
        { "href" => "#{url}/features/346" },
        # View Reports
        { "href" => "#{url}/features/337" },
        # Saved Reports Accordion
        { "href" => "#{url}/features/330" },
        # Everything under Dashboard
        { "href" => "#{url}/features/323" },
        # Edit Datastore Tags
        { "href" => "#{url}/features/312" },
        # Show Capacity & Utilization data of Datastores
        { "href" => "#{url}/features/309" },
        # Display Individual Datastores
        { "href" => "#{url}/features/308" },
        # Display Lists of Datastores
        { "href" => "#{url}/features/307" },
        # Edit Tags of Resource Pools
        { "href" => "#{url}/features/301" },
        # Display Individual Resource Pools
        { "href" => "#{url}/features/299" },
        # Display Lists of Resource Pools
        { "href" => "#{url}/features/298" },
        # Edit Host Tags
        { "href" => "#{url}/features/278" },
        # Display Timelines for Hosts
        { "href" => "#{url}/features/271" },
        # Show Capacity & Utilization data of Hosts
        { "href" => "#{url}/features/270" },
        # Display Individual Hosts
        { "href" => "#{url}/features/268" },
        # Display Lists of Hosts
        { "href" => "#{url}/features/267" },
        # Edit Tags for Clusters
        { "href" => "#{url}/features/261" },
        # Display Timelines for Clusters
        { "href" => "#{url}/features/257" },
        # Show Capacity & Utilization data of Clusters
        { "href" => "#{url}/features/256" },
        # Display Individual Clusters
        { "href" => "#{url}/features/255" },
        # Display Lists of Clusters
        { "href" => "#{url}/features/254" },
        # Edit Tags of Infrastructure Providers
        { "href" => "#{url}/features/232" },
        # Display Timelines for Infrastructure Providers
        { "href" => "#{url}/features/229" },
        # Display Individual Infrastructure Providers
        { "href" => "#{url}/features/228" },
        # Display Lists of Infrastructure Providers
        { "href" => "#{url}/features/227" },
        # View Services
        { "href" => "#{url}/features/87" },
        # Modify Requests
        { "href" => "#{url}/features/35" },
        # View Requests
        { "href" => "#{url}/features/29" },
        # Instance Views
        { "href" => "#{url}/features/11" },
        # Virtual Machine Views
        { "href" => "#{url}/features/6" },
        # Workloads Views
        { "href" => "#{url}/features/2" }
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
