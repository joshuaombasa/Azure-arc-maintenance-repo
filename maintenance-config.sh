az maintenance configuration create \
  --resource-group myMaintenanceRG \
  --resource-name inGuestPatchMaintenanceConfig \
  --maintenance-scope InGuestPatch \
  --location eastus \
  --maintenance-window-duration "02:00" \
  --maintenance-window-recur-every "6Hours" \
  --maintenance-window-start-date-time "2025-01-13 08:06" \
  --maintenance-window-time-zone "E. Africa Standard Time" \
  --install-patches-linux-parameters package-name-masks-to-exclude="ppt" package-name-masks-to-include="apt" classifications-to-include="Other" \
  --install-patches-windows-parameters classifications-to-include="FeaturePack" \
  --reboot-setting "IfRequired" \
  --extension-properties InGuestPatchMode="User"


az maintenance assignment create \
  --resource-group myMaintenanceRG \
  --location eastus \
  --resource-name myVM \
  --resource-type virtualMachines \
  --provider-name Microsoft.Compute \
  --configuration-assignment-name myConfig \
  --maintenance-configuration-id "/subscriptions/12345678-90ab-cdef-1234-567890abcdef/resourcegroups/myMaintenanceRG/providers/Microsoft.Maintenance/maintenanceConfigurations/myConfig"
