UNAME = `uname`

.PHONY: all
all: build

.PHONY: build
build:
	gfortran -o mstm mpidefs-serial.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90

.PHONY: build-parallel
build-parallel:
	mpif90 -o mstmp mpidefs-parallel-v3.0.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90

.PHONY: compile
compile:
	-@make $(UNAME)

Linux:
	gfortran -shared -fPIC -O2 mpidefs-serial.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90 -o mstm.so

Darwin:
	gfortran -shared -dynamiclib -fPIC -O2 mpidefs-serial.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90 -o mstm.dylib


.PHONY: clean
clean:
	rm -f mstm *.mod *.dylib *.so