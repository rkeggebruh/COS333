program statistics_program
    implicit none
    integer :: arr(5)
    integer :: smallest, largest, mode_val

    ! Function prototypes
    interface
        subroutine readData(arr)
            integer, intent(out) :: arr(:)
        end subroutine readData

        integer function findSmallest(arr)
            integer, intent(in) :: arr(:)
        end function findSmallest

        integer function findLargest(arr)
            integer, intent(in) :: arr(:)
        end function findLargest

        integer function mode(arr)
            integer, intent(in) :: arr(:)
        end function mode
    end interface

    ! Call readData to populate the array
    call readData(arr)

    ! Call other functions to get required statistics
    smallest = findSmallest(arr)
    largest = findLargest(arr)
    mode_val = mode(arr)

    ! Print out the statistics
    print *, 'Smallest value:', smallest
    print *, 'Largest value:', largest
    print *, 'Mode:', mode_val

contains

    subroutine readData(arr)
        integer, intent(out) :: arr(:)
        integer :: i

        print *, 'Enter five integer values:'
        do i = 1, 5
            read(*, *) arr(i)
        end do

    end subroutine readData

    integer function findSmallest(arr)
        integer, intent(in) :: arr(:)
        integer :: i, min_val

        min_val = arr(1)
        do i = 2, size(arr)
            if (arr(i) < min_val) min_val = arr(i)
        end do

        findSmallest = min_val
    end function findSmallest

    integer function findLargest(arr)
        integer, intent(in) :: arr(:)
        integer :: i, max_val

        max_val = arr(1)
        do i = 2, size(arr)
            if (arr(i) > max_val) max_val = arr(i)
        end do

        findLargest = max_val
    end function findLargest

    integer function mode(arr)
        integer, intent(in) :: arr(:)
        integer :: i, j, count, max_count, mode_val

        max_count = 0
        do i = 1, size(arr)
            count = 0
            do j = 1, size(arr)
                if (arr(j) == arr(i)) count = count + 1
            end do
            if (count > max_count) then
                max_count = count
                mode_val = arr(i)
            end if
        end do

        mode = mode_val
    end function mode

end program statistics_program
