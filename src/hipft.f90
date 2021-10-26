!#######################################################################
!
!    ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄
!   ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
!   ▐░▌       ▐░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀█░█▀▀▀▀
!   ▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌▐░▌               ▐░▌
!   ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░▌
!   ▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌
!   ▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀      ▐░▌
!   ▐░▌       ▐░▌     ▐░▌     ▐░▌          ▐░▌               ▐░▌
!   ▐░▌       ▐░▌ ▄▄▄▄█░█▄▄▄▄ ▐░▌          ▐░▌               ▐░▌
!   ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░▌               ▐░▌
!    ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀            ▀                 ▀
!
! ****** HipFT: High Performance Flux Transport.
!
!        Authors:  Ronald M. Caplan
!                  Jon A. Linker
!
!        Predictive Science Inc.
!        www.predsci.com
!        San Diego, California, USA 92121
!
!#######################################################################
! Copyright 2021 Predictive Science Inc.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!    http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
! implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!#######################################################################
module ident
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      character(*), parameter :: cname='HipFT'
      character(*), parameter :: cvers='0.1.0'
      character(*), parameter :: cdate='10/25/2021'
!
end module
!#######################################################################
module number_types
!
!-----------------------------------------------------------------------
! ****** Basic number types.
! ****** This module is used to set the default precision for REALs.
!-----------------------------------------------------------------------
!
      use iso_fortran_env
!
!-----------------------------------------------------------------------
!
      implicit none
!
      integer, parameter :: KIND_REAL_4=REAL32
      integer, parameter :: KIND_REAL_8=REAL64
      integer, parameter :: KIND_REAL_16=max(REAL128,REAL64)
!
      integer, parameter :: r_typ=KIND_REAL_8
!
end module
!#######################################################################
module constants
!
!-----------------------------------------------------------------------
! ****** Constants in r_typ precision for use throughout the code.
! ****** Used for simplicity and readability.
!-----------------------------------------------------------------------
!
      use number_types
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ), parameter :: zero=0.0_r_typ
      real(r_typ), parameter :: one=1.0_r_typ
      integer*8,   parameter :: one_int=1
      real(r_typ), parameter :: two=2.0_r_typ
      integer*8,   parameter :: two_int=2
      real(r_typ), parameter :: three=3._r_typ
      integer*8,   parameter :: three_int=3
      real(r_typ), parameter :: four=4._r_typ
      integer*8,   parameter :: four_int=4
      real(r_typ), parameter :: six=6._r_typ
      real(r_typ), parameter :: nine=9._r_typ
      real(r_typ), parameter :: ten=10._r_typ
      real(r_typ), parameter :: sixteen=16._r_typ
      real(r_typ), parameter :: half=0.5_r_typ
      real(r_typ), parameter :: quarter=0.5_r_typ
      real(r_typ), parameter :: twentyfive=25.0_r_typ
      real(r_typ), parameter :: twentyfour=24.0_r_typ
!
      real(r_typ), parameter :: pi=3.1415926535897932_r_typ
      real(r_typ), parameter :: pi_i=0.3183098861837907_r_typ
      real(r_typ), parameter :: twopi=6.2831853071795864_r_typ
      real(r_typ), parameter :: twopi_i=0.15915494309189535_r_typ
!
      real(r_typ), parameter :: rsun_m=6.96e8_r_typ
!
      real(r_typ), parameter :: &
                         diff_km2_s_to_rs2_s=2.0643413925221e-12_r_typ
      real(r_typ), parameter :: &
                         diff_km2_s_to_rs2_hr=7.43162901307967e-09_r_typ
      real(r_typ), parameter :: &
                         km_s_to_rs_hr=0.005172413793103448_r_typ
      real(r_typ), parameter :: &
                         m_s_to_rs_hr=5.172413793103448e-06_r_typ
      real(r_typ), parameter :: &
                         km_s_to_rs_s=1.4367816091954023e-06_r_typ
!
      real(r_typ), parameter :: small_value=tiny(one)
      real(r_typ), parameter :: safety=0.95_r_typ
!
end module
!#######################################################################
module input_parameters
!
!-----------------------------------------------------------------------
! ****** Input parameters.
!-----------------------------------------------------------------------
!
      use number_types
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      logical        :: verbose = .false.
!
      character(512) :: initial_field_filename = 'br_input.h5'
      character(512) :: output_field_root_filename = 'br'
!
! ****** Validation Mode ********
!
      logical        :: validation_run=.false.
!
! ****** Restarts ********
!
      logical        :: restart_run = .false.
      character(512) :: restart_file = ' '
!
! ****** Time ********
!
      real(r_typ)    :: time_end = one
      real(r_typ)    :: time_output_cadence = zero
      real(r_typ)    :: time_restart_cadence = zero
!
! ****** Timestep ********
!
      real(r_typ)    :: dt_max_increase_fac = 0.1_r_typ
      real(r_typ)    :: dt_min = 1.0e-16_r_typ
      real(r_typ)    :: dt_max = huge(one)
!
! ****** Algorithm options.
!  [RMC] This should be an int...   ADA vs DAD vs ADRDA vs DARAD etc.
      logical :: strang_splitting = .false.
!
!-----------------------------------------------------------------------
!
! ****** FLOWS ********
!
! ****** Activate the flow advance.
!
      logical :: advance_flow = .false.
!
! ****** Flow files (currently static).
!
      character(512) :: flow_vt_filename = ' '
      character(512) :: flow_vp_filename = ' '
!
! ****** Add a rigid rotation vp velocity (km/s) of omega*sin(theta).
!
      real(r_typ)    :: flow_vp_rigid_omega = 0.
!
! ****** Built-in differential roation and meridianal flow models.
! ****** For each, setting "1" sets the model used in the AFT code.
! ****** Setting "2" sets the model used in the MAS code?
!
      integer :: flow_dr_model = 0
      integer :: flow_mf_model = 0
!
! ****** Algorithm options.
! ****** 1: Upwind. Can set to central differencing with upwind=0?
!
      integer :: flow_num_method = 1
!
! ****** Upwind coefficient.
!
      real(r_typ) :: upwind = 1._r_typ
!
!-----------------------------------------------------------------------
!
! ****** DIFFUSION ********
!
      logical :: advance_diffusion = .false.
!
      real(r_typ)    :: diffusion_coef_constant = zero
      character(512) :: diffusion_coef_filename = ' '
      logical        :: diffusion_coef_grid = .false.
      real(r_typ)    :: diffusion_coef_factor = diff_km2_s_to_rs2_hr
      real(r_typ)    :: diffusion_coef_t_fac = one
      real(r_typ)    :: diffusion_coef_p_fac = one
!
! ****** Algorithm options.
!
! ****** Select diffusion algorithm.
! ******   1: Explicit Euler (1st-order)
! ******   2: Explicit RKL2 Super Time-stepping (2nd-order)
! ******   3: Explicit RKG2 Super Time-stepping (2nd-order)
!
      integer :: diffusion_num_method = 3
!
! ****** Set number of diffusion subcycles per flow step.
! ****** For diffusion-only runs, this should be ~50.
! ****** For flow+diffusion runs, this can be ~1.
!
      integer :: diffusion_subcycles = 30
!
!-----------------------------------------------------------------------
!
! ****** SOURCES ********
!
      logical :: advance_source = .false.
      character(512) :: source_filename = ' '
!
!-----------------------------------------------------------------------
!
! ****** DATA ASSIMILATION ********
!
      logical :: assimilate_data = .false.
!
end module
!#######################################################################
module globals
!
!-----------------------------------------------------------------------
! ****** Internal global variables.
!-----------------------------------------------------------------------
!
      use number_types
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Current time.
!
      real(r_typ) :: time = 0.
!
! ****** Current time-step.
!
      real(r_typ) :: dtime_global = huge(1.0_r_typ)
!
! ****** Current explicit Euler diffusion stable time-step.
!
      real(r_typ) :: dtime_diff_euler
!
! ****** Current output file sequence number.
!
      integer*8 :: output_seq = 0
!
! ****** Flag to indicate the flow needs updating.
!
      logical :: flow_needs_updating = .true.
!
! ****** Flag to indicate the time step needs updating.
!
      logical :: timestep_needs_updating = .true.
!
! ****** Flag to indicate the stable flow time step needs updating.
!
      logical :: timestep_flow_needs_updating = .true.
!
! ****** Flag to indicate the diffusion time step needs updating.
!
      logical :: timestep_diff_needs_updating = .true.

!
end module
!#######################################################################
module mesh
!
      use number_types
!
      implicit none
!
      integer :: nt,ntm,ntm1,ntm2
      integer :: np,npm,npm1,npm2
!
      real(r_typ) :: d2t_j1,d2t_jntm1
!
      real(r_typ), dimension(:), allocatable :: t,p
      real(r_typ), dimension(:), allocatable :: th,ph
      real(r_typ), dimension(:), allocatable :: dt,dth,dp,dph
      real(r_typ), dimension(:), allocatable :: dt_i,dth_i,dp_i,dph_i
      real(r_typ), dimension(:), allocatable :: st,sth,ct,cth
      real(r_typ), dimension(:), allocatable :: st_i
!
end module
!#######################################################################
module fields
!
      use number_types
!
      implicit none
!
!  [RMC] Make f->br fe->br_old?
      real(r_typ), dimension(:,:), allocatable :: f
      real(r_typ), dimension(:,:), allocatable :: fout
      real(r_typ), dimension(:), allocatable :: pout
      real(r_typ), dimension(:,:), allocatable :: fe
      real(r_typ), dimension(:,:), allocatable :: diffusion_coef
      real(r_typ), dimension(:,:), allocatable :: source
      real(r_typ), dimension(:,:), allocatable :: vt
      real(r_typ), dimension(:,:), allocatable :: vp
!
end module
!#######################################################################
module sts
!
      use number_types
!
      implicit none
!
      integer*8 :: sts_s
!
      real(r_typ), dimension(:), allocatable :: sts_uj
      real(r_typ), dimension(:), allocatable :: sts_vj
      real(r_typ), dimension(:), allocatable :: sts_ubj
      real(r_typ), dimension(:), allocatable :: sts_gj
      real(r_typ), dimension(:), allocatable :: sts_b
      real(r_typ), dimension(:,:), allocatable :: y0
      real(r_typ), dimension(:,:), allocatable :: tMy0
      real(r_typ), dimension(:,:), allocatable :: Mym1
      real(r_typ), dimension(:,:), allocatable :: yjm1
      real(r_typ), dimension(:,:), allocatable :: yjm2
!
end module
!#######################################################################
module matrix_storage
!
      use number_types
!
      implicit none
!
      real(r_typ), dimension(:,:,:), allocatable :: coef
!
end module
!#######################################################################
module timing
!
      use number_types
!
      implicit none
!
      real(r_typ) :: wtime_tmp = 0.
!
      real(r_typ) :: wtime_setup = 0.
      real(r_typ) :: wtime_update = 0.
      real(r_typ) :: wtime_flux_transport = 0.
      real(r_typ) :: wtime_flux_transport_advection = 0.
      real(r_typ) :: wtime_flux_transport_diffusion = 0.
      real(r_typ) :: wtime_source = 0.
      real(r_typ) :: wtime_analysis = 0.
      real(r_typ) :: wtime_io = 0.
!
      real(r_typ) :: wtime_total = 0.
!
end module
!#######################################################################
module rp1d_def
!
!-----------------------------------------------------------------------
! ****** Define a structure to hold a REAL 1D pointer.
!-----------------------------------------------------------------------
!
      use number_types
!
      implicit none
!
      type :: rp1d
        real(r_typ), dimension(:), pointer :: f
      end type
!
end module
!#######################################################################
module sds_def
!
!-----------------------------------------------------------------------
! ****** Definition of the SDS data structure.
!-----------------------------------------------------------------------
!
      use number_types
      use rp1d_def
!
      implicit none
!
      integer, parameter, private :: mxdim=3
!
      type :: sds
        integer :: ndim
        integer, dimension(mxdim) :: dims
        logical :: scale
        logical :: hdf32
        type(rp1d), dimension(mxdim) :: scales
        real(r_typ), dimension(:,:,:), pointer :: f
      end type
!
end module
!#######################################################################
module read_2d_file_interface
      interface
        subroutine read_2d_file (fname,ln1,ln2,f,s1,s2,ierr)
        use number_types
        use ident
        use sds_def
        use timing
        implicit none
        character(*) :: fname
        real(r_typ), dimension(:,:), allocatable :: f
        real(r_typ), dimension(:), allocatable :: s1,s2
        integer :: ln1,ln2,ierr
        real(r_typ) :: t1
        end subroutine
      end interface
end module
!#######################################################################
module write_2d_file_interface
      interface
        subroutine write_2d_file (fname,ln1,ln2,f,s1,s2,ierr)
        use number_types
        use ident
        use sds_def
        use timing
        implicit none
        character(*) :: fname
        real(r_typ), dimension(:,:), allocatable :: f
        real(r_typ), dimension(:), allocatable :: s1,s2
        integer :: ln1,ln2,ierr
        real(r_typ) :: t1
        end subroutine
      end interface
end module
!#######################################################################
program HIPFT
!
!-----------------------------------------------------------------------
!
      use iso_fortran_env
      use number_types
      use ident
      use input_parameters
      use constants
      use globals
      use timing
      use fields
      use mesh
      use write_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: t1,wtime
      integer*8 :: ntime = 0
      integer :: ierr
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
      call setup
!
! ****** Need to call analysis and output steps here so that we get
! ****** initial condition analysis and file output.
!
!      call analysis_step
!      call output_step
!
! ----- MAIN LOOP-------------------------------------
!
      write (*,*)
      write (*,*) '>running'
      write (*,*)
      flush(OUTPUT_UNIT)
!
      do
!
        ntime = ntime + 1
!
! ****** Update prescribed quantities including data assimilation and/or
! ****** flows and timestep.
!
        call update_step
!
        if (verbose) then
          write(*,'(a,i8,a,f12.6,a,f12.6,a,f12.6)')    &
                  'Step: ',ntime,'  Time:',time,' /',    &
                  time_end,'  dt:',dtime_global
          flush(OUTPUT_UNIT)
        endif
!
! ****** Evolve the field for one timestep.
!
        call flux_transport_step
!
        time = time + dtime_global

        if (verbose) then
          write(*,'(a,i8,a,f12.6,a,f12.6,a,f12.6)')    &
                  'Completed Step: ',ntime,'  Time:',time,' /',    &
                  time_end,'  dt:',dtime_global
          flush(OUTPUT_UNIT)
        endif
!
!       call analysis_step         ->  Histories, etc.
!           analyze_flux (+,-,total,balance for all realizations)
!           analyze_br (min,max,mean,minabs,maxabs,meanabs)
!
!       call output_step           ->  Map output in h5.
!           output_map  [META DATA!!]
!           output_flow?
!           output_histories
!           output_restart (special file or can this be
!                           done with any map output?)
!
!       call is_the_run_over
!           check_tmax
        if (time .ge. time_end) exit
!           check_stoprun
!           check_wallclock
!           output_final_restart?
      enddo
!
! ----- END MAIN LOOP----------------------------------
!
! ****** Write the final Br map.
!
!$acc update self(f)
!
      allocate (fout(npm-1,ntm))
      allocate (pout(npm-1))
      fout(:,:) = transpose(f(:,1:npm-1))
      pout(:) = p(1:npm-1)
      call write_2d_file((trim(output_field_root_filename)//'_final.h5') &
                         ,npm-1,ntm,fout,pout,t,ierr)
      deallocate (fout,pout)
!
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### Could not write the output data set.'
        write (*,*) 'IERR (from WRHDF) = ',ierr
        write (*,*) 'File name: ', &
                     trim(output_field_root_filename)//'_final.h5'
        call exit (1)
      else
        write(*,*) ' '
        write(*,*) 'Final 2D data written out to ', &
                   trim(output_field_root_filename)//'_final.h5'
      endif
!
!     call finalize
      write(*,*)
      write(*,*) "Run completed at:"
      call timestamp
      write(*,*)
!
      wtime_total = wtime() - t1
!
      write(*,*) "Wall clock time (seconds): ",wtime_total
      write(*,*) "--> Setup time:",wtime_setup
      write(*,*) "--> Update time:",wtime_update
      write(*,*) "--> Flux transport time:",wtime_flux_transport
      write(*,*) "    --> Advecton time:",wtime_flux_transport_advection
      write(*,*) "    --> Diffusion time:",wtime_flux_transport_diffusion
      write(*,*) "    --> Source time:",wtime_source
      write(*,*) "--> Analysis time:",wtime_analysis
      write(*,*) "--> I/O time:",wtime_io
      write(*,*)
!
!-----------------------------------------------------------------------
!
end program HIPFT
!#######################################################################
!          write (*,*) '*** Flow:      1st-order Euler ***'
!                        '*** Diffusion: 1st-order Euler ***'
!          write (*,*) 'Time-step (for stability)   = ',dtime_global
!          write (*,*) 'Number of time steps needed = ',ntime
!               write (*,*) '*** Flow:      1st-order Euler ***'
!                       '*** Diffusion: 2nd-order RKL2  ***'
!          write (*,*) 'Super-time-step used      (dt_sts) = '
!          write (*,*) 'Euler time-step           (dt_exp) = ',dtime_diff
!          write (*,*) 'STS factor         (dt_sts/dt_exp) = ',
!          write (*,*) 'Number of iterations/superstep (s) = ',sts_s
!          write (*,*) 'Number of super-steps       (Nsts) = ',ntime_sts
!          write (*,*) 'Total STS iterations per flow step (Niter) = ', &
!                                                      ntime_sts*sts_s
!          write (*,*) 'Euler iterations needed per flow step (Nexp) = ' &
!                                                          ,ntime_diff
!          write (*,*) 'Potential max speedup of visc due to STS   = ', &
!                                ntime_diff/(one*ntime_sts*sts_s),'X'
!#######################################################################
subroutine setup
!
!-----------------------------------------------------------------------
!
! ****** Setup the code run.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use timing
      use fields
      use mesh
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: wtime
!
!-----------------------------------------------------------------------
!
      wtime_tmp = wtime()
!
      call read_input
!
      if (restart_run) then
!        call load_restart
         print*,'RESTARTS ARE NOT IMPLEMENTED YET.'
         stop
      else
        call load_initial_condition
      end if
!
! ****** Allocate flow arrays.
!
      if (advance_flow) then
        allocate (vt(nt,np))
        allocate (vp(nt,np))
        vt(:,:) = 0.
        vp(:,:) = 0.
!$acc enter data copyin(vt,vp)
      end if
!
      call set_unchanging_quantities
!
!     call create_and_open_output_log_files
!
      call write_welcome_message
!
      wtime_setup = wtime() - wtime_tmp
!
end subroutine
!#######################################################################
subroutine write_welcome_message
!
!-----------------------------------------------------------------------
!
! ****** Write welcome message
!
!-----------------------------------------------------------------------
!
      use input_parameters
      use mesh
      use globals
      use fields
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      write (*,*)
      write (*,*) ''
      write (*,*) ' ****** HipFT: High Performance Flux Transport.'
      write (*,*) ''
      write (*,*) '        Authors:  Ronald M. Caplan'
      write (*,*) '                  Jon A. Linker'
      write (*,*) '                  Zoran Mikic'
      write (*,*) ''
      write (*,*) '        Predictive Science Inc.'
      write (*,*) '        www.predsci.com'
      write (*,*) '        San Diego, California, USA 92121'
      write (*,*)''
      write (*,*)''
      write (*,*) 'End time = ',time_end
      write (*,*)
      write (*,*) 'Number of t mesh points = ',ntm
      write (*,*) 'Number of p mesh points = ',npm-1
      write (*,*)
      if (advance_diffusion) then
        write (*,'(a,f12.6,a)') ' Uniform diffusion = ', &
                                       diffusion_coef_constant,' km^2/s'
        write (*,*) ' Diffusion coefficient: '
        write (*,'(a,f12.6,a)') '   Minimum value = ', &
                  MINVAL(diffusion_coef/diffusion_coef_factor),' km^2/s'
        write (*,'(a,f12.6,a)') '   Maximum value = ', &
                  MAXVAL(diffusion_coef/diffusion_coef_factor),' km^2/s'
      end if
      write(*,*)
      write(*,*) "Run started at: "
      call timestamp
      flush(OUTPUT_UNIT)
end subroutine
!#######################################################################
subroutine load_initial_condition
!
!-----------------------------------------------------------------------
!
! ****** load_initial_condition
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use mesh
      use fields
      use read_2d_file_interface
      use write_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: fn1,fs1,fn2,fs2,fmax,fmin,C1,C2
      real(r_typ), dimension(:,:), allocatable :: f_local,f_local2
      real(r_typ), dimension(:), allocatable :: s1,s2
      integer :: n1,n2,ierr
!
!-----------------------------------------------------------------------
!
! ****** NOTE: At this time the user cannot specify NT,NP.
! ****** Instead, the resolution of the input map is used.
! ****** The input map is assumed to be in PT and with a
! ****** one-point overlap in phi.
!
! ****** Read the initial magnetic map.
!
      call read_2d_file (initial_field_filename,n1,n2,f_local,s1,s2,ierr)
!
      if (validation_run) then
!
        allocate (f_local2(n1,n2))
!
        call tesseral_spherical_harmonic (0,6,s1,s2,n1,n2,f_local)
        call tesseral_spherical_harmonic (5,6,s1,s2,n1,n2,f_local2)
!
        f_local(:,:) = f_local(:,:) + &
                       sqrt(14.0_r_typ/11.0_r_typ)*f_local2(:,:)
!
! ****** Backup U0
!  
        f_local2(:,:) = f_local(:,:)

        fmin = minval(f_local)
        fmax = maxval(f_local)

        C1 = -1000.0_r_typ - 2000.0_r_typ*fmin/(fmax - fmin)
        C2 = 2000.0_r_typ/(fmax - fmin)
!
        f_local(:,:) = C1 + C2*f_local(:,:)
!
        call write_2d_file((trim(output_field_root_filename)//'_initial_0.h5') &
                           ,n1,n2,f_local,s1,s2,ierr)
!
! ****** Caculate analytic solution and output:
!
        f_local2(:,:) = C1 + &
                        C2*exp(-42._r_typ*diffusion_coef_constant* &
                        diffusion_coef_factor*time_end)*f_local2(:,:)

        f_local2(:,:) = exp(-42._r_typ*diffusion_coef_constant* &
                        diffusion_coef_factor*time_end)*f_local2(:,:)
!
        call write_2d_file((trim(output_field_root_filename)//'_final_analytic.h5') &
                           ,n1,n2,f_local2,s1,s2,ierr)

        deallocate (f_local2)
!        
      end if
!
! ****** Set resolution values.
!
      ntm1 = n2
      npm1 = n1
!
! ****** Allocate main mesh grid arrays and data array with extended
! ****** phi grid.
!
      allocate (t(ntm1))
      allocate (p(npm1 + 1))
      allocate (f(ntm1,npm1 + 1))
!
! ****** Transpose array since we assume PT but need TP for the code.
!
      f(1:ntm1,1:npm1) = TRANSPOSE(f_local(1:npm1,1:ntm1))
!
! ****** Impose perfect periodicity and set two-point overlap.
!
      f(:,1) = half*(f(:,1) + f(:,npm1))
      f(:,npm1) = f(:,1)
      f(:,npm1 + 1) = f(:,2)
!
! ****** Set main mesh grid arrays.
!
      t(:) = s2(:)
      p(1:npm1) = s1(:)
      p(npm1+1) = p(2) + twopi
!
! ****** Set additional meshes and precomputed mesh quantities.
!
      call set_mesh
!
! ****** Get the m=0 components near the poles.
!
      call get_m0 (f,fn1,fn2,fs1,fs2)
!
! ****** Set the pole values to have only an m=0 component.
!
      f(1,:) = fn1
      f(ntm,:) = fs1
!$acc enter data copyin(f)
!
! ****** Clean up memory.
!
      deallocate (s1)
      deallocate (s2)
      deallocate (f_local)
!
! ****** Write out initial condition.
!
      allocate (fout(npm-1,ntm))
      allocate (pout(npm-1))
      fout(:,:) = transpose(f(:,1:npm-1))
      pout(:) = p(1:npm-1)
      call write_2d_file(                                              &
                     (trim(output_field_root_filename)//'_initial.h5') &
                                          ,npm-1,ntm,fout,pout,t,ierr)
      deallocate (fout,pout)

end subroutine
!#######################################################################
subroutine tesseral_spherical_harmonic (m, l, pvec, tvec, np, nt, Y)
!
!-----------------------------------------------------------------------
!
! Subroutine for computing tesseral spherical harmonics using the
! First Modified Forward Column Recursion method from
! Holmes et.al. (2002) which reduces numerical errors near the poles.
!
! m is the order, while l is the degree (Y_lm)
!
! tvec is a nt length 1D array of theta values     [0,  pi]
! pvec is a np length 1D array of longitude values [0,2*pi]
! Y is a 2D array of size (np,nt)
!
! This code uses `do concurrent' and OpenACC for GPU-acceleration
! when using a compatible compiler (e.g. NVIDIA's nvfortran).
! For perfromance, it is best if lvec, tvec, and Y are already
! on the GPU.
!
! This code was adapted from the MATLAB code sphharm.m from the
! Chebfun package, Copyright 2018 by The University of Oxford
! and The Chebfun Developers.
! See http://www.chebfun.org/ for Chebfun information.
!
!-----------------------------------------------------------------------
!
      use iso_fortran_env
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer, parameter :: r_typ = REAL64
!
!-----------------------------------------------------------------------
!
      real(r_typ), parameter :: pi = 3.141592653589793_r_typ
      real(r_typ), parameter :: one = 1.0_r_typ
      real(r_typ), parameter :: two = 2.0_r_typ
      real(r_typ), parameter :: three = 3.0_r_typ
      real(r_typ), parameter :: four = 4.0_r_typ
!
!-----------------------------------------------------------------------
!
      integer :: l, m, nt, np
      real(r_typ), dimension(nt) :: tvec
      real(r_typ), dimension(np) :: pvec
      real(r_typ), dimension(np,nt) :: Y
!
!-----------------------------------------------------------------------
!
      real(r_typ), dimension(nt) :: cos_tvec, Pold, Poldold, Pl
      real(r_typ) :: anm, bnm, one_over_sqrt_4pi
      integer :: i, im, il, j, pos, abs_m
!
!-----------------------------------------------------------------------
!
! ****** Set |m|.
!
      abs_m = abs(m)
!
! ****** Create the temporary arrays on the GPU.
!
!$acc enter data create(cos_tvec, Pold, Poldold, Pl)
!
      do concurrent(i=1:nt)
!
! ****** Store cos(theta).
!
        cos_tvec(i) = cos(tvec(i))
!
! ****** Initialize P^0_0/u^0.
!
        Pold(i) = one
!
! ****** Initialize the recurrence.
!
        Poldold(i) = 0.
      enddo
!
! ****** Compute P^m_m/u^m.
!
      if (abs_m.gt.0) then
!
! ****** Compute P^1_1/u^1.
!
        do concurrent(i=1:nt)
          Pold(i) = sqrt(three)
        enddo
!
! ****** Compute P^m_m/u^m.
!
        do im=2,abs_m
          do concurrent(i=1:nt)
            Pold(i) = sqrt((two*im+one)/(two*im)) * Pold(i)
          enddo
        enddo
      end if
!
! ****** Compute P^m_l/u^m for m+1<=l.
!
      do il=abs_m+1,l
!
        anm = sqrt( ((two*il-one)*(two*il+one)) / &
                      ((il-abs_m)*(il+abs_m))    )
!
        bnm = sqrt( ((two*il+one)*(il+abs_m-one)*(il-abs_m-one)) / &
                    ((il-abs_m)*(il+abs_m)*(two*il-three))        )
!
        do concurrent(i=1:nt)
          Pl(i) = anm*cos_tvec(i)*Pold(i) - bnm*Poldold(i)
          Poldold(i) = Pold(i)
          Pold(i) = Pl(i)
        enddo
      enddo
!
! ****** Normalize and compute associated Legendre polynomials.
! ****** Note that there is no sqrt(2) term here as it is included
! ****** in the above recursion as it computed the fully
! ****** normalized P-bar.  The -1^m and 1/4pi terms
! ****** are for the spherical harmonic normalization.
!
      one_over_sqrt_4pi = one/sqrt(four*pi)
      do concurrent(i=1:nt)
        Pold(i) = ((-one)**abs_m) * (sin(tvec(i))**abs_m) * &
                  one_over_sqrt_4pi * Pold(i)
      enddo
!
! ****** Determine if the cos or sin term should be used.
!
      pos = abs( max(0,sign(1,m+1)) )
!
! ****** Compute the spherical harmonic.
!
      do concurrent(j=1:nt,i=1:np)
        Y(i,j) = Pold(j)*(                         &
                         (pos)*cos(m*pvec(i))      &
                   + (one-pos)*sin(abs_m*pvec(i))  &
                          )
      enddo
!
! ****** Remove the temporary arrays from the GPU:
!
!$acc exit data delete(cos_tvec, Pold, Poldold, Pl)
!
end subroutine
!#######################################################################
subroutine set_unchanging_quantities
!
!-----------------------------------------------------------------------
!
! ****** Set unchanging quantities.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use mesh
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Define the diffusion coefficent and matrix.
!
      if (advance_diffusion) call load_diffusion
!
end subroutine
!#######################################################################
subroutine update_step
!
!-----------------------------------------------------------------------
!
! ****** Update prescribed quantities and time step.
!
!-----------------------------------------------------------------------
!
      use input_parameters
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: t1,wtime
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
      if (advance_flow)    call update_flow
      if (advance_source)  call update_source
      if (assimilate_data) call update_field
!
      call update_timestep
!
      wtime_update = wtime_update + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine update_flow
!
!-----------------------------------------------------------------------
!
! ****** Update flows.
!
!-----------------------------------------------------------------------
!
      use input_parameters
      use mesh
      use fields
      use globals
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k
!
!-----------------------------------------------------------------------
!
! ***** Reset the flow.
!
      if (flow_needs_updating) then
!
!       Assume no more updates needed.  If time-dept flow,
!       this will be set to true each time after this.
        flow_needs_updating = .false.
!       Since the flow is changing, we need to update time step.
        timestep_flow_needs_updating = .true.
        timestep_needs_updating = .true.
!
!$omp parallel do collapse(2) default(shared)
!$acc parallel loop collapse(2) default(present)
        do j=1,nt
          do k=1,np
            vt(j,k) = 0.
            vp(j,k) = 0.
          end do
        end do
!$omp end parallel do
!
! ***** Add in flow from file.
!
        call add_flow_from_file
!
! ***** Add in flow from ConFlow algorithm.
!
!       call add_flow_from_conflow (metadata_structure,flow_array)
!
! ***** Add in meridianal flow model.
!
        if (flow_mf_model.eq.1) call add_flow_meridianal_aft
!
! ***** Add in differential rotation model.
!
        if (flow_dr_model.eq.1) call add_flow_differential_rotation_aft
!
! ***** Add in constant angular velocity (rigid rotation)
!
        if (flow_vp_rigid_omega.gt.0.) then
!$omp parallel do collapse(2) default(shared)
!$acc parallel loop collapse(2) default(present)
          do j=1,nt
            do k=1,np
              vp(j,k) = vp(j,k)+flow_vp_rigid_omega*km_s_to_rs_hr*sth(j)
            end do
          end do
!$omp end parallel do
        endif
!
      endif
!
end subroutine
!#######################################################################
subroutine add_flow_from_file
!
!-----------------------------------------------------------------------
!
! ****** Update flows from file(s).
!
!-----------------------------------------------------------------------
!
      use input_parameters
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      if (flow_vt_filename.ne.' ') call load_vt
!
      if (flow_vp_filename.ne.' ') call load_vp
!
end subroutine
!#######################################################################
subroutine update_source
!
!-----------------------------------------------------------------------
!
! ****** Update source quantities.
!
!-----------------------------------------------------------------------
!
      use input_parameters
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
!     - FILE
!     - Random flux
!     - Artificial AR emrergence
!
end subroutine
!#######################################################################
subroutine update_field
!
!-----------------------------------------------------------------------
!
! ****** Update field through data assimilation.
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
!     - Simple
!     - MagDat
!
end subroutine
!#######################################################################
subroutine update_timestep
!
!-----------------------------------------------------------------------
!
! ****** Update time step if needed.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use globals
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_old, dt_mxup, dtmax_flow
!
!-----------------------------------------------------------------------
!
! ****** Save previous timestep.
!
      dtime_old = dtime_global
!
! ****** Check:  Does the timestep need updating?
!
      if (timestep_needs_updating) then
!
! ****** Default timestep is one giant step for remaining time.
!
        dtime_global = time_end - time
!
        if (advance_flow.and.timestep_flow_needs_updating) then
          call get_flow_dtmax (dtmax_flow)
          dtime_global = MIN(dtime_global,dtmax_flow)
          timestep_flow_needs_updating = .false.
        end if
!
        ! Check for negative values with source?
!
! ****** Check to make sure dtime_global doesnt go up too fast.
!
        if (dt_max_increase_fac.gt.0) then
          dt_mxup = (one + dt_max_increase_fac)*dtime_old
        else
          dt_mxup = huge(one)
        end if
!
        dtime_global = MIN(dtime_global,dt_mxup,dt_max)
!
        if (dtime_global .lt. dt_min) then
          write (*,*) 'Warning! Time step is smaller than DTMIN!'
        end if
!
        timestep_needs_updating = .false.
!
      end if
!       Check for next output, cut time to match exactly [ADD THIS]
!
!       Check for end time.
      if (time + dtime_global .gt. time_end) then
        dtime_global = time_end - time
      end if
!
      if (advance_diffusion.and.timestep_diff_needs_updating) then
        call get_dtime_diff_euler (dtime_diff_euler)
        timestep_diff_needs_updating = .false.
      end if
!
end subroutine
!#######################################################################
subroutine flux_transport_step
!
!-----------------------------------------------------------------------
!
! ****** Evolve the field by one time step.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use globals
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local, t1, wtime
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
!     Could strang split these.  For now, use full dt.
!
      dtime_local = dtime_global
!
      if (advance_flow)      call advection_step (dtime_local)
      if (advance_diffusion) call diffusion_step (dtime_local)
      if (advance_source)    call source_step    (dtime_local)
!
      wtime_flux_transport = wtime_flux_transport + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine advection_step (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Advance the field with advection by the time-step DT.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local,t1,wtime
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
      if (flow_num_method.eq.1) call advection_step_upwind (dtime_local)
!
      wtime_flux_transport_advection = wtime_flux_transport_advection &
                                       + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine diffusion_step (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Advance the field with diffusion by the time-step DTIME_LOCAL.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local, dtime_local2, dtime_subcycle, t1, wtime
      real(r_typ) :: time_stepped
      integer :: i
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
      time_stepped=0.

      dtime_local2 = dtime_local/diffusion_subcycles
!
      do i=1,diffusion_subcycles

        if (diffusion_num_method.eq.1) then
!
          call diffusion_step_euler_cd (dtime_local2)
!
        else if (diffusion_num_method.eq.2) then
!
          call diffusion_step_rkl2_cd (dtime_local2)
!
        else if (diffusion_num_method.eq.3) then
!
          call diffusion_step_rkg2_cd (dtime_local2)
!
        end if
        time_stepped = time_stepped + dtime_local2
        if (verbose.and.MOD(i,1).eq.0) then
          write(*,*) '-->Diff subcycle #',i,' of ',diffusion_subcycles, 'time:',time_stepped
          flush(OUTPUT_UNIT)
        end if
!
      enddo
!
      wtime_flux_transport_diffusion = wtime_flux_transport_diffusion &
                                       + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine source_step (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Advance the field with diffusion by the time-step DT.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local,t1,wtime
!
      t1 = wtime()
!
! ---> Adding random flux, ARs, etc.
!
      wtime_source = wtime_source + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine timestamp ()
!
! ****** TIMESTAMP prints out the current YMDHMS date as a timestamp.
!
!  Licensing:
!    This code is distributed under the GNU LGPL license.
!  Modified:
!    12 January 2007
!  Author:
!    John Burkardt
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer d,h,m,mm,n,s,y
      character*(8) ampm
      character*(8) date
      character*(9) month(12)
      character*(10) time
!
!-----------------------------------------------------------------------
!
      save month
!
!-----------------------------------------------------------------------
!
      data month / &
      'January  ', 'February ', 'March    ', 'April    ', &
      'May      ', 'June     ', 'July     ', 'August   ', &
      'September', 'October  ', 'November ', 'December ' /
!
!-----------------------------------------------------------------------
!
      call DATE_AND_TIME (date,time)
!
      read ( date, '(i4,i2,i2)' ) y, m, d
      read ( time, '(i2,i2,i2,1x,i3)' ) h, n, s, mm
!
      if ( h .lt. 12 ) then
        ampm = 'AM'
      else if ( h .eq. 12 ) then
        if ( n .eq. 0 .and. s .eq. 0 ) then
          ampm = 'Noon'
        else
          ampm = 'PM'
        end if
      else
        h = h - 12
        if ( h .lt. 12 ) then
          ampm = 'PM'
        else if ( h .eq. 12 ) then
          if ( n .eq. 0 .and. s .eq. 0 ) then
            ampm = 'Midnight'
          else
            ampm = 'AM'
          end if
        end if
      end if
!
      write ( *, &
       '(a1,i2,1x,a,1x,i4,2x,i2,a1,i2.2,a1,i2.2,a1,i3.3,1x,a)' ) &
       ' ',d, month(m), y, h, ':', n, ':', s, '.', mm, ampm
!
end subroutine
!#######################################################################
function wtime ()
!
!*********************************************************************72
!
!  WTIME returns a reading of the wall clock time.
!
!  Discussion:
!    To get the elapsed wall clock time, call WTIME before and after
!    a given operation, and subtract the first reading from the second.
!  Licensing:
!    This code is distributed under the GNU LGPL license.
!  Author:
!    John Burkardt
!  Parameters:
!    Output, r_typ WTIME, the wall clock reading, in seconds.
!
      use number_types
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer*8 :: clock_max
      integer*8 :: clock_rate
      integer*8 :: clock_reading
!
      real(r_typ) :: wtime
!
!-----------------------------------------------------------------------
!
      call SYSTEM_CLOCK (clock_reading,clock_rate,clock_max)
!
      wtime = real(clock_reading,r_typ)/real(clock_rate,r_typ)
!
      return
end function
!#######################################################################
subroutine set_periodic_bc_2d (a,n1,n2)
!
!-----------------------------------------------------------------------
!
! ****** Set the periodic phi direction boundary condition for
! ****** a 2D array assuming a two-point overlap.
!
!-----------------------------------------------------------------------
!
      use number_types
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ), dimension(n1,n2) :: a
      integer :: n1,n2,j
!
!-----------------------------------------------------------------------
!
!$omp parallel do default(shared)
!$acc parallel loop default(present)
      do j=1,n1
        a(j, 1) = a(j,n2-1)
        a(j,n2) = a(j,2)
      enddo
!$omp end parallel do
!
end subroutine
!#######################################################################
subroutine load_diffusion_matrix
!
!-----------------------------------------------------------------------
!
! ****** Load diffusion matrix coefs.  Currently, these never change
! ****** over the run, so they are set once.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use input_parameters
      use matrix_storage
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k
!
!-----------------------------------------------------------------------
!
! ****** Allocate coef array.
!
      allocate (coef(2:ntm-1,2:npm-1,5))
      coef(:,:,:)=0.
!$acc enter data copyin(coef)
!
! ****** Set coef for internal points and phi boundary point at k=1.
!
!$omp parallel do collapse(2) default(shared)
!$acc parallel loop collapse(2) default(present)
      do k=2,npm-1
        do j=2,ntm-1
          coef(j,k,1)=diffusion_coef_p_fac*diffusion_coef(j,k) &
                     *dph_i(k)*dp_i(k)*st_i(j)*st_i(j)
          coef(j,k,2)=diffusion_coef_t_fac*diffusion_coef(j,k) &
                     *dth_i(j)*dt_i(j)*st_i(j)*sth(j )
          coef(j,k,4)=diffusion_coef_t_fac*diffusion_coef(j+1,k) &
                     *dth_i(j+1)*dt_i(j)*st_i(j)*sth(j+1)
          coef(j,k,5)=diffusion_coef_p_fac*diffusion_coef(j,k+1) &
                     *dph_i(k+1)*dp_i(k)*st_i(j)*st_i(j )
!
          coef(j,k,3)=-(coef(j,k,1)+coef(j,k,2)+coef(j,k,4)+coef(j,k,5))
        enddo
      enddo
!$omp end parallel do
!
end subroutine
!#######################################################################
subroutine get_dtime_diff_euler (dtime_exp)
!
!-----------------------------------------------------------------------
!
! ****** Get the explicit Euler time step limit for thermal conduction.
!
!-----------------------------------------------------------------------
!
      use matrix_storage
      use mesh
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_exp
!
!-----------------------------------------------------------------------
!
      integer :: j,k,d
      real(r_typ) :: max_eig,gersh_rad
!
!-----------------------------------------------------------------------
!
! *** Estimate maximum eigenvalue using Gershgorin disks:
!
      max_eig = 0.
!
!$omp parallel do default(shared) collapse(2) reduction(max:max_eig)
!$acc parallel loop default(present) collapse(2) reduction(max:max_eig)
      do k=2,npm-1
        do j=2,ntm-1
            gersh_rad = 0.
!$acc loop seq
            do d=1,5
              gersh_rad = gersh_rad+abs(coef(j,k,d))
            enddo
            max_eig = max(gersh_rad,max_eig)
        enddo
      enddo
!$omp end parallel do
!
! *** Compute the Euler time-step bound.
!
      dtime_exp = two/max_eig
!
! *** Apply safety factor.
!
      dtime_exp = safety*dtime_exp
!
end subroutine
!#######################################################################
subroutine diffusion_step_rkl2_cd (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Diffuse the field by one time step using RKL2 STS.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use input_parameters
      use sts
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k
      integer*8 :: i
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
!     This only needs to happen more than once if dtime_local changes...
!
      call load_sts_rkl2 (dtime_local)
!$acc enter data copyin(sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
!
! ****** Allocate scratch arrays.
!
      allocate (y0(ntm,npm))
      allocate (tMy0(ntm,npm))
      allocate (Mym1(ntm,npm))
      allocate (yjm1(ntm,npm))
      allocate (yjm2(ntm,npm))
!$acc enter data create(y0,tMy0,Mym1,yjm1,yjm2)
!
      call ax(f,tMy0)
!
!$omp parallel do collapse(2) default(shared) private(j,k)
!$acc parallel loop collapse(2) default(present)
      do k=1,npm
        do j=1,ntm
          y0(j,k) = f(j,k)
          yjm2(j,k) = f(j,k)
          tMy0(j,k) = dtime_local*tMy0(j,k)
          yjm1(j,k) = f(j,k) + sts_ubj(1)*tMy0(j,k)
        enddo
      enddo
!$omp end parallel do
!
! ****** Inner s-step loop
!
      do i=2,sts_s
!
        call ax(yjm1,Mym1)
!
!$omp parallel do collapse(2) default(shared) private(j,k)
!$acc parallel loop collapse(2) default(present)
        do k=1,npm
          do j=1,ntm
            f(j,k) = sts_uj(i)*yjm1(j,k) + sts_vj(i)*yjm2(j,k) +    &
                  (one - sts_uj(i) - sts_vj(i))*y0(j,k) +           &
                  sts_ubj(i)*dtime_local*Mym1(j,k) + sts_gj(i)*tMy0(j,k)
            yjm2(j,k) = yjm1(j,k)
            yjm1(j,k) = f(j,k)
          enddo
        enddo
!$omp end parallel do
      enddo
!
!$acc exit data delete(sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
!$acc exit data delete(y0,tMy0,Mym1,yjm1,yjm2)
      deallocate (sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
      deallocate (y0,tMy0,Mym1,yjm1,yjm2)
!
end subroutine
!#######################################################################
subroutine diffusion_step_rkg2_cd (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Diffuse the field by one time step using RKG2 STS.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use input_parameters
      use sts
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k
      integer*8 :: i
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
!     This only needs to happen more than once if dtime_local changes...
!
      call load_sts_rkg2 (dtime_local)
!$acc enter data copyin(sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
!
! ****** Allocate scratch arrays.
!
      allocate (y0(ntm,npm))
      allocate (tMy0(ntm,npm))
      allocate (Mym1(ntm,npm))
      allocate (yjm1(ntm,npm))
      allocate (yjm2(ntm,npm))
!$acc enter data create(y0,tMy0,Mym1,yjm1,yjm2)
!
      call ax(f,tMy0)
!
!$omp parallel do collapse(2) default(shared) private(j,k)
!$acc parallel loop collapse(2) default(present)
      do k=1,npm
        do j=1,ntm
          y0(j,k) = f(j,k)
          yjm2(j,k) = f(j,k)
          tMy0(j,k) = dtime_local*tMy0(j,k)
          yjm1(j,k) = f(j,k) + sts_ubj(1)*tMy0(j,k)
        enddo
      enddo
!$omp end parallel do
!
! ****** Inner s-step loop
!
      do i=2,sts_s
!
        call ax(yjm1,Mym1)
!
!$omp parallel do collapse(2) default(shared) private(j,k)
!$acc parallel loop collapse(2) default(present)
        do k=1,npm
          do j=1,ntm
            f(j,k) = sts_uj(i)*yjm1(j,k) + sts_vj(i)*yjm2(j,k) + &
                  (one - sts_uj(i) - sts_vj(i))*y0(j,k) +        &
                  sts_ubj(i)*dtime_local*Mym1(j,k) + sts_gj(i)*tMy0(j,k)
            yjm2(j,k) = yjm1(j,k)
            yjm1(j,k) = f(j,k)
          enddo
        enddo
!$omp end parallel do
      enddo
!
!$acc exit data delete(sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
!$acc exit data delete(y0,tMy0,Mym1,yjm1,yjm2)
      deallocate (sts_uj,sts_vj,sts_ubj,sts_gj,sts_b)
      deallocate (y0,tMy0,Mym1,yjm1,yjm2)
!
end subroutine
!#######################################################################
subroutine load_sts_rkl2 (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Set up parameters and coefficient arrays for STS advance.
! ****** This uses the RKL2 2nd-order STS as given in
! ****** Meyer, et. al. J. Comp. Phys. 257 (2014) 594-626
!
! ****** The Euler stable dt (dtime_diff_euler) must be already be set.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use mesh
      use sts
      use constants
      use globals
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: sts_s_real,bj_bjm2,bj_bjm1
      integer*8 :: j
!
!-----------------------------------------------------------------------
!
! ****** Compute number of iterations per super-step.
!
      sts_s_real = &
        half*(sqrt(nine + sixteen*(dtime_local/dtime_diff_euler)) - one)
!
      sts_s = CEILING(sts_s_real)
!
! ****** Make sure s is at least 3.
!
      if (sts_s.lt.3) then
        sts_s = 3
      endif
!
! ****** Make sure s is odd.
!
      if (MOD(sts_s,2).eq.0) then
        sts_s = sts_s + 1
      endif
!
! ****** Allocate super-time-step coefficent arrays.
!
      allocate (sts_uj(sts_s))
      allocate (sts_vj(sts_s))
      allocate (sts_ubj(sts_s))
      allocate (sts_gj(sts_s))
      allocate (sts_b(sts_s))
!
! ****** Compute super-time-step coefficents.
!
      sts_b(1) = one/three
      sts_b(2) = one/three
!
      sts_uj(1) = -9999._r_typ
      sts_vj(1) = -9999._r_typ
      sts_ubj(1) = four/(three*(sts_s*sts_s + sts_s - two_int))
      sts_gj(1) = -9999._r_typ
!
      sts_uj(2) = three/two
      sts_vj(2) = -one/two
      sts_ubj(2) = six/(sts_s*sts_s + sts_s - two_int)
      sts_gj(2) = -four/(sts_s*sts_s + sts_s - two_int)
!
      do j=3,sts_s
        sts_b(j) = (j*j + j - two)/(two*j*(j + 1))
        bj_bjm1 = sts_b(j)/sts_b(j - 1)
        bj_bjm2 = sts_b(j)/sts_b(j - 2)
!
        sts_uj(j) = bj_bjm1*(two - one/j)
        sts_vj(j) = -bj_bjm2*(one - one/j)
        sts_ubj(j) = sts_uj(j)*four/(sts_s*sts_s + sts_s - two_int)
        sts_gj(j) = -(one - sts_b(j - 1))*sts_ubj(j)
      enddo
!
end subroutine
!#######################################################################
subroutine load_sts_rkg2 (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Set up parameters and coefficient arrays for STS advance.
! ****** This uses the RKG2 2nd-order STS as given in
! ****** Skaras, et. al. J. Comp. Phys. 425 (2021) 109879
!
! ****** The Euler stable dt (dtime_diff_euler) must be already be set.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use mesh
      use sts
      use constants
      use globals
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: sts_s_real,bj_bjm2,bj_bjm1,w1
      integer*8 :: j
!
!-----------------------------------------------------------------------
!
! ****** Compute number of iterations per super-step.
!
      sts_s_real = half*(sqrt(twentyfive + &
                         twentyfour*(dtime_local/dtime_diff_euler)) &
                         - three)
!
      sts_s = CEILING(sts_s_real)
!
! ****** Make sure s is at least 3.
!
      if (sts_s.lt.3) then
        sts_s = 3
      endif
!
! ****** Make sure s is odd.
!
      if (MOD(sts_s,2).eq.0) then
        sts_s = sts_s + 1
      endif
!
! ****** Allocate super-time-step coefficent arrays.
!
      allocate (sts_uj(sts_s))
      allocate (sts_vj(sts_s))
      allocate (sts_ubj(sts_s))
      allocate (sts_gj(sts_s))
      allocate (sts_b(sts_s))
!
! ****** Compute super-time-step coefficents.
!
      w1 = six/((sts_s + four_int)*(sts_s - one_int))
!
      !b0 = one
      sts_b(1)=one/three
      sts_b(2)=one/15.0_r_typ
!
      sts_uj(1) = 1.0_r_typ
      sts_vj(1) = -9999._r_typ
      sts_ubj(1) = w1
      sts_gj(1) = -9999._r_typ
!
      sts_uj(2) = one/two
      sts_vj(2) = -one/ten
      sts_ubj(2) = sts_uj(2)*w1
      sts_gj(2) = zero
!
      do j=3,sts_s
        sts_b(j)=(four*(j-1)*(j+4))/(three*j*(j+1)*(j+2)*(j+3))
        bj_bjm1=sts_b(j)/sts_b(j-1)
        bj_bjm2=sts_b(j)/sts_b(j-2)
!
        sts_uj(j)=bj_bjm1*((two*j + one)/j)
        sts_vj(j)=-bj_bjm2*((j + one)/j)
        sts_ubj(j)=sts_uj(j)*w1
        sts_gj(j)=-(one - half*j*(j + one)*sts_b(j-1))*sts_ubj(j)
      enddo
!
end subroutine
!#######################################################################
subroutine read_2d_file (fname,ln1,ln2,fin,s1,s2,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Read 2D data from H5 file FNAME.
! ****** This allocates arrays "f", "x", and "y".
!
!-----------------------------------------------------------------------
!
      use number_types
      use ident
      use sds_def
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      character(*) :: fname
      real(r_typ), dimension(:,:), allocatable :: fin
      real(r_typ), dimension(:), allocatable :: s1,s2
      integer :: ln1,ln2
!
!-----------------------------------------------------------------------
!
      type(sds) :: s
      integer :: ierr
      real(r_typ) :: t1,wtime
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
! ****** Read the data.
!
      call rdh5 (fname,s,ierr)
!
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### Could not read the requested data set.'
        write (*,*) 'IERR (from RDHDF) = ',ierr
        write (*,*) 'File name: ',trim(fname)
        call exit (1)
      end if
!
! ****** Check that it is a 2D SDS.
!
      if (s%ndim.ne.2) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### The file does not contain a 2D field.'
        write (*,*) '### Number of dimensions = ',s%ndim
        write (*,*) 'File name: ',trim(fname)
        call exit (1)
      end if
!
! ****** Check that the HDF/H5 has scales.
!
      if (.not.s%scale) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### The data set does not contain scales.'
        write (*,*) 'File name: ',trim(fname)
        call exit (1)
      end if
!
! ****** Get the resolution of the input map and set resolution for
!        returned arrays.
!
      ln1 = s%dims(1)
      ln2 = s%dims(2)
!
! ****** Allocate and load the scales and data.
! ****** Include a two-point overlap in phi.
!
      allocate (s1(ln1))
      allocate (s2(ln2))
      allocate (fin(ln1,ln2))
!
      s1(:) = s%scales(1)%f(:)
      s2(:) = s%scales(2)%f(:)
!
! ****** Read the data.
!
      fin(:,:) = s%f(:,:,1)
!
! ****** Free up memory.
!
      deallocate (s%scales(1)%f)
      deallocate (s%scales(2)%f)
      deallocate (s%f)
!
      wtime_io = wtime_io + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine rdh5 (fname,s,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Read a 1D, 2D, or 3D scientific data set from an HDF5 file.
! ****** The HDF5 file is currently assumed to contain only one
! ****** dataset (1D,2d,3D), with or without scales, in group "/",
! ****** and has no other data members.
!
!-----------------------------------------------------------------------
!
! ****** This routine allocates the required memory and returns
! ****** pointers to the data and scale arrays.
!
!-----------------------------------------------------------------------
!
! ****** Input arguments:
!
!          FNAME   : [character(*)]
!                    HDF5 data file name to read from.
!
! ****** Output arguments:
!
!          S       : [structure of type SDS]
!                    A structure that holds the field, its
!                    dimensions, and the scales, with the
!                    components described below.
!
!          IERR    : [integer]
!                    IERR=0 is returned if the data set was read
!                    successfully.  Otherwise, IERR is set to a
!                    nonzero value.
!
! ****** Components of structure S:
!
!          NDIM    : [integer]
!                    Number of dimensions found in the data set.
!
!          DIMS    : [integer, dimension(3)]
!                    Number of points in the data set dimensions.
!                    For a 1D data set, DIMS(2)=DIMS(3)=1.
!                    For a 2D data set, DIMS(3)=1.
!
!          SCALE   : [logical]
!                    Flag to indicate the presence of scales (axes)
!                    in the data set.  SCALE=.false. means that scales
!                    were not found; SCALE=.true. means that scales
!                    were found.
!
!          HDF32   : [logical]
!                    Flag to indicate the precision of the data set
!                    read in.  HDF32=.true. means that the data is
!                    32-bit; HDF32=.false. means that the data is
!                    64-bit.
!
!          SCALES  : [structure of type RP1D, dimension(3)]
!                    This array holds the pointers to the scales
!                    when SCALE=.true., and is undefined otherwise.
!
!          F       : [real, pointer to a rank-3 array]
!                    This array holds the data set values.
!
! ****** The storage for the arrays pointed to by F, and the
! ****** scales (if present) in structure SCALES, is allocated by
! ****** this routine.
!
!-----------------------------------------------------------------------
!
      use number_types
      use sds_def
      use hdf5
      use h5ds
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      type(sds) :: s
      character(*) :: fname
!
!-----------------------------------------------------------------------
!
      integer :: ierr
!
!-----------------------------------------------------------------------
!
      integer :: i,obj_type,n_members
!
      integer(HID_T) :: file_id       ! File identifier
      integer(HID_T) :: dset_id       ! Dataset identifier
      integer(HID_T) :: dspace_id     ! Dataspace identifier
      integer(HID_T) :: dim_id        ! Dimension identifiers
      integer(HID_T) :: datatype_id   ! Datatype identifiers
!
      integer(SIZE_T) :: prec
!
      integer(HSIZE_T),dimension(:), allocatable :: s_dims,maxpts
      integer(HSIZE_T),dimension(1) :: s_dims_i
!
      real(KIND_REAL_4), dimension(:,:,:), allocatable :: f4
      real(KIND_REAL_4), dimension(:),     allocatable :: f4dim
      real(KIND_REAL_8), dimension(:,:,:), allocatable :: f8
      real(KIND_REAL_8), dimension(:),     allocatable :: f8dim
!
      character(512) :: obj_name
      character(4), parameter :: cname='RDH5'
!
      logical :: is_scale
!
!-----------------------------------------------------------------------
!
! ****** Initialize dimension count and arrays.
!
      s%ndim=0
      s%dims(:)=1
!
! ****** Initialize hdf5 interface.
!
      call h5open_f (ierr)
!
! ****** Open hdf5 file.
!
      call h5Fopen_f (trim(fname),H5F_ACC_RDONLY_F,file_id,ierr)
!
! ****** Get information about the hdf5 file.
!
      call h5Gn_members_f (file_id,"/",n_members,ierr)
!
! ****** Make sure there is (at maximum) one 3D dataset with scales.
!
      if (n_members.eq.0.or.n_members.gt.4) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### Input file contains too few/many datasets.'
        write (*,*) 'File name: ',trim(fname)
        return
      endif
!
! ****** Assume the Dataset is in index 0 and get its name.
!
      call h5Gget_obj_info_idx_f (file_id,"/",0,obj_name,obj_type,ierr)
!
! ****** Open Dataset.
!
      call h5Dopen_f (file_id,trim(obj_name),dset_id,ierr)
!
! ****** Make sure the Dataset is not a scale.
!
      call h5DSis_scale_f(dset_id,is_scale,ierr)
      if (is_scale) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### Input file Dataset at index 0 is a scale.'
        write (*,*) 'File name: ',trim(fname)
        return
      endif
!
! ****** Get dimensions (need s_dims array for format requirements).
!
      call h5Dget_space_f (dset_id,dspace_id,ierr)
      call h5Sget_simple_extent_ndims_f (dspace_id,s%ndim,ierr)
!
      allocate(s_dims(s%ndim))
!
      allocate(maxpts(s%ndim))
      call h5Sget_simple_extent_dims_f (dspace_id,s_dims,maxpts,ierr)
      deallocate(maxpts)
!
      s%dims(1:s%ndim)=s_dims(1:s%ndim)
!
! ****** Get the floating-point precision of the data and set flag.
!
      call h5Dget_type_f (dset_id,datatype_id,ierr)
      call h5Tget_precision_f (datatype_id,prec,ierr)
!
      if (prec.eq.32) then
        s%hdf32=.true.
      elseif (prec.eq.64) then
        s%hdf32=.false.
      end if
!
! ****** Allocate the memory for the Dataset array in s.
!
      allocate (s%f(s%dims(1),s%dims(2),s%dims(3)))
!
! ****** Need to read the file in its own datatype, and then convert
! ****** to datatype of s%f.
!
      if (s%hdf32) then
        allocate (f4(s%dims(1),s%dims(2),s%dims(3)))
        call h5Dread_f (dset_id,datatype_id,f4,s_dims,ierr)
        s%f(:,:,:)=f4(:,:,:)
        deallocate (f4)
      else
        allocate (f8(s%dims(1),s%dims(2),s%dims(3)))
        call h5Dread_f (dset_id,datatype_id,f8,s_dims,ierr)
        s%f(:,:,:)=f8(:,:,:)
        deallocate (f8)
      end if
!
      deallocate(s_dims)
!
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in RDH5:'
        write (*,*) '### Error while reading the dataset.'
        write (*,*) 'File name: ',trim(fname)
        write (*,*) '[Error return (from H5DREAD_F) = ',ierr,']'
        ierr=4
        return
      end if
!
! ****** Close the hdf5 type descriptor.
!
      call h5Tclose_f (datatype_id,ierr)
!
! ****** Check if there might be scales present, if so, read them.
!
      if (n_members.gt.1) then
!
! ***** First check that the number of scale datasets match the # dim.
!
        if (n_members-1.ne.s%ndim) then
          write (*,*)
          write (*,*) '### ERROR in RDH5:'
          write (*,*) '### # scales does not match # dims.'
          write (*,*) 'File name: ',trim(fname)
          return
        end if
!
        s%scale=.true.
!
! ****** Loop through scales, make sure each is a scale, and read them.
!
        do i=1,n_members-1
!
! ****** Get the name of scale dataset.
!
          call h5Gget_obj_info_idx_f (file_id,"/",i, &
                                     obj_name,obj_type,ierr)
!
! ****** Open scale dataset.
!
          call h5Dopen_f (file_id,trim(obj_name),dim_id,ierr)
!
! ****** Make sure the scale is a scale.
!
          call h5DSis_scale_f (dim_id,is_scale,ierr)
          if (.not.is_scale) then
            write (*,*)
            write (*,*) '### ERROR in RDH5:'
            write (*,*) '### Scale is not a scale.'
            write (*,*) 'File name: ',trim(fname)
            return
          end if
!
! ****** Get dimension of scale.
!
          s_dims_i=s%dims(i)
!
! ****** Allocate scale.
!
          allocate (s%scales(i)%f(s_dims_i(1)))
!
! ****** Get the floating-point precision of the scale.
!
          call h5Dget_type_f (dim_id,datatype_id,ierr)
          call h5Tget_precision_f (datatype_id,prec,ierr)
!
! ****** Read in the scale data.
!
          if (s%hdf32) then
            allocate (f4dim(s_dims_i(1)))
            call h5Dread_f (dim_id,datatype_id,f4dim,s_dims_i,ierr)
            s%scales(i)%f(:)=f4dim(:)
            deallocate (f4dim)
          else
            allocate (f8dim(s_dims_i(1)))
            call h5Dread_f (dim_id,datatype_id,f8dim,s_dims_i,ierr)
            s%scales(i)%f(:)=f8dim(:)
            deallocate (f8dim)
          end if
!
! ****** Close the scale dataset.
!
          call h5Dclose_f (dim_id,ierr)
!
        enddo
!
! ****** Allocate dummy scales (of length 1) for empty dimensions.
!
        do i=s%ndim+1,3
          allocate (s%scales(i)%f(1))
        enddo
      else
!
! ****** If scales are not present, allocate dummy
! ****** scales (of length 1) so that the pointers to the scales
! ****** are valid.
!
        s%scale=.false.
!
        allocate (s%scales(1)%f(1))
        allocate (s%scales(2)%f(1))
        allocate (s%scales(3)%f(1))
      end if
!
! ****** Close the dataset.
!
      call h5Dclose_f (dset_id,ierr)
!
! ****** Close the file.
!
      call h5Fclose_f (file_id,ierr)
!
! ****** Close FORTRAN interface.
!
      call h5close_f (ierr)
!
end subroutine
!#######################################################################
subroutine wrh5 (fname,s,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Write a 1D, 2D, or 3D scientific data set to an HDF5 file.
!
!-----------------------------------------------------------------------
!
! ****** Input arguments:
!
!          FNAME   : [character(*)]
!                    HDF data file name to write to.
!
!          S       : [structure of type SDS]
!                    A structure that holds the field, its
!                    dimensions, and the scales, with the
!                    components described below.
!
! ****** Output arguments:
!
!          IERR    : [integer]
!                    IERR=0 is returned if the data set was written
!                    successfully.  Otherwise, IERR is set to a
!                    nonzero value.
!
!-----------------------------------------------------------------------
!
      use number_types
      use sds_def
      use hdf5
      use h5ds
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      character(*) :: fname
      type(sds) :: s
      integer :: ierr
      intent(in) :: fname,s
      intent(out) :: ierr
!
!-----------------------------------------------------------------------
!
      character(8) ::   dimname
      integer :: i
      integer(HID_T) :: file_id       ! File identifier
      integer(HID_T) :: dset_id       ! Dataset identifier
      integer(HID_T) :: dspace_id,dspacedim_id   ! Dataspace identifiers
      integer(HID_T) :: dim_id        ! Dimension identifiers
      integer(HSIZE_T),dimension(3) :: s_dims
      integer(HSIZE_T),dimension(1) :: s_dims_i
!
      real(KIND_REAL_4), dimension(:,:,:), allocatable :: f4
      real(KIND_REAL_4), dimension(:),     allocatable :: f4dim
      real(KIND_REAL_8), dimension(:,:,:), allocatable :: f8
      real(KIND_REAL_8), dimension(:),     allocatable :: f8dim
!
!-----------------------------------------------------------------------
!
! ****** HDF5 calls are picky about the integer format for the dims
! ****** so the s%dims need to be converted to HSIZE_T integers.
!
! ****** Also, sometimes calls to wrhdf() for 1D and 2D datasets
! ****** do not have the unused dims(i) set to 1 (unset).
! ****** To avoid needing a function call to implicitly reshape
! ****** f(n), set the dims here.
!
      do i=1,3
         if (i.le.s%ndim) then
           s_dims(i)=s%dims(i)
         else
           s_dims(i)=1
         endif
      end do
!
! ****** Initialize hdf5 interface.
!
      call h5open_f (ierr)
!
! ****** Create the file.
!
      call h5Fcreate_f (trim(fname),H5F_ACC_TRUNC_F,file_id,ierr)
!
! ****** Create the dataspace.
!
      call h5Screate_simple_f (s%ndim,s_dims,dspace_id,ierr)
!
! ****** Create and write the dataset (convert s%f to proper type).
!
      if (s%hdf32) then
        allocate (f4(s_dims(1),s_dims(2),s_dims(3)))
        f4(:,:,:)=s%f(:,:,:)
        call h5Dcreate_f (file_id,'Data',H5T_NATIVE_REAL, &
                          dspace_id,dset_id,ierr)
        call h5Dwrite_f (dset_id,H5T_NATIVE_REAL,f4,s_dims,ierr)
        deallocate (f4)
      else
        allocate (f8(s_dims(1),s_dims(2),s_dims(3)))
        f8(:,:,:)=s%f(:,:,:)
        call h5Dcreate_f (file_id,'Data',H5T_NATIVE_DOUBLE, &
                          dspace_id,dset_id,ierr)
        call h5Dwrite_f (dset_id,H5T_NATIVE_DOUBLE,f8,s_dims,ierr)
        deallocate (f8)
      endif
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in WRH5:'
        write (*,*) '### Could not write the dataset.'
        write (*,*) 'File name: ',trim(fname)
        write (*,*) '[Error return (from h5Dwrite_f) = ',ierr,']'
        ierr=4
        return
      end if
!
! ****** Check for scales.  If present, add them to the hdf5 dataset.
!
      if (s%scale) then
        do i=1,s%ndim
          if (i.eq.1) then
            dimname='dim1'
          elseif (i.eq.2) then
            dimname='dim2'
          elseif (i.eq.3) then
            dimname='dim3'
          endif
          s_dims_i=s_dims(i)
          call h5Screate_simple_f(1,s_dims_i,dspacedim_id,ierr)
          if (s%hdf32) then
            allocate (f4dim(s_dims_i(1)))
            f4dim(:)=s%scales(i)%f(:)
            call h5Dcreate_f (file_id,dimname,H5T_NATIVE_REAL, &
                              dspacedim_id,dim_id,ierr)
            call h5Dwrite_f (dim_id,H5T_NATIVE_REAL, &
                             f4dim,s_dims_i,ierr)
            deallocate (f4dim)
          else
            allocate (f8dim(s_dims_i(1)))
            f8dim(:)=s%scales(i)%f(:)
            call h5Dcreate_f (file_id,dimname,H5T_NATIVE_DOUBLE, &
                             dspacedim_id,dim_id,ierr)
            call h5Dwrite_f (dim_id,H5T_NATIVE_DOUBLE, &
                             f8dim,s_dims_i,ierr)
            deallocate (f8dim)
          endif
          call h5DSset_scale_f (dim_id,ierr,dimname)
          call h5DSattach_scale_f (dset_id,dim_id,i,ierr)
          call h5DSset_label_f(dset_id, i, dimname, ierr)
          call h5Dclose_f (dim_id,ierr)
          call h5Sclose_f (dspacedim_id,ierr)
        end do
        if (ierr.ne.0) then
          write (*,*)
          write (*,*) '### ERROR in WRH5:'
          write (*,*) '### Could not write the scales.'
          write (*,*) 'File name: ',trim(fname)
          ierr=5
          return
        endif
      endif
!
! ****** Close the dataset.
!
      call h5Dclose_f (dset_id,ierr)
!
! ****** Close the dataspace.
!
      call h5Sclose_f (dspace_id,ierr)
!
! ****** Close the file.
!
      call h5Fclose_f (file_id,ierr)
!
! ****** Close the hdf5 interface.
!
      call h5close_f (ierr)
!
end subroutine
!#######################################################################
subroutine write_2d_file (fname,ln1,ln2,f,s1,s2,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Write 2D data to H5 file FNAME.
!
!-----------------------------------------------------------------------
!
      use number_types
      use ident
      use sds_def
      use timing
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      character(*) :: fname
      real(r_typ), dimension(:,:), allocatable :: f
      real(r_typ), dimension(:), allocatable :: s1,s2
      integer :: ln1,ln2
      real(r_typ) :: t1,wtime
!
!-----------------------------------------------------------------------
!
      type(sds) :: s
      integer :: ierr
!
!-----------------------------------------------------------------------
!
      t1 = wtime()
!
! ****** Set the structure components.
!
      s%ndim = 2
      s%dims(1) = ln1
      s%dims(2) = ln2
      s%dims(3) = 1
      s%scale = .true.
      s%hdf32 = .false.
!
      allocate (s%scales(1)%f(ln1))
      allocate (s%scales(2)%f(ln2))
      allocate (s%f(ln1,ln2,1))
!
      s%scales(1)%f(:) = s1(:)
      s%scales(2)%f(:) = s2(:)
      s%f(:,:,1) = f(:,:)
!
! ****** Write the data set.
!
      call wrh5 (fname,s,ierr)
!
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in write_2d_file:'
        write (*,*) '### Could not write the 2D data set.'
        write (*,*) 'File name: ',trim(fname)
        return
      end if
!
! ****** Free up memory.
!
      deallocate (s%scales(1)%f)
      deallocate (s%scales(2)%f)
      deallocate (s%f)
!
      wtime_io = wtime_io + (wtime() - t1)
!
end subroutine
!#######################################################################
subroutine set_mesh
!
!-----------------------------------------------------------------------
!
! ****** Compute the mesh quantities.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use mesh
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Tolerance for precision of coordinates.
!
      real(r_typ), parameter :: eps=1.e-6_r_typ
!
!-----------------------------------------------------------------------
!
      integer :: i
!
!-----------------------------------------------------------------------
!
! ****** Set mesh resolutions.
!
      nt = ntm1 + 1
      np = npm1 + 1
      ntm2 = ntm1 - 1
      npm2 = npm1 - 1
!
! ****** Set "main mesh" compute resolution.
! ****** The phi direction has an extra point for a two-point overlap.
!
      ntm = ntm1
      npm = np
!
! ****** Check that the mesh covers a complete spherical surface.
!
      if (abs(t(1)).gt.eps.or. &
          abs(t(ntm)-pi).gt.eps.or. &
          abs(p(1)).gt.eps.or. &
          abs(p(npm-1)-twopi).gt.eps) then
        write (*,*)
        write (*,*) '### ERROR in ',cname,':'
        write (*,*) '### Anomaly in data file coordinates:'
        write (*,*)
        write (*,*) 'Expected t range:'
        write (*,*) 'Min: ',0.
        write (*,*) 'Max: ',pi
        write (*,*) 'Actual t range:'
        write (*,*) 'Min: ',t(1)
        write (*,*) 'Max: ',t(ntm)
        write (*,*)
        write (*,*) 'Expected p range:'
        write (*,*) 'Min: ',0.
        write (*,*) 'Max: ',twopi
        write (*,*) 'Actual p range:'
        write (*,*) 'Min: ',p(1)
        write (*,*) 'Max: ',p(npm-1)
        call exit (1)
      end if
!
! ****** Allocate main mesh grid quantities.
!
      allocate (dt(ntm))
      allocate (dt_i(ntm))
      allocate (st(ntm))
      allocate (st_i(ntm))
      allocate (ct(ntm))
      allocate (dp(npm))
      allocate (dp_i(npm))
!
! ****** Allocate half mesh grid quantities.
!
      allocate (th(nt))
      allocate (ph(np))
      allocate (dth(nt))
      allocate (dth_i(nt))
      allocate (sth(nt))
      allocate (cth(nt))
      allocate (dph(np))
      allocate (dph_i(np))
!
! ****** Set theta grids.
!
      do i=2,ntm1
        th(i) = half*(t(i) + t(i-1))
        dth(i) = t(i) - t(i-1)
      enddo
      th(1) = th(2) - dth(2)
      th(nt) = th(ntm1) + dth(ntm1)
      dth(1) = dth(2)
      dth(nt) = dth(ntm1)
      dth_i(:) = one/dth(:)
!
      do i=1,ntm
        dt(i) = th(i+1) - th(i)
        dt_i(i) = one/dt(i)
      enddo
!
      st(:) = sin(t(:))
      st(1) = 0.
      st(ntm) = 0.
!
      ct(:) = cos(t(:))
      ct(1) = one
      ct(ntm) = one
!
      st_i(2:ntm-1) = one/st(2:ntm-1)
      st_i(1) = 0.
      st_i(ntm) = 0.
      sth(:) = sin(th(:))
      cth(:) = cos(th(:))
!
! ****** Set phi grids.
!
      do i=2,np
        ph(i) = half*(p(i) + p(i-1))
        dph(i) = p(i) - p(i-1)
      enddo
      ph(1) = ph(npm1) - twopi
      dph(1) = dph(npm1)
!
      dph_i(:)=one/dph(:)
!
      do i=1,npm-1
        dp(i) = ph(i+1) - ph(i)
      enddo
      dp(npm) = dp(2)
!
      dp_i(:) = one/dp(:)
!$acc enter data copyin (t,p,dt,dt_i,st,st_i,ct,dp,dp_i,th,ph, &
!$acc                    dth,dth_i,sth,cth,dph,dph_i)
!
end subroutine
!#######################################################################
subroutine load_diffusion
!
!-----------------------------------------------------------------------
!
! ****** Define the diffusion coef array.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use mesh
      use fields
      use input_parameters
      use constants
      use read_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k,ierr
      real(r_typ) :: fn1,fs1
!
      integer :: nft,nfp
      real(r_typ), dimension(:), allocatable :: tf,pf
      real(r_typ), dimension(:,:), allocatable :: vf,diffusion_coef_file
!
!-----------------------------------------------------------------------
!
! ****** Allocate memory for the total diffusion coef on the half mesh.
!
      allocate (diffusion_coef(nt,np))
!
! ****** Set the initial diffusion coef to the uniform value.
!
      diffusion_coef(:,:) = diffusion_coef_constant
!
! ****** Read the diffusion coef file, if it was specified.
!
      if (diffusion_coef_filename.ne.' ') then
!
! ****** Load the diffusion coef into an array (assumes PT).
!
        call read_2d_file (diffusion_coef_filename,nfp,nft,vf,pf,tf,ierr)
        vf(:,:) = TRANSPOSE(vf(:,:))
!
! ****** Interpolate the diffusion coef onto the half mesh (th,ph).
!
        allocate (diffusion_coef_file(nt,np))
!
        call interp2d (nft,nfp,tf,pf,vf,nt,np,th,ph, &
                       diffusion_coef_file,ierr)
!
! ****** Error exit: interpolation error.
!
        if (ierr.ne.0) then
          write (*,*)
          write (*,*) '### ERROR in LOAD_DIFFUSION_COEF:'
          write (*,*) '### The scales in the diffusion coef file'// &
                 ' are not monotonically increasing.'
          write (*,*) 'File name: ',trim(diffusion_coef_filename)
          call exit (1)
        end if
!
! ****** Enforce periodicity.
!
        diffusion_coef_file(:, 1) = diffusion_coef_file(:,npm1)
        diffusion_coef_file(:,np) = diffusion_coef_file(:,   2)
!
! ****** Set the pole value to only have an m=0 component.
!
        fn1 = 0.
        fs1 = 0.
        do k=2,npm1
          fn1 = fn1 + diffusion_coef_file(2,k)*dph(k)
          fs1 = fs1 + diffusion_coef_file(ntm1,k)*dph(k)
        enddo
        fn1 = fn1/twopi
        fs1 = fs1/twopi
!
        diffusion_coef_file( 1,:) = two*fn1 &
                                    - diffusion_coef_file(   2,:)
        diffusion_coef_file(nt,:) = two*fs1 &
                                    - diffusion_coef_file(ntm1,:)
!
        if (verbose) then
          write (*,*)
          write (*,*) 'Diffusion coef from file: ', &
                                           trim(diffusion_coef_filename)
          write (*,*) 'Minimum value = ',minval(diffusion_coef_file)
          write (*,*) 'Maximum value = ',maxval(diffusion_coef_file)
        end if
!
! ****** Add the file diffusion coef to the uniform value.
!
        diffusion_coef(:,:) = diffusion_coef(:,:) &
                            + diffusion_coef_file(:,:)
!
        deallocate (diffusion_coef_file)
        deallocate (vf)
        deallocate (tf)
        deallocate (pf)
!
      end if
!
! ****** Add grid-based diffusion coef if requested.
!
      if (diffusion_coef_grid) then
        do k=1,np
          do j=1,nt
            diffusion_coef(j,k) = diffusion_coef(j,k) &
                             + (dth(j)**2 + (dph(k)*sth(j))**2)
          enddo
        enddo

        if (verbose) then
          write (*,*)
          write (*,*) 'Grid-based diffusion coef is activated.'
        end if

      end if
!
      diffusion_coef(:,:) = diffusion_coef_factor*diffusion_coef(:,:)
!
      d2t_j1 = diffusion_coef_t_fac*two*(diffusion_coef(1,1)+ &
               diffusion_coef(2,1))*twopi_i*dt_i(1)*dt_i(1)
!
      d2t_jntm1 = diffusion_coef_t_fac*two*(diffusion_coef(ntm,1)+ &
                  diffusion_coef(ntm-1,1))*twopi_i*dt_i(ntm)*dt_i(ntm)
!
!$acc enter data copyin(diffusion_coef)
!
      call load_diffusion_matrix
!
end subroutine
!#######################################################################
subroutine load_source
!
!-----------------------------------------------------------------------
!
! ****** Define the source term for the diffusion equation.
!
! ****** This is read in from the file SOURCEFILE if it is not blank.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use mesh
      use fields
      use input_parameters
      use constants
      use read_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: k,ierr
      real(r_typ) :: fn1,fs1
!
      integer :: nft,nfp
      real(r_typ), dimension(:), allocatable :: tf,pf
      real(r_typ), dimension(:,:), allocatable :: sf
!
!-----------------------------------------------------------------------
!
! ****** Allocate memory for the source term.
!
      allocate (source(ntm,npm))
!
      source=0.
!
! ****** Read the source file if it was specified.
!
      if (source_filename.ne.' ') then
!
        call read_2d_file (source_filename,nfp,nft,sf,pf,tf,ierr)
        sf(:,:) = TRANSPOSE(sf(:,:))
!
! ****** Interpolate the source term onto the main mesh (t,p).
!
        call interp2d (nft,nfp,tf,pf,sf,ntm,npm,t,p,source,ierr)
        if (ierr.ne.0) then
          write (*,*)
          write (*,*) '### ERROR in LOAD_SOURCE:'
          write (*,*) '### The scales in the source term file are'// &
                        ' not monotonically increasing.'
          write (*,*) 'File name: ',trim(source_filename)
          call exit (1)
        end if
!
! ****** Enforce periodicity.
!
        source(:,   1)=half*(source(:,1)+source(:,npm))
        source(:,npm-1)=source(:,1)
!
! ****** Set the pole value to only have an m=0 component.
!
        fn1=0.
        fs1=0.
        do k=1,npm-2
          fn1=fn1+source(  1,k)*dp(k)
          fs1=fs1+source(ntm,k)*dp(k)
        enddo
        fn1=fn1/twopi
        fs1=fs1/twopi
!
        source(  1,:)=fn1
        source(ntm,:)=fs1
!
        if (verbose) then
          write (*,*)
          write (*,*) 'A source term was read in from file: ', &
                     trim(source_filename)
          write (*,*) 'Minimum value = ',minval(source)
          write (*,*) 'Maximum value = ',maxval(source)
        end if
!
        deallocate (sf)
        deallocate (tf)
        deallocate (pf)
!
      end if
!
end subroutine
!#######################################################################
subroutine load_vt
!
!-----------------------------------------------------------------------
!
! ****** Define the theta component of the flow.
!
! ****** This is read in from the file VT_FILE if it is not blank.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use mesh
      use fields
      use input_parameters
      use constants
      use read_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: k,ierr
      real(r_typ) :: fn1,fs1
!
      integer :: nft,nfp
      real(r_typ), dimension(:), allocatable :: tf,pf
      real(r_typ), dimension(:,:), allocatable :: sf
!
!-----------------------------------------------------------------------
!
! ****** Read the vt file if it was specified.
!
        call read_2d_file (flow_vt_filename,nfp,nft,sf,pf,tf,ierr)
        sf(:,:) = TRANSPOSE(sf(:,:))
!
! ****** Interpolate vt onto the half mesh (th,ph).
!
        call interp2d (nft,nfp,tf,pf,sf,nt,np,th,ph,vt,ierr)
! ****** Error exit: interpolation error.
        if (ierr.ne.0) then
          write (*,*)
          write (*,*) '### ERROR in LOAD_VT:'
          write (*,*) '### The scales in the vt file are'// &
                        ' not monotonically increasing.'
          write (*,*) 'File name: ',trim(flow_vt_filename)
          call exit (1)
        end if
!
! ****** Enforce periodicity.
!
        vt(:, 1)=vt(:,npm1)
        vt(:,np)=vt(:,   2)
!
! ****** Set the pole value to only have an m=0 component.
!
        fn1=0.
        fs1=0.
        do k=2,npm1
          fn1=fn1+vt(   2,k)*dph(k)
          fs1=fs1+vt(ntm1,k)*dph(k)
        enddo
        fn1=fn1/twopi
        fs1=fs1/twopi
!
        vt( 1,:)=two*fn1-vt(   2,:)
        vt(nt,:)=two*fs1-vt(ntm1,:)
!
        if (verbose) then
          write (*,*)
          write (*,*) 'The flow component vt was read in'// &
                     ' from file: ',trim(flow_vt_filename)
          write (*,*) 'Minimum value = ',minval(vt)
          write (*,*) 'Maximum value = ',maxval(vt)
        end if
!
        deallocate (sf)
        deallocate (tf)
        deallocate (pf)
!
end subroutine
!#######################################################################
subroutine load_vp
!
!-----------------------------------------------------------------------
!
! ****** Define the phi component of the flow.
!
! ****** This is read in from the file VP_FILE if it is not blank.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use mesh
      use fields
      use input_parameters
      use constants
      use read_2d_file_interface
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k,ierr
      real(r_typ) :: fn1,fs1
!
      integer :: nft,nfp
      real(r_typ), dimension(:), allocatable :: tf,pf
      real(r_typ), dimension(:,:), allocatable :: sf
!
!-----------------------------------------------------------------------
!
! ****** Read the vp file if it was specified.
!
        call read_2d_file (flow_vp_filename,nfp,nft,sf,pf,tf,ierr)
        sf(:,:) = TRANSPOSE(sf(:,:))
!
! ****** Interpolate vp onto the half mesh (th,ph).
!
        call interp2d (nft,nfp,tf,pf,sf,nt,np,th,ph,vp,ierr)
!
        if (ierr.ne.0) then
          write (*,*)
          write (*,*) '### ERROR in LOAD_VP:'
          write (*,*) '### The scales in the vp file are'// &
                        ' not monotonically increasing.'
          write (*,*) 'File name: ',trim(flow_vp_filename)
          call exit (1)
        end if
!
! ****** Enforce periodicity.
!
        vp(:, 1)=vp(:,npm1)
        vp(:,np)=vp(:,   2)
!
! ****** Set the pole value to only have an m=0 component.
!
        fn1=0.
        fs1=0.
        do k=2,npm1
          fn1=fn1+vp(   2,k)*dph(k)
          fs1=fs1+vp(ntm1,k)*dph(k)
        enddo
        fn1=fn1/twopi
        fs1=fs1/twopi
!
        vp( 1,:)=two*fn1-vp(   2,:)
        vp(nt,:)=two*fs1-vp(ntm1,:)
!
        if (verbose) then
          write (*,*)
          write (*,*) 'The flow component vp was read in'// &
                     ' from file: ',trim(flow_vp_filename)
          write (*,*) 'Minimum value = ',minval(vp)
          write (*,*) 'Maximum value = ',maxval(vp)
        end if
!
        deallocate (sf)
        deallocate (tf)
        deallocate (pf)
!
end subroutine
!#######################################################################
subroutine add_flow_differential_rotation_aft
!
!-----------------------------------------------------------------------
!
! ****** Add the AFT differential rotation flow to vp.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Parameters in m/s
!
      real(r_typ) :: t0 = 46.0_r_typ
      real(r_typ) :: t2 = -262.0_r_typ
      real(r_typ) :: t4 = -379.0_r_typ
!
!-----------------------------------------------------------------------
!
      integer :: j,k
!
!-----------------------------------------------------------------------
!
!$omp parallel do collapse(2) default(shared)
!$acc parallel loop collapse(2) default(present)
      do j=1,nt
        do k=1,np
          vp(j,k)=vp(j,k) + &
                  m_s_to_rs_hr*sth(j)*(t0 + t2*cth(j)**2 + t4*cth(j)**4)
        enddo
      enddo
!$omp end parallel do
!
end subroutine
!#######################################################################
subroutine add_flow_meridianal_aft
!
!-----------------------------------------------------------------------
!
! ****** Add the AFT meridianal flow to vt.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Paramters in m/s
!
      real(r_typ) :: s1 = 22.0_r_typ
      real(r_typ) :: s3 = 11.0_r_typ
      real(r_typ) :: s5 = -28.0_r_typ
!
!-----------------------------------------------------------------------
!
      integer :: j,k
!
!-----------------------------------------------------------------------
!
!$omp parallel do collapse(2) default(shared)
!$acc parallel loop collapse(2) default(present)
      do j=1,nt
        do k=1,np
          vt(j,k) = vt(j,k) - m_s_to_rs_hr*sth(j)*               &
                   ( s1*cth(j) + s3*cth(j)**3 + s5*cth(j)**5 )
        enddo
      enddo
!$omp end parallel do
!
end subroutine
!#######################################################################
subroutine get_flow_dtmax (dtmax)
!
!-----------------------------------------------------------------------
!
! ****** Get the maximum time step that can be used for stable
! ****** (explicit) advection.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use input_parameters
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtmax
!
!-----------------------------------------------------------------------
!
      integer :: j,k
      real(r_typ) :: kdotv,deltat
!
!-----------------------------------------------------------------------
!
      dtmax = huge(dtmax)
!
!$omp parallel do default(shared) collapse(2) reduction(min:dtmax)
!$acc parallel loop default(present) collapse(2) reduction(min:dtmax)
      do k=2,npm1
        do j=2,ntm1
          kdotv = ABS(vt(j,k))/dt(j) + ABS(vp(j,k))/(sth(j)*dph(k))
          deltat = one/MAX(kdotv,small_value)
          dtmax = MIN(dtmax,deltat)
        enddo
      enddo
!$omp end parallel do
!
      dtmax = safety*dtmax
!
end subroutine
!#######################################################################
subroutine diffusion_step_euler_cd (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Diffuse the field by a time step using 1st order Euler in time
! ****** and 2nd-order central differencing in space.
! ****** This routine does not use the matrix coefs which it could.
!
!-----------------------------------------------------------------------
!
      use number_types
      use mesh
      use fields
      use input_parameters
      use globals
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
      integer :: j,k
      integer*8 :: i,n_stable_cycles
      real(r_typ) :: fn2_fn1,fs2_fs1
      real(r_typ) :: d2t,d2p,dtime_stable
!
!-----------------------------------------------------------------------
!
! ****** Allocate temporary field.
!
      allocate (fe(ntm,npm))
!$acc enter data create(fe)
!
! ****** Subcycle at a stable time-step.
!
      n_stable_cycles = CEILING(dtime_local/dtime_diff_euler,8)
      dtime_stable = dtime_local/n_stable_cycles
!
      do i=1,n_stable_cycles
!
        fn2_fn1 = 0.
        fs2_fs1 = 0.
!
!$omp parallel default(shared) private(j,k,d2t,d2p)
!
! ****** Save current x to fe (old).
!
!$omp do collapse(2)
!$acc parallel loop default(present) collapse(2)
        do k=1,npm
          do j=1,ntm
            fe(j,k) = f(j,k)
          enddo
        enddo
!$omp end do
!
! ****** Compute y=Ax.
!
! ****** Advance the poles.
!
!$omp do reduction(+:fn2_fn1,fs2_fs1)
!$acc parallel loop default(present) reduction(+:fn2_fn1,fs2_fs1)
        do k=2,npm-1
          fn2_fn1 = fn2_fn1 + (fe(2    ,k) - fe(1  ,k))*dp(k)
          fs2_fs1 = fs2_fs1 + (fe(ntm-1,k) - fe(ntm,k))*dp(k)
        enddo
!$omp end do
!
!$omp end parallel
!
!$omp parallel do default(shared) private(j,k,d2t,d2p)
!$acc parallel loop default(present)
        do k=1,npm
          f(  1,k) = fe(1  ,k) + dtime_stable*(   d2t_j1*fn2_fn1)
          f(ntm,k) = fe(ntm,k) + dtime_stable*(d2t_jntm1*fs2_fs1)
        enddo
!$omp end parallel do
!
! ****** Compute inner points.
!
!$omp parallel do default(shared) private(j,k,d2t,d2p)
!$acc parallel loop collapse(2) default(present)
        do k=2,npm-1
          do j=2,ntm-1
            d2p=( diffusion_coef(j,k+1)*(fe(j,k+1)-fe(j,k  ))*dph_i(k+1) &
                 -diffusion_coef(j,k  )*(fe(j,k  )-fe(j,k-1))*dph_i(k  ) &
                 )*dp_i(k)*st_i(j)*st_i(j)
            d2t=( diffusion_coef(j+1,k)*sth(j+1) &
                                  *(fe(j+1,k)-fe(j  ,k))*dth_i(j+1) &
                 -diffusion_coef(j,k)*sth(j  ) &
                                  *(fe(j  ,k)-fe(j-1,k))*dth_i(j  ) &
                )*st_i(j)*dt_i(j)
!
            f(j,k) = fe(j,k) + dtime_stable*(diffusion_coef_t_fac*d2t + &
                                             diffusion_coef_p_fac*d2p)
          enddo
        enddo
!$omp end parallel do
!
! ****** Set periodic boundary points.
!
        call set_periodic_bc_2d (f,ntm,npm)
!
      enddo
!
!$acc exit data delete(fe)
      deallocate (fe)
!
end subroutine
!#######################################################################
subroutine advection_step_upwind (dtime_local)
!
!-----------------------------------------------------------------------
!
! ****** Advance the field with advection by the time-step DT
! ****** using the upwind method.
!
!-----------------------------------------------------------------------
!
      use number_types
      use input_parameters
      use constants
      use mesh
      use fields
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: dtime_local
!
!-----------------------------------------------------------------------
!
      integer :: j,k,kp1
      real(r_typ) :: cct,ccp
!
      real(r_typ) :: fn = zero
      real(r_typ) :: fs = zero
!
      real(r_typ), dimension(:,:), allocatable :: flux_t,flux_p
!
!-----------------------------------------------------------------------
!
! ****** Allocate temporary flux arrays on the half-mesh.
!
      allocate (flux_t(nt,np))
      allocate (flux_p(nt,np))
!
!$acc enter data create(flux_t,flux_p)
!
!$omp parallel default(shared) private(j,k,cct,ccp)
!$omp do collapse(2)
!$acc parallel loop collapse(2) default(present)
      do k=1,np
        do j=1,nt
          flux_t(j,k)=0.
          flux_p(j,k)=0.
        enddo
      enddo
!$omp end do
!
! ****** Compute the fluxes at the cell faces.
!
!$omp do collapse(2)
!$acc parallel loop collapse(2) default(present)
      do k=2,npm1
        do j=2,ntm1
          cct=sign(upwind,vt(j,k))
          ccp=sign(upwind,vp(j,k))
          flux_t(j,k)=vt(j,k)*half*((one-cct)*f(j,k)+(one+cct)*f(j-1,k))
          flux_p(j,k)=vp(j,k)*half*((one-ccp)*f(j,k)+(one+ccp)*f(j,k-1))
        enddo
      enddo
!$omp end do
!$omp end parallel
!
! ****** Set periodicity of the flux (seam).
!
      call set_periodic_bc_2d (flux_t,nt,np)
      call set_periodic_bc_2d (flux_p,nt,np)
!
! ****** Advect F by one time step.
!
!$omp parallel default(shared) private(j,k)
!$omp do
!$acc parallel loop collapse(2) default(present)
      do k=2,npm-1
        do j=2,ntm-1
          f(j,k) = f(j,k) - dtime_local*(  (  sth(j+1)*flux_t(j+1,k) &
                                            - sth(j  )*flux_t(j  ,k) &
                                           )*st_i(j)*dt_i(j)         &
                                         + (  flux_p(j,k+1)          &
                                            - flux_p(j,k  )          &
                                           )*st_i(j)*dp_i(k)         &
                                        )
        enddo
      enddo
!$omp end do
!
! ****** Advect the values at the poles.
!
!$omp do reduction(+:fn,fs)
!$acc parallel loop default(present) reduction(+:fn,fs)
      do k=2,npm-1
        fn = fn + flux_t(   2,k)*dph(k)
        fs = fs + flux_t(ntm1,k)*dph(k)
      enddo
!$omp end do
!
!$omp do
!$acc parallel loop default(present)
      do k=2,npm-1
        f(  1,k) = f(  1,k) - fn*dtime_local*two*pi_i*dt_i(  1)
        f(ntm,k) = f(ntm,k) + fs*dtime_local*two*pi_i*dt_i(ntm)
      end do
!$omp end do
!$omp end parallel
!
! ****** Set periodic boundary condition.
!
      call set_periodic_bc_2d (f,ntm,npm)
!
!$acc exit data delete(flux_t,flux_p)
      deallocate (flux_t)
      deallocate (flux_p)
!
end subroutine
!#######################################################################
subroutine ax (x,y)
!
!-----------------------------------------------------------------------
!
! ****** Apply the diffuse operator A as y=Ax.
!
!-----------------------------------------------------------------------
!
      use number_types
      use constants
      use mesh
      use fields
      use input_parameters
      use matrix_storage
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: j,k
      real(r_typ) :: fn2_fn1,fs2_fs1
      real(r_typ), dimension(ntm,npm) :: x,y
!
!-----------------------------------------------------------------------
!
! ****** Compute y=Ax.
!
      fn2_fn1 = zero
      fs2_fs1 = zero
!
!$omp parallel default(shared) private(j,k)
!
! ****** Compute inner points.
!
!$omp do collapse(2)
!$acc parallel loop collapse(2) default(present)
      do k=2,npm-1
        do j=2,ntm-1
          y(j,k) =  coef(j,k,1)*x(j,  k-1) &
                  + coef(j,k,2)*x(j-1,k  ) &
                  + coef(j,k,3)*x(j  ,k  ) &
                  + coef(j,k,4)*x(j+1,k  ) &
                  + coef(j,k,5)*x(j,  k+1)
        enddo
      enddo
!$omp end do
!
! ****** Compute boundary points.
!
! ****** Get the m=0 components near the poles.
!
!$omp do reduction(+:fn2_fn1,fs2_fs1)
!$acc parallel loop default(present) reduction(+:fn2_fn1,fs2_fs1)
      do k=2,npm-1
        fn2_fn1 = fn2_fn1 + (x(2    ,k) - x(1  ,k))*dp(k)
        fs2_fs1 = fs2_fs1 + (x(ntm-1,k) - x(ntm,k))*dp(k)
      enddo
!$omp end do
!
!$omp do
!$acc parallel loop default(present)
      do k=1,npm
        y(  1,k) = d2t_j1*fn2_fn1
        y(ntm,k) = d2t_jntm1*fs2_fs1
      enddo
!$omp end do
!$omp end parallel
!
! ****** Set the periodic boundary conditions.
!
      call set_periodic_bc_2d (y,ntm,npm)
!
end subroutine
!#######################################################################
subroutine get_m0 (f,fn1,fn2,fs1,fs2)
!
!-----------------------------------------------------------------------
!
! ****** Get the m=0 component of the field F near the North and
! ****** South poles.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use constants
      use mesh
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      real(r_typ), dimension(ntm,npm) :: f
!
!-----------------------------------------------------------------------
!
      real(r_typ) :: fn1,fn2,fs1,fs2
!
!-----------------------------------------------------------------------
!
      integer :: k
!
!-----------------------------------------------------------------------
!
      fn1 = 0.
      fn2 = 0.
      fs1 = 0.
      fs2 = 0.
!
      do k=2,npm-1
        fn1 = fn1 + f(1,k)*dp(k)
        fn2 = fn2 + f(2,k)*dp(k)
        fs1 = fs1 + f(ntm,k)*dp(k)
        fs2 = fs2 + f(ntm-1,k)*dp(k)
      enddo
!
      fn1 = fn1*twopi_i
      fn2 = fn2*twopi_i
      fs1 = fs1*twopi_i
      fs2 = fs2*twopi_i
!
end subroutine
!#######################################################################
subroutine interp2d (nxi,nyi,xi,yi,fi,nx,ny,x,y,f,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Interpolate a 2D field from array FI(NXI,NYI), defined
! ****** on the mesh XI(NXI) x YI(NYI), into the array F(NX,NY),
! ****** defined on the mesh X(NX) x Y(NY).
!
! ****** Zero values are returned at data points outside the
! ****** bounds of the XI x YI mesh.
!
!-----------------------------------------------------------------------
!
      use number_types
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: nxi,nyi
      real(r_typ), dimension(nxi) :: xi
      real(r_typ), dimension(nyi) :: yi
      real(r_typ), dimension(nxi,nyi) :: fi
      integer :: nx,ny
      real(r_typ), dimension(nx) :: x
      real(r_typ), dimension(ny) :: y
      real(r_typ), dimension(nx,ny) :: f
      integer :: ierr
!
!-----------------------------------------------------------------------
!
      integer :: i,j,ii,jj,iip1,jjp1
      real(r_typ) :: dummy,ax,ay,xv,yv
!
!-----------------------------------------------------------------------
!
      real(r_typ), external :: flint
!
!-----------------------------------------------------------------------
!
      ierr=0
!
! ****** Check that the scales XI and YI are monotonic.
!
      dummy=flint(.true.,zero,nxi,xi,xi,ierr)
      dummy=flint(.true.,zero,nyi,yi,yi,ierr)
      if (ierr.ne.0) then
        write (*,*)
        write (*,*) '### ERROR in INTRP2D:'
        write (*,*) '### Scales are not monotonically increasing.'
        ierr=1
        return
      end if
!
! ****** Interpolate the data.
!
      do j=1,ny
        yv=y(j)
        if (yv.lt.yi(1).or.yv.gt.yi(nyi)) then
          f(:,j)=0.
          cycle
        else
          call interp (nyi,yi,yv,jj,jjp1,ay,ierr)
          if (ierr.ne.0) then
            f(:,j)=0.
            cycle
          end if
        end if
        do i=1,nx
          xv=x(i)
          if (xv.lt.xi(1).or.xv.gt.xi(nxi)) then
            f(i,j)=0.
            cycle
          else
            call interp (nxi,xi,xv,ii,iip1,ax,ierr)
            if (ierr.ne.0) then
              f(i,j)=0.
              cycle
            end if
          end if
          f(i,j)=(one-ax)*((one-ay)*fi(ii  ,jj  )+ay*fi(ii  ,jjp1)) &
                 +ax *((one-ay)*fi(iip1,jj  )+ay*fi(iip1,jjp1))
        enddo
      enddo
!
end subroutine
!#######################################################################
function flint (check,x,n,xn,fn,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Interpolate a function linearly.
!
!-----------------------------------------------------------------------
!
! ****** The funcion is defined at N nodes, with values given by
! ****** FN(N) at positions XN(N).  The function value returned is
! ****** the linear interpolant at X.
!
! ****** Note that if X.lt.XN(1), the function value returned
! ****** is FN(1), and if X.gt.XN(N), the function value returned
! ****** is FN(N).
!
! ****** Call once with CHECK=.true. to check that the values
! ****** in XN(N) are monotonically increasing.  In this mode
! ****** the array XN(N) is checked, and X and FN(N) are not
! ****** accessed.  If the check is passed, IERR=0 is returned.
! ****** Otherwise, IERR=1 is returned.
!
!-----------------------------------------------------------------------
!
      use number_types
      use constants
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      logical :: check
      real(r_typ) :: x
      integer :: n
      real(r_typ), dimension(n) :: xn,fn
      integer :: ierr
      real(r_typ) :: flint
!
!-----------------------------------------------------------------------
!
      integer :: i
      real(r_typ) :: x1,x2,alpha
!
!-----------------------------------------------------------------------
!
      ierr=0
      flint=0.
!
! ****** If CHECK=.true., check the abscissa table.
!
      if (check) then
        if (n.le.0) then
          write (*,*)
          write (*,*) '### ERROR in FLINT:'
          write (*,*) '### Invalid abscissa table dimension.'
          write (*,*) 'N = ',n
          ierr=1
          return
        end if
        do i=1,n-1
          if (xn(i+1).le.xn(i)) then
            write (*,*)
            write (*,*) '### ERROR in FLINT:'
            write (*,*) '### Abscissa table values are not'// &
                       ' monotonically increasing.'
            write (*,*) 'N = ',n
            write (*,*) 'XN = ',xn
            ierr=1
            return
          end if
        enddo
        return
      end if
!
! ****** Get the interpolated value.
!
      if (x.le.xn(1)) then
        flint=fn(1)
      else if (x.gt.xn(n)) then
        flint=fn(n)
      else
        do i=1,n-1
          if (x.ge.xn(i).and.x.lt.xn(i+1)) exit
        enddo
        x1=xn(i)
        x2=xn(i+1)
        alpha=(x-x1)/(x2-x1)
        flint=fn(i)*(one-alpha)+fn(i+1)*alpha
      end if
!
      return
end function
!#######################################################################
subroutine interp (n,x,xv,i,ip1,a,ierr)
!
!-----------------------------------------------------------------------
!
! ****** Get the interpolation factor at XV from the table X(N).
!
!-----------------------------------------------------------------------
!
! ****** This routine does not do the actual interpolation.  Use the
! ****** returned values of I, IP1, and A to get the interpolated
! ****** value.
!
!-----------------------------------------------------------------------
!
      use number_types
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
      integer :: n
      real(r_typ), dimension(n) :: x
      real(r_typ) :: xv
      integer :: i,ip1
      real(r_typ) :: a
      integer :: ierr
!
!-----------------------------------------------------------------------
!
      ierr=0
!
! ****** Check if the x-scale has only one point.
!
      if (n.eq.1.and.xv.eq.x(1)) then
        ip1=1
        a=0.
        return
      end if
!
! ****** Find the interval and compute the interpolation factor.
!
      do i=1,n-1
        if (xv.ge.x(i).and.xv.le.x(i+1)) then
          ip1=i+1
          if (x(i).eq.x(i+1)) then
            a=0.
          else
            a=(xv-x(i))/(x(i+1)-x(i))
          end if
          return
        end if
      enddo
!
! ****** ERROR: the value was not found.
!
      ierr=1
!
end subroutine
!#######################################################################
subroutine read_input
!
!-----------------------------------------------------------------------
!
! ****** Read parameters from the command line arguments.
!
!-----------------------------------------------------------------------
!
      use ident
      use number_types
      use constants
      use syntax
      use paragraph_def
      use get_usage_line_interface
      use print_par_interface
      use delete_par_interface
      use input_parameters
!
!-----------------------------------------------------------------------
!
      implicit none
!
!-----------------------------------------------------------------------
!
! ****** Storage the for usage line.
!
      type(paragraph), pointer :: usage
!
! ****** Storage for the error message.
!
      character(72) :: errmsg
!
!-----------------------------------------------------------------------
!
      integer :: ierr
      character(512) :: arg
      logical :: set
!
!-----------------------------------------------------------------------
!
      real(r_typ), external :: fpval
      integer, external :: intval
!
!-----------------------------------------------------------------------
!
! ****** Define the syntax.
!
      call defarg (GROUP_K ,'-v',' ',' ')
      call defarg (GROUP_A ,'initial_field_filename',' ',' ')
      call defarg (GROUP_KA,'-visc','0.','<val>')
      call defarg (GROUP_KA,'-diffusion_coef_filename','<none>','<file>')
      call defarg (GROUP_K,'-diffusion_coef_grid',' ',' ')
      call defarg (GROUP_KA,'-diffusion_coef_factor','1.','<val>')
      call defarg (GROUP_KA,'-s','<none>','<file>')
      call defarg (GROUP_KA,'-time','1.','<val>')
      call defarg (GROUP_KA,'-dm','2','<val>')
      call defarg (GROUP_KA,'-diffusion_subcycles','30',' ')
      call defarg (GROUP_A ,'output_field_root_filename',' ',' ')
      call defarg (GROUP_KA,'-uw','1.','<val>')
      call defarg (GROUP_KA,'-vtfile','<none>','<file>')
      call defarg (GROUP_KA,'-vpfile','<none>','<file>')
      call defarg (GROUP_KA,'-vpomega','0.','<val>')
      call defarg (GROUP_KA,'-dr','0','<val>')
      call defarg (GROUP_KA,'-mf','0','<val>')
      call defarg (GROUP_K,'-diff',' ',' ')
      call defarg (GROUP_K,'-flow',' ',' ')
      call defarg (GROUP_KA,'-difftfac','1.','<val>')
      call defarg (GROUP_KA,'-diffpfac','1.','<val>')
      call defarg (GROUP_K,'-vrun',' ',' ')
!
! ****** Parse the command line.
!
      call parse (errmsg,ierr)
!
      if (ierr.ne.0) then
!
        write (*,*)
        write (*,*) '### ',cname,' Version ',cvers,' of ',cdate,'.'
        write (*,*) '### Diffuse and advect a 2D scalar field on'// &
                   ' the surface of a sphere.'
!
! ****** Print the usage line.
!
        call get_usage_line (usage)
!
        write (*,*)
        write (*,*) 'Usage:'
        write (*,*)
!
        call print_par (usage)
!
        call delete_par (usage)
!
        write (*,*)
        write (*,*) '-time <#> Set the end time. (Default 1.0)'
        write (*,*)
       write (*,*) 'Viscosity is set as: diffusion_coef_factor*(visc + visc_file '// &
                    '+ visc_grid)'
        write (*,*) ' '
        write (*,*) ' -diffusion_coef_factor <#> (Overall multiplier, Default: 1.0)'
        write (*,*) ' -visc <#> (Uniform viscosity)'
        write (*,*) '           Default: If neither diffusion_coef_filename or '// &
                        'diffusion_coef_grid set, 1, otherwise, 0.'
        write (*,*) ' -diffusion_coef_filename <fname> (Read from file, Default: none)'
        write (*,*) '                    The file must contain a 2D'// &
                                      ' field with scales.'
        write (*,*) '                    Any region outside the '// &
                                        'domain is set to 0.'
        write (*,*) ' -diffusion_coef_grid (Grid viscosity, Default: disabled)'
        write (*,*) '           Defined by: visc_grid = dt^2 + '// &
                                '(sin(t)*dt)^2'
        write (*,*)
        write (*,*) 'Source term can be specified using: -s <file>.'
        write (*,*) '            (Default: none)'
        write (*,*) '            The file must contain a 2D'// &
                                ' field with scales.'
        write (*,*) '            Any region outside the '// &
                                'domain is set to 0.'
        write (*,*) ' '
        write (*,*)
        write (*,*) 'The flow field is specified using'// &
                    ' -vtfile and -vpfile.'// &
                    '  Flow components that are not'
        write (*,*) 'specified have zero values.'
        write (*,*)
        write (*,*) 'The upwind coefficient for the advective'// &
                    ' advance can be set via -uw'
        write (*,*) '(default=1.).'
!
        write (*,*) '-exp (Use old explicit algorithm for visc).'
        write (*,*) '-vrun (Activate validation run, more details to follow)'
        call exit (1)
!
      end if
!
! ****** Set the parameters.
!
! ****** Verbose flag.
!
      call fetcharg ('-v',set,arg)
      verbose = set
!
! ****** Input file.
!
      call fetcharg ('initial_field_filename',set,arg)
      initial_field_filename = trim(arg)
!
! ****** Output file.
!
      call fetcharg ('output_field_root_filename',set,arg)
      output_field_root_filename = trim(arg)
!
! ****** Viscosity file.
!
      call fetcharg ('-diffusion_coef_filename',set,arg)
      if (set) then
        diffusion_coef_filename = trim(arg)
      else
        diffusion_coef_filename = ' '
      end if
!
! ****** Source term file.
!
      call fetcharg ('-s',set,arg)
      if (set) then
        source_filename = trim(arg)
      else
        source_filename = ' '
      end if
!
! ****** Uniform viscosity.
!
      call fetcharg ('-visc',set,arg)
      diffusion_coef_constant = fpval(arg,'-visc')
!
! ****** Viscosity multiplier.
!
      call fetcharg ('-diffusion_coef_factor',set,arg)
      if (set) diffusion_coef_factor = fpval(arg,'-diffusion_coef_factor')
!
! ****** Activate auto-viscosity.
!
      call fetcharg ('-diffusion_coef_grid',set,arg)
      diffusion_coef_grid = set
!
! ****** Upwind coefficient.
!
      call fetcharg ('-uw',set,arg)
      upwind=fpval(arg,'-uw')
!
! ****** File containing the theta component of the flow.
!
      call fetcharg ('-vtfile',set,arg)
      if (set) then
        flow_vt_filename = trim(arg)
      else
        flow_vt_filename = ' '
      end if
!
! ****** File containing the phi component of the flow.
!
      call fetcharg ('-vpfile',set,arg)
      if (set) then
        flow_vp_filename = trim(arg)
      else
        flow_vp_filename = ' '
      end if
!
      call fetcharg ('-vpomega',set,arg)
      flow_vp_rigid_omega = fpval(arg,'-vpomega')
!
      call fetcharg ('-dr',set,arg)
      flow_dr_model = intval(arg,'-dr')
      call fetcharg ('-mf',set,arg)
      flow_mf_model = intval(arg,'-mf')
!
! ****** Time to diffuse for.
!
      call fetcharg ('-time',set,arg)
      time_end=fpval(arg,'-time')
!
! ****** Use original explicit algorithm.
!
      call fetcharg ('-dm',set,arg)
      if (set) diffusion_num_method = intval(arg,'-dm')
!
! ****** Set number of STS sub-cycles per flow step.
!
      call fetcharg ('-diffusion_subcycles',set,arg)
      diffusion_subcycles = intval(arg,'-diffusion_subcycles')
!
! ****** Error-check parameters and set derived parameters.
!
! ****** Set the dimensions along which to filter.
!
      call fetcharg ('-diff',set,arg)
      if (set) advance_diffusion = .true.

      call fetcharg ('-flow',set,arg)
      if (set) advance_flow = .true.
!      
      call fetcharg ('-vrun',set,arg)
      validation_run = set      
!
! ****** Dimensions along which to diffuse.
!
      call fetcharg ('-difftfac',set,arg)
      if (set) diffusion_coef_t_fac = fpval(arg,'-difftfac')

      call fetcharg ('-diffpfac',set,arg)
      if (set) diffusion_coef_p_fac = fpval(arg,'-diffpfac')

!
end subroutine
!#######################################################################
!
!-----------------------------------------------------------------------
!
! ****** Update log:
!
!        05/24/2021, RC, Version 0.1.0:
!
!         - Original version of the program.
!           Derived from DIFFUSE_ADVECT version 2.0.0 of 05/24/2021.
!
!-----------------------------------------------------------------------
!