#!/system/bin/sh

procid=$1
echo proc $procid info:
cd /proc/$procid/

echo env vars:
cat environ
echo program:
ll exe
echo oom info:
echo oom_adj=`cat oom_adj`
echo oom_score=`cat oom_score`
echo oom_score_adj=`cat oom_score_adj`
echo sched:
cat sched | grep policy
cat sched | grep prio
echo parentid=`cat status | grep PPid`
echo uid=`cat status | grep Uid`
echo gid=`cat status | grep Gid`
echo thread num=`cat status | grep Threads`
echo "Capability bitmap:the proc holds the cap assigned by some prog that skips the uid,gid."
echo "the progs:rpm -ql libcap-2.16-5.2.el6.i686.setcap cap_chown=eip /bin/chown"
echo "apis:cap_get_proc();cap_set_proc();capget();capset()"
echo "Inherit=forked child's cap inheriting"
echo permit > effective
echo capabiltiy Inherit  =`cat status | grep CapInh`
echo capabiltiy Permit   =`cat status | grep CapPrm`
echo capabiltiy Effective=`cat status | grep CapEff`
echo cpu mask is what cpus the proc can use
echo cpu mask=`cat status | grep Cpus_allowed`
echo std in,out,err:
ll 0
ll 1
ll 2





