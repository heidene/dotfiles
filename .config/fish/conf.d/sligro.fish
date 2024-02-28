function goToAEMProvisioning
  pushd /Users/$USER/Code/Acolad/Sligro/aem-provisioning
  eval $argv
  popd
end

function vm-status
 goToAEMProvisioning ./vm/scripts/vm-status.sh
end
function vm-prepare
  goToAEMProvisioning ./vm/scripts/vm-prepare.sh $argv
end
function vm-launch
  goToAEMProvisioning ./vm/scripts/vm-launch.sh $argv
end
function vm-ssh
  goToAEMProvisioning ./vm/scripts/vm-ssh.sh $argv
end
function vm-provision
  goToAEMProvisioning ./vm/scripts/vm-provision.sh $argv
end
function vm-shutdown
  goToAEMProvisioning ./vm/scripts/vm-shutdown.sh $argv
end
function vm-destroy
  goToAEMProvisioning ./vm/scripts/vm-destroy.sh $argv
end
