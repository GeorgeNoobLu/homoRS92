module module1
   integer n1
   character(len=5),allocatable :: IDlist(:)
   REAL(kind=4),allocatable::pw00m(:,:),pw12m(:,:)
   character(len=5) ID0,ID1,ID2
   character(len=1) block1
   character(len=4) block4
end module module1
    
program RH1
use module1
  implicit none
  integer i,j,k,year,month,day,hour
  character(len=60) record2
  REAL(kind=4)::pw00(492,31),pw12(492,31),pw0,pw1
call sub1()
open(unit=31,file='D:\研究生\homo\homoRS92\pw_sfc-300mb_monthly00.txt')
open(unit=32,file='D:\研究生\homo\homoRS92\pw_sfc-300mb_monthly12.txt')
pw00m=0.0
pw12m=0.0
do i=1,n1
    print*,IDlist(i)
    open(unit=21,file='D:\研究生\homo\homoRS92\'//IDlist(i)//'.dat')
  pw00=0.0
  pw12=0.0
  do while(.not.eof(21))
      read(21,'(a60)') record2
      !read(record2(2:6),'(a5)') ID0
	  read(record2(1:1),'(a1)') block1
      !if(ID0==IDlist(i))then
	  if(block1=='#')then
          read(record2(7:10),'(i4)') year
		  if(year.ge.1970)then
		  read(record2(11:12),'(i2)') month
          read(record2(13:14),'(i2)') day
		  read(record2(15:16),'(i2)') hour
		  read(record2(25:36),'(E12.4)') pw0
		  read(record2(37:48),'(E12.4)') pw1
          !print*,record2
          !print*,pw0,pw1
          !pause
			if((pw1.ge.0).and.(pw0.ge.0))then
		  	  if((hour.gt.5).and.(hour.lt.19))then
                pw12((12*(year-1970)+month),day)=pw0+pw1
				else
				pw00((12*(year-1970)+month),day)=pw0+pw1
			  end if
			end if	
          end if
      end if
  end do
  close(21)
  !print*,pw00(1,1:31)
  call sub2(i,pw00)
  call sub3(i,pw12)
  !print*,pw00m(i,1)
  write(31,'(492f9.4)') pw00m(i,1:492)
  write(32,'(492f9.4)') pw12m(i,1:492)
end do
  
end

subroutine sub2(k,pw)
use module1
implicit none
integer i,j,k,flag
REAL(kind=4)::pw(492,31),pwm
!allocate(IDlist(n1))
do i=1,492
    flag=0
	pwm=0.0
	do j=1,31
	if(pw(i,j).gt.0)then
	flag=flag+1
	pwm=pwm+pw(i,j)
    end if
	end do
	if(flag.gt.10)then
	pwm=pwm/(REAL(flag))
	pw00m(k,i)=pwm
    end if
end do
end subroutine sub2

subroutine sub3(k,pw)
use module1
implicit none
integer i,j,k,flag
REAL(kind=4)::pw(492,31),pwm
!allocate(IDlist(n1))
do i=1,492
    flag=0
	pwm=0.0
	do j=1,31
	if(pw(i,j).gt.0)then
	flag=flag+1
	pwm=pwm+pw(i,j)
    end if
	end do
	if(flag.gt.10)then
	pwm=pwm/(REAL(flag))
	pw12m(k,i)=pwm
    end if
end do
end subroutine sub3

    subroutine sub1()
use module1
implicit none
integer i
  open(unit=10, file='D:\研究生\homo\homoRS92\name3.txt')
  n1=0
  do while(.not.eof(10))
    read(unit=10, fmt="(a11)") ID0
	n1=n1+1!计算了ID总数，可用来传递定义可变数组
  enddo
  allocate(IDlist(n1))
  allocate(pw00m(n1,492))
  allocate(pw12m(n1,492))
  close(10)
  open(unit=10, file='D:\研究生\homo\homoRS92\name3.txt')
  do i=1,n1
     read(unit=10, fmt="(a5,a4)") IDlist(i),block4
  end do
  close(10)
end subroutine sub1
