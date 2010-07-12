========
MiniAMPL
========

A toy AMPL driver to demonstrate usage of the AMPL Solver Library and to get
you going with the writing of your own AMPL driver.

Installing
==========

First grab the libampl package from `http://www.gerad.ca/~orban/libampl.tar.bz2`
and follow the installation instructions (typically just `make`). The package
will download the AMPL Solver Library for you and build it.

Next, compile the `miniampl` executable. Edit the `Makefile` to specify the
location of your `libampl`, save and type `make`.

Example
=======

Once the `miniampl` executable is created, the following demonstrates how to
call it from the command line. A test example is supplied in `wb.mod` and
`wb.dat`. To generate the test example afresh, execute `ampl wb.ampl`.

::

    [dpo@pod:miniampl (master)]$ ./miniampl wb    # Only print objective value
    f(x0) = -2.000000000000000e+00

    [dpo@pod:miniampl (master)]$ ./miniampl -=    # Show available options
    showgrad  Evaluate gradient
    showname  Display objective name

    [dpo@pod:miniampl (master)]$ ./miniampl wb showname=1
    showname=1
    Objective name: objective
    f(x0) = -2.000000000000000e+00

    [dpo@pod:miniampl (master)]$ ./miniampl wb showname=1 showgrad=1
    showname=1
    showgrad=1
    Objective name: objective
    f(x0) = -2.000000000000000e+00
    g(x0) = [  1.0e+00  0.0e+00  0.0e+00 ]


What Next?
==========

Writing AMPL drivers is best learned by example. Look through the examples that
come with the AMPL Solver Library and keep `http://www.ampl.com/REFS/HOOKING`
at hand as a reference.

Good luck.
dominique.orban@gerad.ca
