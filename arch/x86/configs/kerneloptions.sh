# adds support for clientIP-based session affinity
sed -i 's/# CONFIG_NETFILTER_XT_MATCH_RECENT is not set/CONFIG_NETFILTER_XT_MATCH_RECENT=y/' ./arch/x86/configs/config-wsl-x86

# required modules for Cilium
sed -i 's/# CONFIG_NETFILTER_XT_TARGET_TPROXY is not set/CONFIG_NETFILTER_XT_TARGET_TPROXY=y/' ./arch/x86/configs/config-wsl-x86
sed -i 's/# CONFIG_NETFILTER_XT_TARGET_CT is not set/CONFIG_NETFILTER_XT_TARGET_CT=y/' ./arch/x86/configs/config-wsl-x86
sed -i 's/# CONFIG_NETFILTER_XT_MATCH_MARK is not set/CONFIG_NETFILTER_XT_MATCH_MARK=y/' ./arch/x86/configs/config-wsl-x86
sed -i 's/# CONFIG_NETFILTER_XT_MATCH_SOCKET is not set/CONFIG_NETFILTER_XT_MATCH_SOCKET=y/' ./arch/x86/configs/config-wsl-x86

# required modules for KVM
sed -i 's/# CONFIG_KVM_GUEST is not set/CONFIG_KVM_GUEST=y/g' ./arch/x86/configs/config-wsl-x86
sed -i 's/# CONFIG_ARCH_CPUIDLE_HALTPOLL is not set/CONFIG_ARCH_CPUIDLE_HALTPOLL=y/g' ./arch/x86/configs/config-wsl-x86
sed -i 's/# CONFIG_HYPERV_IOMMU is not set/CONFIG_HYPERV_IOMMU=y/g' ./arch/x86/configs/config-wsl-x86
sed -i '/^# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set/a CONFIG_PARAVIRT_CLOCK=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^# CONFIG_CPU_IDLE_GOV_TEO is not set/a CONFIG_CPU_IDLE_GOV_HALTPOLL=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_CPU_IDLE_GOV_HALTPOLL=y/a CONFIG_HALTPOLL_CPUIDLE=y' ./arch/x86/configs/config-wsl-x86
sed -i 's/CONFIG_HAVE_ARCH_KCSAN=y/CONFIG_HAVE_ARCH_KCSAN=n/g' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_HAVE_ARCH_KCSAN=n/a CONFIG_KCSAN=n' ./arch/x86/configs/config-wsl-x86

# required modules for OpenvSwitch
sed -i 's/# CONFIG_OPENVSWITCH is not set/CONFIG_OPENVSWITCH=y/' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_OPENVSWITCH=y/a OPENVSWITCH_VXLAN=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_OPENVSWITCH=y/a OPENVSWITCH_GENEVE=y' ./arch/x86/configs/config-wsl-x86

# required modules for MultiProtocol Label Switching
sed -i 's/# CONFIG_MPLS is not set/CONFIG_MPLS=y/' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_MPLS=y/a MPLS_ROUTING=y' ./arch/x86/configs/config-wsl-x86

# required modules for Network Service Header
sed -i 's/# CONFIG_NET_NSH is not set/CONFIG_NET_NSH=y/' ./arch/x86/configs/config-wsl-x86

# required modules for Multipath Hardware
sed -i 's/# CONFIG_DM_MULTIPATH is not set/CONFIG_DM_MULTIPATH=y/' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_DM_MULTIPATH=y/a DM_MULTIPATH_QL=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_DM_MULTIPATH=y/a DM_MULTIPATH_ST=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_DM_MULTIPATH=y/a DM_MULTIPATH_HST=y' ./arch/x86/configs/config-wsl-x86
sed -i '/^CONFIG_DM_MULTIPATH=y/a DM_MULTIPATH_IOA=y' ./arch/x86/configs/config-wsl-x86
