require 'facter'
Facter.add('number_of_nodes') do
  setcode do
    result=""
    clustercmd="/sbin/pcs"
    if File.exists? clustercmd
      result=`#{clustercmd} cluster status 2> /dev/null | grep -i 'Nodes configured'| awk '{print \$1}'`
      if result == ""
        result="0"
      end
    else
     result="0"
    end
    "#{result}"
  end
end
