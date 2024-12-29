# some colors
alias ls="ls -a --color=auto"
alias grep="grep --color=auto"

# run mpirun as root, it's alright since this is a container
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
