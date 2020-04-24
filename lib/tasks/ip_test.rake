require 'rest-client'

namespace :ip_test do
    desc 'ip test '
    task :test => :environment do |t, args|

            @ips = []

        Dir::foreach("#{__dir__}/ips/"){|f|

            next if f == '.' || f == '..'

            file = File.read("#{__dir__}/ips/#{f}")
            data = JSON.parse(file)
            ips = data.first["d"]
            @ips += ips
        }

        ip_ok = []
        @ips.each do |ip|
            
            address = ip.split(":")

            begin

            resp = RestClient::Request.execute(method: :get, url: 'http://m.fang.com', proxy: "#{address[2]}://#{address[0]}:#{address[1]}",
            timeout: 2)
            ip_ok << ip.downcase
            rescue => e
                # p e
            end
        end

        p ip_ok


    end
end





