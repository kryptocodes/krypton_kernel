# SPECTRUM KERNEL MANAGER
# Ramdisk file for profile based kernel management
# Implimentation inspired by Franco's fku profiles
# ARB Profiles

# Initialization
on property:sys.boot_completed=1
   # Set default profile on first boot
   exec u:r:init:s0 root root -- /init.spectrum.sh
   exec u:r:su:s0 root root -- /init.spectrum.sh
   # Enable Spectrum support


   setprop spectrum.support 1


   # Add kernel name
   setprop persist.spectrum.kernel AR_Beast

# Balance (default profile)
on property:persist.spectrum.profile=0
write /sys/devices/platform/kcal_ctrl.0/kcal_min 33
write /sys/devices/platform/kcal_ctrl.0/kcal_sat 273
write /sys/devices/platform/kcal_ctrl.0/kcal_val 252 
write /sys/devices/platform/kcal_ctrl.0/kcal_cont 258
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 200000
chmod 0444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive
chmod 0444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/devices/system/cpu/cpufreq/interactive/min_sample_time 30000
write /sys/devices/system/cpu/cpufreq/interactive/timer_rate 40000
write /sys/devices/system/cpu/cpufreq/interactive/timer_slack 60000
write /sys/devices/system/cpu/cpufreq/interactive/fast_ramp_down 1
write /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay "20000 300000:45000 400000:55000 800000:75000 998400:110000 1094400:175000 1209600:200000"
write /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq 200000
write /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load 99
write /sys/devices/system/cpu/cpufreq/interactive/target_loads "0 200000:50 200000:35 400000:45 400000:52 533330:59 800000:75 998400:90 1094400:95 1209600:99"
write /sys/devices/system/cpu/cpufreq/interactive/io_is_busy 0
write /sys/devices/system/cpu/cpufreq/interactive/fast_ramp_down 1
write /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration 0
write /sys/devices/system/cpu/cpufreq/interactive/powersave_bias 1
write /sys/devices/system/cpu/cpufreq/interactive/fastlane 0
write /sys/module/msm_thermal/parameters/temp_safety 1
write /sys/module/wakeup/parameters/enable_smb135x_wake_ws N
write /sys/module/wakeup/parameters/enable_si_ws N
write /sys/module/wakeup/parameters/enable_msm_hsic_ws N
write /sys/module/wakeup/parameters/enable_wlan_rx_wake_ws N
write /sys/module/wakeup/parameters/enable_wlan_ctrl_wake_ws N
write /sys/module/wakeup/parameters/enable_wlan_wake_ws N
write /sys/module/wakeup/parameters/enable_bluedroid_timer_ws N
write /sys/module/wakeup/parameters/enable_bluesleep_ws N
write /sys/module/wakeup/parameters/enable_ipa_ws N
write /sys/block/mmcblk1/queue/scheduler bfq
write /sys/block/mmcblk1/queue/read_ahead_kb 1024
write /sys/block/mmcblk0/queue/scheduler bfq
write /sys/block/mmcblk0/queue/read_ahead_kb 1024
write /sys/module/msm_thermal/parameters/temp_threshold 50
write /sys/module/msm_thermal/parameters/enabled 0
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/max_gpuclk 465000000
write /sys/module/adreno_idler/parameters/adreno_idler_active 1
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor msm-adreno-tz
write /sys/kernel/sched/arch_power 1
write /sys/module/state_notifier/parameters/enabled Y

# Performance
on property:persist.spectrum.profile=1
write /sys/devices/system/cpu/cpu0/online 1
write /sys/devices/system/cpu/cpu1/online 1
write /sys/devices/system/cpu/cpu2/online 1
write /sys/devices/system/cpu/cpu3/online 1
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor performance
chmod 0444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/module/msm_thermal/parameters/temp_threshold 90
write /sys/module/msm_thermal/parameters/enabled 0
write /sys/block/mmcblk1/queue/scheduler fiops
write /sys/block/mmcblk1/queue/read_ahead_kb 2048
write /sys/block/mmcblk0/queue/scheduler fiops
write /sys/block/mmcblk0/queue/read_ahead_kb 2048
write /sys/module/msm_thermal/parameters/temp_safety 0
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor performance
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/max_gpuclk 465000000
write /sys/module/adreno_idler/parameters/adreno_idler_active 0

# Battery
on property:persist.spectrum.profile=2
chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor darkness
chmod 0444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/module/msm_thermal/parameters/temp_threshold 40
write /sys/module/msm_thermal/parameters/enabled 1
write /sys/block/mmcblk1/queue/scheduler noop
write /sys/block/mmcblk1/queue/read_ahead_kb 1024
write /sys/block/mmcblk0/queue/scheduler noop
write /sys/block/mmcblk0/queue/read_ahead_kb 1024
write /sys/module/msm_thermal/parameters/temp_safety 1
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor simple_ondemand
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/max_gpuclk 310000000

# Gaming
on property:persist.spectrum.profile=3
write /sys/devices/system/cpu/cpu0/online 1
write /sys/devices/system/cpu/cpu1/online 1
write /sys/devices/system/cpu/cpu2/online 1
write /sys/devices/system/cpu/cpu3/online 1
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor elementalx
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
write /sys/module/msm_thermal/parameters/temp_threshold 70
write /sys/module/msm_thermal/parameters/enabled 0
write /sys/block/mmcblk1/queue/scheduler zen
write /sys/block/mmcblk1/queue/read_ahead_kb 1536
write /sys/block/mmcblk0/queue/scheduler zen
write /sys/block/mmcblk0/queue/read_ahead_kb 1536
write /sys/module/msm_thermal/parameters/enabled 0
write /sys/module/msm_thermal/parameters/temp_safety 0
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor msm-adreno-tz
write /sys/devices/soc.0/1c00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/max_gpuclk 465000000
write /sys/module/adreno_idler/parameters/adreno_idler_active 0

