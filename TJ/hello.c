#include<stdio.h>
#include<sys/prctl.h>
#include<unistd.h>
int main(void)
{
	prctl(PR_SET_NAME,"ba");
	sleep(100); //防止进程立即退出，便于观察
	return 0;
}
