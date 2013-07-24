! A Discontinuous Galerkin implementation for
! Semiclassical Botlzmann ES-BGK for one-dimensional space.
!
! coded and modified by,
! Manuel Diaz, NTU, 2013.07.13
! f99543083'at'.ntu.edu.tw
!
program hello
    ! Load modules
    use mathmodule      ! linear Algebra functions
    use dispmodule      ! matlab display functions
    use tecplotmodule   ! write to tecplot functions

    ! Define Variables
    implicit none
    integer, parameter   :: n=3, m=3
    real, dimension(n,m) :: A,B !Matrix Arrays
    real, dimension(10)  :: x,f !Vector arrays
    integer :: idnumber,np
    character(len = 100) :: output_file = 'myresults.plt'
    real T1, T2

    ! Print message
    print *, 'This is the beginning of DG-ESBGK'

    ! Calculations and displays
    A = transpose( reshape( (/1,2,3,4,5,6,7,8,9/),shape(A)))
    B = transpose( reshape( (/2,0,0,0,2,0,0,0,2/),shape(B)))
    call disp('A = ',A)
    call disp('B = ',B)

    x = (/0,1,2,3,4,5,6,7,8,9/)
    f = sin(x)
    np = size(f)

    ! Calculate CPU time
    call cpu_time(T1)
    print *, 'time for calcualations', T1, 'seconds.'

    ! write to tecplot file
    call tecplot_write_open(output_file,idnumber) ! open output file and identified No.
        print *, ' '
        print *, 'Opening output file with id No.: ',idnumber
    call tecplot_write_header(idnumber,'Line data','"X","F"') ! write header.
        print *, ' '
        print *, 'Writing the Tecplot header'
    call tecplot_write_xy_line(idnumber,np,x,f) ! write data to file
        print *, ' '
        print *, 'Write data "X","F" to file'
    call tecplot_write_close(idnumber) ! close file
        print *, ' '
        print *, 'Number of data point writen was: ',np

    ! Calculate CPU Time
    call cpu_time(T2)
    print *, 'time to write file', T2-T1, 'seconds.'

end program