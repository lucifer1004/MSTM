.PHONY: all
all: build

.PHONY: build
build:
	gfortran -o mstm mpidefs-serial.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90

.PHONY: build-parallel
build-parallel:
	mpif90 -o mstmp mpidefs-parallel-v3.0.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90

.PHONY: mac
mac:
	gfortran -static -dynamiclib -fPIC -O2 mstm-modules-v3.0.f90 mstm-intrinsics-v3.0.f90 mstm-main-v3.0.f90 mpidefs-serial.f90 -o mstm.dylib

.PHONY: linux
linux:
	gfortran -static -fPIC -O2 mstm-modules-v3.0.f90 mstm-intrinsics-v3.0.f90 mstm-main-v3.0.f90 mpidefs-serial.f90 -o mstm.so

.PHONY: clean
clean:
	rm -f mstm *.mod