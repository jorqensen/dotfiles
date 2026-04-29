function upgrade-system --description "Upgrade system packages"
    sudo apt update && \
    sudo apt upgrade -y && \
    sudo apt autoremove -y && \
    sudo apt clean
end
