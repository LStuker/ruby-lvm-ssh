require 'rubygems'
require 'open4'
require 'net_client'

module LVM
  module External
    class ExternalFailure < RuntimeError; end

    def cmd(server,cmd)

      if server != 'localhost'
          ssh_user = AppConfig.ssh_user
          ssh_key = AppConfig.ssh_key
          cmd = "ssh -q -t -t -l #{ssh_user} #{server} '#{cmd}'"
#cmd = "ssh -q -t -t -l #{ssh_user} -i #{ssh_key} #{server} '#{cmd}'"
        #connection = NetClient.new
          #return connection.cmd(server,cmd)

      end


      output = []
      error = nil
      stat = Open4.popen4(cmd) do |pid, stdin, stdout, stderr|
          while line = stdout.gets
            output << line
            puts output
          end
          error = stderr.read.strip
      end

      if stat.exited?
        if stat.exitstatus > 0
          raise ExternalFailure, "Fatal error, `#{cmd}` returned #{stat.exitstatus} with '#{error}'"
        end
      elsif stat.signaled?
        raise ExternalFailure, "Fatal error, `#{cmd}` got signal #{stat.termsig} and terminated"
      elsif stat.stopped?
        raise ExternalFailure, "Fatal error, `#{cmd}` got signal #{stat.stopsig} and is stopped"
      end

      if block_given?

        return output.each { |l| yield l }
      else
        return output.join
      end

    end
    module_function :cmd

  end # module External
end # module LVM