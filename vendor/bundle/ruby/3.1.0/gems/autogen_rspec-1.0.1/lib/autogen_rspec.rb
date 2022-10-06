class ApplicationController < ActionController::Base
  after_filter :log_test
  
  def log_test
     begin
       puts "in log file"
       f = File.open('tmp/request/test.rb','a')
       temp = ''
       
       str = "it 'should ' do \n"
       str = str + "\n# cookies #{cookies.inspect} \n" if cookies
       if request.env['REQUEST_METHOD'] == 'GET' or request.env['REQUEST_METHOD'] == 'DELETE'
         str = str + "#{request.env['REQUEST_METHOD'].downcase} '#{request.env['REQUEST_URI']}',{'HTTP_ACCEPT' => '#{request.env['HTTP_ACCEPT']}'} \n"
       else
         temp = ap(CGI.unescape(request.raw_post)) rescue ''
         str = str + "\n# req = " + temp.to_s  + "\n\n"
         
         temp = ap(JSON.parse(CGI.unescape(request.raw_post))) rescue ''
         str = str + "\n# " + temp.to_s  + "\n\n"
         
         str = str + "#{request.env['REQUEST_METHOD'].downcase} '#{request.env['REQUEST_URI']}',CGI.escape(req),{'HTTP_ACCEPT' => '#{request.env['HTTP_ACCEPT']}'} \n"
       end
       
       str = str + "assert_equal #{status},status,@response.body \n"
       str = str + "assert_equal '#{response.content_type}', @response.content_type \n"
       
       if response.content_type == 'application/json'
         resp_hash = JSON.parse(response.body)
         keys = ap resp_hash.keys, {:index => false}
         str = str + 'resp_hash = JSON.parse(response.body)' + "\n"
         str = str + keys.inspect + '.each {|x| assert_equal true,resp_hash.has_key?(x),"Did not find key \#{x} in json"}' + "\n"
       else
         # str = str + "assert_equal #{response.body},@response.body\n"
     end
       str = str + "end\n"
       
     rescue Exception => e
       str = "Logging test error ... #{e}, #{e.backtrace}"
     end
     
    f.write("\n\n#{str}")
     f.fsync
 end
end
