export HISTFILESIZE=1000000
export HISTSIZE=1000000

alias aws2='ssh -i ~/.ssh/key_awsOnEdX.pem ec2-user@ec2-34-244-223-173.eu-west-1.compute.amazonaws.com'
alias aws3='ssh -i ~/.ssh/key_awsOnEdX.pem ec2-user@ec2-34-244-85-79.eu-west-1.compute.amazonaws.com'


alias pc00='ssh -t -L 5900:localhost:5900 apashnin@pcamsadmin00'
alias pc00con='open vnc://localhost:5900'


set bell-style none

echo "youkoso!"
#export PS1="[\h] \w > "
#export PS1="$SB_GREEN\u@\h$SB_NOCOLOR: $SB_BLUE\w$SB_GREEN\$(parse_git_branch)$SB_RED\$(parse_git_dirty)$SB_NOCOLOR $ "
export PS1="[\u@\h: \[\033[1m\033[32m\]\w \[\033[0m\]] "

#export PYTHONPATH=/user/apashnin/src/Gena/:~/usr/src/python_cern_2012/src/day3:~/usr/src/python_cern_2012/src/ParticleProject
#export PYTHONPATH=/Users/kowaraj/usr/bin
export PYTHONSTARTUP=~/.startup.py

alias py2np='python2.7 -i -c"import numpy as np"'

alias lxplus='ssh -X lxplus.cern.ch -l apashnin'
alias dev1='ssh -X cs-ccr-dev1 -l apashnin -o PubkeyAuthentication=no'
alias dev2='ssh -X cs-ccr-dev2 -l apashnin'
alias dev3='ssh -X cs-ccr-dev3 -l apashnin'
alias dev4='ssh -X cs-ccr-dev4 -l apashnin'
alias slc4='ssh -X cs-ccr-slc4 -l apashnin'
alias tunnel_60002_to_vol133='ssh -f apashnin@lxplus.cern.ch -L localhost:60002:cwe-513-vol133:22 -N'
alias tunnel_60003_to_pcbe15278='ssh -f apashnin@lxplus.cern.ch -L localhost:60003:pcbe15278:3389 -N'

### AMS ###
alias p0='ssh pcposp0 -l apashnin'
alias p1='ssh pcposp0 -l apashnin'
alias c0='ssh pcposc0 -l apashnin'
alias c1='ssh pcposc1 -l apashnin'

### end of AMS ### 

export PATH=$PATH:/usr/local/bin:~/usr/bin
#export PATH=$PATH:~/usr/clojure/:/usr/local/bin/:~/usr/src/:~/usr/lein/:~/usr/labrepl/script/:usr/jars:./:
#CLASSPATH=~/usr/src:~/usr/jars/*:~/usr/labrepl/lib/*
#export CLASSPATH

#alias ll='ls -lahG'

export JAVA_HOME=/Library/Java/Home
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:



# general path
CLASSPATH=~/usr/lib:~/usr/src:~/usr/labrepl:~/usr/labrepl/src:~/usr/labrepl/test:~/usr/labrepl/config:~/usr/labrepl/data:~/usr/labrepl/src/:~/usr/labrepl/classes/:

# labrepl's path
for f in ~/usr/labrepl/lib/*.jar; do
    CLASSPATH=$CLASSPATH:$f
done

# additional libs path
CLASSPATH=$CLASSPATH:~/usr/lib/clj-debug-repl/src
#export CATALINA_HOME=/Library/Tomcat/Home


#export PATH=/Users/kowaraj/usr/sbt/bin:$PATH

#export XMLBEANS_HOME=~/usr/xmlbeans
#export PATH=$PATH:$XMLBEANS_HOME/bin
#export CLASSPATH=$XMLBEANS_HOME/lib/xbean.jar:$CLASSPATH
#export CLASSPATH=$CLASSPATH:$XMLBEANS_HOME/lib/jsr173[_1.0]_api.jar

alias e="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias ll="ls -la"
#alias e='env TERM=xterm-255color /user/apashnin/local/bin/emacs -nw'



hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000e3,"HIDKeyboardModifierMappingDst":0x7000000e0}, {"HIDKeyboardModifierMappingSrc":0x7000000e0, "HIDKeyboardModifierMappingDst":0x7000000e3}]}'
