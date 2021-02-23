.PHONY: all
all: install

.PHONY: install
install:
	gfortran -o mstm mpidefs-serial.f90 mstm-intrinsics-v3.0.f90 mstm-modules-v3.0.f90 mstm-main-v3.0.f90

.PHONY: clean
clean:
	rm mstm *.mod