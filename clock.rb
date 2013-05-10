require 'rubygems'
require 'clockwork'
require File.expand_path('../config/boot', __FILE__ )
require File.expand_path('../config/environment', __FILE__ )

include Clockwork 

every 1.minutes, 'scheduler' do
  SchedulerWorker.perform_async
end
