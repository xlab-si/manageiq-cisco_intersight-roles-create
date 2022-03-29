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
        { "href" => "http://localhost:3000/api/roles/10/features/1047" },
        # EvmRole-user features
        { "href" => "http://localhost:3000/api/roles/10/features/1533" },
        { "href" => "http://localhost:3000/api/roles/10/features/1532" },
        { "href" => "http://localhost:3000/api/roles/10/features/1525" },
        { "href" => "http://localhost:3000/api/roles/10/features/1523" },
        { "href" => "http://localhost:3000/api/roles/10/features/1522" },
        { "href" => "http://localhost:3000/api/roles/10/features/1517" },
        { "href" => "http://localhost:3000/api/roles/10/features/1502" },
        { "href" => "http://localhost:3000/api/roles/10/features/1495" },
        { "href" => "http://localhost:3000/api/roles/10/features/1464" },
        { "href" => "http://localhost:3000/api/roles/10/features/1427" },
        { "href" => "http://localhost:3000/api/roles/10/features/1416" },
        { "href" => "http://localhost:3000/api/roles/10/features/1409" },
        { "href" => "http://localhost:3000/api/roles/10/features/1400" },
        { "href" => "http://localhost:3000/api/roles/10/features/1394" },
        { "href" => "http://localhost:3000/api/roles/10/features/1386" },
        { "href" => "http://localhost:3000/api/roles/10/features/1381" },
        { "href" => "http://localhost:3000/api/roles/10/features/1377" },
        { "href" => "http://localhost:3000/api/roles/10/features/1479" },
        { "href" => "http://localhost:3000/api/roles/10/features/1376" },
        { "href" => "http://localhost:3000/api/roles/10/features/1292" },
        { "href" => "http://localhost:3000/api/roles/10/features/1285" },
        { "href" => "http://localhost:3000/api/roles/10/features/1280" },
        { "href" => "http://localhost:3000/api/roles/10/features/1277" },
        { "href" => "http://localhost:3000/api/roles/10/features/1276" },
        { "href" => "http://localhost:3000/api/roles/10/features/1275" },
        { "href" => "http://localhost:3000/api/roles/10/features/1274" },
        { "href" => "http://localhost:3000/api/roles/10/features/1378" },
        { "href" => "http://localhost:3000/api/roles/10/features/1272" },
        { "href" => "http://localhost:3000/api/roles/10/features/1262" },
        { "href" => "http://localhost:3000/api/roles/10/features/1242" },
        { "href" => "http://localhost:3000/api/roles/10/features/1240" },
        { "href" => "http://localhost:3000/api/roles/10/features/1239" },
        { "href" => "http://localhost:3000/api/roles/10/features/1224" },
        { "href" => "http://localhost:3000/api/roles/10/features/1221" },
        { "href" => "http://localhost:3000/api/roles/10/features/1220" },
        { "href" => "http://localhost:3000/api/roles/10/features/1217" },
        { "href" => "http://localhost:3000/api/roles/10/features/1273" },
        { "href" => "http://localhost:3000/api/roles/10/features/1216" },
        { "href" => "http://localhost:3000/api/roles/10/features/1215" },
        { "href" => "http://localhost:3000/api/roles/10/features/1214" },
        { "href" => "http://localhost:3000/api/roles/10/features/1210" },
        { "href" => "http://localhost:3000/api/roles/10/features/1134" },
        { "href" => "http://localhost:3000/api/roles/10/features/716" },
        { "href" => "http://localhost:3000/api/roles/10/features/604" },
        { "href" => "http://localhost:3000/api/roles/10/features/595" },
        { "href" => "http://localhost:3000/api/roles/10/features/593" },
        { "href" => "http://localhost:3000/api/roles/10/features/592" },
        { "href" => "http://localhost:3000/api/roles/10/features/406" },
        { "href" => "http://localhost:3000/api/roles/10/features/402" },
        { "href" => "http://localhost:3000/api/roles/10/features/384" },
        { "href" => "http://localhost:3000/api/roles/10/features/383" },
        { "href" => "http://localhost:3000/api/roles/10/features/352" },
        { "href" => "http://localhost:3000/api/roles/10/features/346" },
        { "href" => "http://localhost:3000/api/roles/10/features/337" },
        { "href" => "http://localhost:3000/api/roles/10/features/330" },
        { "href" => "http://localhost:3000/api/roles/10/features/323" },
        { "href" => "http://localhost:3000/api/roles/10/features/312" },
        { "href" => "http://localhost:3000/api/roles/10/features/309" },
        { "href" => "http://localhost:3000/api/roles/10/features/308" },
        { "href" => "http://localhost:3000/api/roles/10/features/307" },
        { "href" => "http://localhost:3000/api/roles/10/features/301" },
        { "href" => "http://localhost:3000/api/roles/10/features/299" },
        { "href" => "http://localhost:3000/api/roles/10/features/298" },
        { "href" => "http://localhost:3000/api/roles/10/features/278" },
        { "href" => "http://localhost:3000/api/roles/10/features/271" },
        { "href" => "http://localhost:3000/api/roles/10/features/270" },
        { "href" => "http://localhost:3000/api/roles/10/features/268" },
        { "href" => "http://localhost:3000/api/roles/10/features/267" },
        { "href" => "http://localhost:3000/api/roles/10/features/261" },
        { "href" => "http://localhost:3000/api/roles/10/features/257" },
        { "href" => "http://localhost:3000/api/roles/10/features/256" },
        { "href" => "http://localhost:3000/api/roles/10/features/255" },
        { "href" => "http://localhost:3000/api/roles/10/features/254" },
        { "href" => "http://localhost:3000/api/roles/10/features/232" },
        { "href" => "http://localhost:3000/api/roles/10/features/229" },
        { "href" => "http://localhost:3000/api/roles/10/features/228" },
        { "href" => "http://localhost:3000/api/roles/10/features/227" },
        { "href" => "http://localhost:3000/api/roles/10/features/87" },
        { "href" => "http://localhost:3000/api/roles/10/features/35" },
        { "href" => "http://localhost:3000/api/roles/10/features/29" },
        { "href" => "http://localhost:3000/api/roles/10/features/11" },
        { "href" => "http://localhost:3000/api/roles/10/features/6" },
        { "href" => "http://localhost:3000/api/roles/10/features/2" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end

  puts "Role EvmRole_intersight_user successfully created"
end

# TODO: Add all management features for physical_infra
def create_EvmRole_intersight_admin(miq_client)
  string_hash = {
    "action" => "create",
    "resource" =>  {
      "name" => "EvmRole-intersight_admin",
      "settings" => {
        "restrictions" => { "vms" => "user" }
      },
      "features" => [
        # management features for physical_infra
        # physical_infra_overview
        { "href" => "http://localhost:3000/api/roles/10/features/1046" },
        # ems_physical_infra
        { "href" => "http://localhost:3000/api/roles/10/features/1374" },
        # physical_rack
        { "href" => "http://localhost:3000/api/roles/10/features/1393" },
        # physical_chassis
        { "href" => "http://localhost:3000/api/roles/10/features/1399" },
        # physical_switch
        { "href" => "http://localhost:3000/api/roles/10/features/1408" },
        # physical_storage
        { "href" => "http://localhost:3000/api/roles/10/features/1415" },
        # physical_server
        { "href" => "http://localhost:3000/api/roles/10/features/1426" },
        # firmware
        { "href" => "http://localhost:3000/api/roles/10/features/1451" },

        # EvmRole-user features
        { "href" => "http://localhost:3000/api/roles/10/features/1533" },
        { "href" => "http://localhost:3000/api/roles/10/features/1532" },
        { "href" => "http://localhost:3000/api/roles/10/features/1525" },
        { "href" => "http://localhost:3000/api/roles/10/features/1523" },
        { "href" => "http://localhost:3000/api/roles/10/features/1522" },
        { "href" => "http://localhost:3000/api/roles/10/features/1517" },
        { "href" => "http://localhost:3000/api/roles/10/features/1502" },
        { "href" => "http://localhost:3000/api/roles/10/features/1495" },
        { "href" => "http://localhost:3000/api/roles/10/features/1464" },
        { "href" => "http://localhost:3000/api/roles/10/features/1427" },
        { "href" => "http://localhost:3000/api/roles/10/features/1416" },
        { "href" => "http://localhost:3000/api/roles/10/features/1409" },
        { "href" => "http://localhost:3000/api/roles/10/features/1400" },
        { "href" => "http://localhost:3000/api/roles/10/features/1394" },
        { "href" => "http://localhost:3000/api/roles/10/features/1386" },
        { "href" => "http://localhost:3000/api/roles/10/features/1381" },
        { "href" => "http://localhost:3000/api/roles/10/features/1377" },
        { "href" => "http://localhost:3000/api/roles/10/features/1479" },
        { "href" => "http://localhost:3000/api/roles/10/features/1376" },
        { "href" => "http://localhost:3000/api/roles/10/features/1292" },
        { "href" => "http://localhost:3000/api/roles/10/features/1285" },
        { "href" => "http://localhost:3000/api/roles/10/features/1280" },
        { "href" => "http://localhost:3000/api/roles/10/features/1277" },
        { "href" => "http://localhost:3000/api/roles/10/features/1276" },
        { "href" => "http://localhost:3000/api/roles/10/features/1275" },
        { "href" => "http://localhost:3000/api/roles/10/features/1274" },
        { "href" => "http://localhost:3000/api/roles/10/features/1378" },
        { "href" => "http://localhost:3000/api/roles/10/features/1272" },
        { "href" => "http://localhost:3000/api/roles/10/features/1262" },
        { "href" => "http://localhost:3000/api/roles/10/features/1242" },
        { "href" => "http://localhost:3000/api/roles/10/features/1240" },
        { "href" => "http://localhost:3000/api/roles/10/features/1239" },
        { "href" => "http://localhost:3000/api/roles/10/features/1224" },
        { "href" => "http://localhost:3000/api/roles/10/features/1221" },
        { "href" => "http://localhost:3000/api/roles/10/features/1220" },
        { "href" => "http://localhost:3000/api/roles/10/features/1217" },
        { "href" => "http://localhost:3000/api/roles/10/features/1273" },
        { "href" => "http://localhost:3000/api/roles/10/features/1216" },
        { "href" => "http://localhost:3000/api/roles/10/features/1215" },
        { "href" => "http://localhost:3000/api/roles/10/features/1214" },
        { "href" => "http://localhost:3000/api/roles/10/features/1210" },
        { "href" => "http://localhost:3000/api/roles/10/features/1134" },
        { "href" => "http://localhost:3000/api/roles/10/features/716" },
        { "href" => "http://localhost:3000/api/roles/10/features/604" },
        { "href" => "http://localhost:3000/api/roles/10/features/595" },
        { "href" => "http://localhost:3000/api/roles/10/features/593" },
        { "href" => "http://localhost:3000/api/roles/10/features/592" },
        { "href" => "http://localhost:3000/api/roles/10/features/406" },
        { "href" => "http://localhost:3000/api/roles/10/features/402" },
        { "href" => "http://localhost:3000/api/roles/10/features/384" },
        { "href" => "http://localhost:3000/api/roles/10/features/383" },
        { "href" => "http://localhost:3000/api/roles/10/features/352" },
        { "href" => "http://localhost:3000/api/roles/10/features/346" },
        { "href" => "http://localhost:3000/api/roles/10/features/337" },
        { "href" => "http://localhost:3000/api/roles/10/features/330" },
        { "href" => "http://localhost:3000/api/roles/10/features/323" },
        { "href" => "http://localhost:3000/api/roles/10/features/312" },
        { "href" => "http://localhost:3000/api/roles/10/features/309" },
        { "href" => "http://localhost:3000/api/roles/10/features/308" },
        { "href" => "http://localhost:3000/api/roles/10/features/307" },
        { "href" => "http://localhost:3000/api/roles/10/features/301" },
        { "href" => "http://localhost:3000/api/roles/10/features/299" },
        { "href" => "http://localhost:3000/api/roles/10/features/298" },
        { "href" => "http://localhost:3000/api/roles/10/features/278" },
        { "href" => "http://localhost:3000/api/roles/10/features/271" },
        { "href" => "http://localhost:3000/api/roles/10/features/270" },
        { "href" => "http://localhost:3000/api/roles/10/features/268" },
        { "href" => "http://localhost:3000/api/roles/10/features/267" },
        { "href" => "http://localhost:3000/api/roles/10/features/261" },
        { "href" => "http://localhost:3000/api/roles/10/features/257" },
        { "href" => "http://localhost:3000/api/roles/10/features/256" },
        { "href" => "http://localhost:3000/api/roles/10/features/255" },
        { "href" => "http://localhost:3000/api/roles/10/features/254" },
        { "href" => "http://localhost:3000/api/roles/10/features/232" },
        { "href" => "http://localhost:3000/api/roles/10/features/229" },
        { "href" => "http://localhost:3000/api/roles/10/features/228" },
        { "href" => "http://localhost:3000/api/roles/10/features/227" },
        { "href" => "http://localhost:3000/api/roles/10/features/87" },
        { "href" => "http://localhost:3000/api/roles/10/features/35" },
        { "href" => "http://localhost:3000/api/roles/10/features/29" },
        { "href" => "http://localhost:3000/api/roles/10/features/11" },
        { "href" => "http://localhost:3000/api/roles/10/features/6" },
        { "href" => "http://localhost:3000/api/roles/10/features/2" }
      ]
    }
  }
  miq_client.connection.post "roles"  do string_hash  end
  
  puts "Role EvmRole_intersight_admin successfully created"
end

def remove_EvmRole_intersight_admin(miq_client)
  string_hash = {
    "action" => "delete",
  }
  role_id = miq_client.roles.where(:name => "EvmRole-intersight_admin").first["id"]
  miq_client.connection.post "roles/#{role_id}"  do string_hash  end
  puts "Role EvmRole_intersight_admin successfully deleted"
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
