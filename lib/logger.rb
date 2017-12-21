module Logger

require 'csv'

def log_data(target, data)
	data_log = CSV::open(target, 'a', headers: true) {
		|csv| csv << data
	}
end

def get_logged_data(target)
	CSV::read(target, headers: true) {
		|csv| csv
	}
end

def get_latest_data(target)
	csv = CSV::read(target, 'r') 
	csv[-1]
end

end