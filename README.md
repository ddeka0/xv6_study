#### xv6_study
This repository contains modified xv6 files along with docker file

------------------

What is xv6 ? https://pdos.csail.mit.edu/6.828/2021/xv6.html

Why would you use this repo to start learning xv6 ? 

	This repo has the xv6 source code linked as a git submodule to a specific commit.
	It also have qemu 5.1.0 installed for riscv64.
	Both of these are important, as the xv6 source code needs a specific env
	to build+run successfully.
	If you start with a fresh ubuntu or mac and start following steps mentioned in the
	course page, you might end up incompatible binaries for some important tools.
	(for example https://stackoverflow.com/questions/66390948/make-qemu-on-xv6-riscv-gets-stucked-at-qemu-system-riscv64-command)
	
	Now, you can avoid those annoying tool issues by using the docker images provided in this repo.

------------------


#### Steps:

Steps for using pre-built container from docker hub:

##### Before following steps, please install `docker` and `git` in your system (win/linux/macos)


Steps to start using xv6 OS 

	1. git clone --recurse-submodules https://github.com/ddeka0/xv6_study.git
	2. cd xv6_study/xv6-riscv
	3. docker pull ddeka/xv6-env-updated
	4. docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv ddeka/xv6-env-updated

	(Now you can start making the kernel and follow the course)

	Once you are inside the container you might see something like 
	   this 
	   xv6@488b7db3a8fb:~$
	   So, do an `ls` to see if the `xv6-riscv` directory is available or not.

	5. cd xv6-riscv
	6. make
	7. make qemu
	(Now you will be promted with xv6 OS terminal)

	Once you are done woking with `xv6` terminal, then exit from it using `Ctrl+A  X`

------------------

Steps to use gdb

	[1-7] same steps as above

	8. make CPUS=1 qemu-gdb ( This is going to start a gdb server )

	Now open another terminal on the same running container and go to `xv6-riscv` dir
	(use docker exec command to start a new bash shell)

	9. gdb-multiarch

	Now if you see the something as following


	```
	xv6@e172065b470c:~/xv6-riscv$ gdb-multiarch
	GNU gdb (Ubuntu 9.2-0ubuntu1~20.04.1) 9.2
	Copyright (C) 2020 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
	Type "show copying" and "show warranty" for details.
	This GDB was configured as "x86_64-linux-gnu".
	Type "show configuration" for configuration details.
	For bug reporting instructions, please see:
	<http://www.gnu.org/software/gdb/bugs/>.
	Find the GDB manual and other documentation resources online at:
	    <http://www.gnu.org/software/gdb/documentation/>.

	For help, type "help".
	Type "apropos word" to search for commands related to "word".
	The target architecture is assumed to be riscv:rv64
	warning: No executable has been specified and target does not support
	determining executable automatically.  Try using the "file" command.
	0x0000000000001000 in ?? () 
	```
------------------

Now you can follow along using the following point in time of the 3rd lecture of 

https://pdos.csail.mit.edu/6.828/2021/schedule.html

https://youtu.be/o44d---Dk4o?t=4071

------------------

Steps for building the image from scratch:
	
	1. git clone --recurse-submodules https://github.com/ddeka0/xv6_study.git
	2. cd xv6_study/xv6-riscv
	3. docker build -t ddeka/xv6-env .
	4. docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv ddeka/xv6-env
	(Now you can start making the kernel and follow the course)
	5. Once you are inside the container you might see something like 
	   this 
	   xv6@488b7db3a8fb:~$
	   So, do an `ls` to see if the `xv6-riscv` directory is available or not.
	6. cd xv6-riscv
	7. make
	8. make qemu
	(Now you will be promted with xv6 OS terminal)
	
	
