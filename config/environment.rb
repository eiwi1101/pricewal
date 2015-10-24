# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Start
START_TIME = Time.now

# Version
VERSION = "0.0"

HG_VERSION = if File.exists? '.hg_archival.txt'
  arc = YAML.load_file('.hg_archival.txt')
  "#{arc['latesttag']}.#{arc['latesttagdistance']}-#{arc['node'][0,16]}"
else
  `hg log -r . --template '{latesttag}.{latesttagdistance}-{node|short}'`
end

CAP_VERSION = File.read("REVISION") rescue "DEV_BUILD"

# Initialize the Rails application.
SimpleGallery::Application.initialize!
