#
# main.rb
#

module Heist

  GEM_RE = /^([^ ]+) \(([0-9\., ]+)\)/

  class << self
    def usage
      prog = ($0[0] == ?. ? $0 : $0.split(/\//)[-1])
      $stderr.write("ERROR: #{prog} requires piped input, e.g.\n" +
                    "  $ gem list | #{prog}\n" +
                    "  $ #{prog} < gemlist.txt\n")
    end

    def pull!
      output = []

      if $stdin.tty?
        usage
        exit 1
      else
        gemlist = $stdin.read
        gemlist.scan(GEM_RE) do |match|
          gem, versions = match
          versions = versions.split(/, /)

          versions.reverse.each do |version|
            output << ("gem install #{gem}" +
                       " --version=#{version}" +
                       " --no-ri" +
                       " --no-rdoc")
          end
        end

        puts output.join("\n")
        exit 0
      end
    end
  end

end
