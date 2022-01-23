### xv6_study
This repository contains modified xv6 files along with docker file

Steps:
	1. git clone https://github.com/ddeka0/xv6_study
	2. cd xv6_study
	3. docker build -t ddeka/xv6-env .
	4. cd xv6-riscv
	5. docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv ddeka/xv6-env
	(Now you can start making the kernel and follow the course)
