# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Start
START_TIME = Time.now

# Version
    VERSION = "0.0"
 HG_VERSION = `hg log -r . --template '{latesttag}.{latesttagdistance}-{node|short}'`
CAP_VERSION = File.read("REVISION") rescue "DEV_BUILD"

# Initialize the Rails application.
SimpleGallery::Application.initialize!
