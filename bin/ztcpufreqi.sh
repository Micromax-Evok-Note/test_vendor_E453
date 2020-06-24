#!/system/bin/sh


show_cpufreq()
{
    echo SMP CPU Policy Info:
    echo this policy controls following cpus:
    echo affected_cpus=`cat affected_cpus`
    echo related_cpus=`cat related_cpus`
    echo cpu physical freqs:
    echo cpuinfo_cur_freq=`cat cpuinfo_cur_freq`
    echo cpuinfo_max_freq=`cat cpuinfo_max_freq`
    echo cpuinfo_min_freq=`cat cpuinfo_min_freq`
    echo cpuinfo_transition_latency=`cat cpuinfo_transition_latency`
    echo freq table levels:
    echo scaling_available_frequencies=`cat scaling_available_frequencies`
    echo installed freq governors:
    echo scaling_available_governors=`cat scaling_available_governors`
    echo current running governor:
    echo scaling_governor=`cat scaling_governor`
    echo current running governor setting:
    echo scaling_max_freq=`cat scaling_max_freq`
    echo scaling_min_freq=`cat scaling_min_freq`
    echo scaling_cur_freq=`cat scaling_cur_freq`
    echo current online freq driver:
    echo scaling_driver=`cat scaling_driver`
    echo freq status:
    echo time_in_state=
    cat stats/time_in_state
    echo total_trans=`cat stats/total_trans`
    echo trans_table=
    cat stats/trans_table

    cd ../../cpufreq

    echo all_time_in_state=
    cat all_time_in_state

    cd interactive
    echo governor detail: 
    echo above_hispeed_delay=`cat  above_hispeed_delay`
    echo boost=`cat boost`
    echo boostpulse=`cat boostpulse`
    echo boostpulse_duration=`cat boostpulse_duration`
    echo go_hispeed_load=`cat go_hispeed_load`
    echo hispeed_freq=`cat hispeed_freq`
    echo io_is_busy=`cat io_is_busy`
    echo min_sample_time=`cat min_sample_time`
    echo target_loads=`cat target_loads`
    echo timer_rate=`cat timer_rate`
    echo timer_slack=`cat timer_slack`

}


cd /sys/devices/system/cpu/cpu0/cpufreq

show_cpufreq


