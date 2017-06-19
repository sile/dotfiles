touch ~/.ssh-agent-info
source ~/.ssh-agent-info
ssh-add -l > /dev/null
if [ $status = 2 ]
        ssh-agent -c > ~/.ssh-agent-info
        source ~/.ssh-agent-info
end

if not ssh-add -l > /dev/null
        ssh-add
end
