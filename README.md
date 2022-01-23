### xv6_study
This repository contains modified xv6 files along with docker file
Steps:
	
	1. git clone --recurse-submodules https://github.com/ddeka0/xv6_study.git
	2. cd xv6_study
	3. docker build -t ddeka/xv6-env .
	4. cd xv6-riscv
	5. docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv ddeka/xv6-env
	(Now you can start making the kernel and follow the course)
	6. Once you are inside the container you might see something like 
	   this 
	   xv6@488b7db3a8fb:~$
	   So, do an `ls` to see if the `xv6-riscv` directory is available or not.
	7. cd xv6-riscv
	8. make
	9. make qemu
	(Now you will be promted with xv6 OS terminal)
