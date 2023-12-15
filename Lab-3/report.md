# Learning Quadcopter Flight Dynamics

Written by: Jacob Rinderud.

## Task 1

### Results 1

Error using open
Failed to open MATLAB Editor.

>> identify_k

inner_h =

   1.0000e-03

sample_time =

   1.0000e-03
Warning: Name is nonexistent or not a directory: /MATLAB Drive/Lab-3/lab3_code/models > In path (line 109)
In addpath>doPathAddition (line 116)
In addpath (line 80)
In identify_k (line 4)
starting sim

out =

  Simulink.SimulationOutput:

                  Omega: [1x1 timeseries] 
                      T: [1x1 timeseries] 
                    acc: [1x1 timeseries] 
                 attacc: [1x1 timeseries] 
                attrate: [1x1 timeseries] 
                   deta: [1x1 timeseries] 
                    eta: [1x1 timeseries] 
                 moment: [1x1 timeseries] 
                      p: [1x1 timeseries] 
                   tout: [5004x1 double] 
                      v: [1x1 timeseries] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 

sim done
Error using exportgraphics
The value of 'destination' is invalid. Unable to create output file 'Lab-3/img/T1_fig1.pdf', No such file or directory.

Error in identify_k (line 20)
exportgraphics(figure(1), "Lab-3/img/T1_fig1.pdf", "ContentType","vector")

>> identify_k

inner_h =

   1.0000e-03

sample_time =

   1.0000e-03
Warning: Name is nonexistent or not a directory: /MATLAB Drive/Lab-3/lab3_code/models > In path (line 109)
In addpath>doPathAddition (line 116)
In addpath (line 80)
In identify_k (line 4)
starting sim

out =

  Simulink.SimulationOutput:

                  Omega: [1x1 timeseries] 
                      T: [1x1 timeseries] 
                    acc: [1x1 timeseries] 
                 attacc: [1x1 timeseries] 
                attrate: [1x1 timeseries] 
                   deta: [1x1 timeseries] 
                    eta: [1x1 timeseries] 
                 moment: [1x1 timeseries] 
                      p: [1x1 timeseries] 
                   tout: [5004x1 double] 
                      v: [1x1 timeseries] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 

sim done
Error using exportgraphics
The value of 'destination' is invalid. Unable to create output file 'Lab-3/img/T1_fig1.pdf', No such file or directory.

Error in identify_k (line 20)
exportgraphics(figure(1), "Lab-3/img/T1_fig1.pdf", "ContentType","vector")

>> identify_k

inner_h =

   1.0000e-03

sample_time =

   1.0000e-03
Warning: Name is nonexistent or not a directory: /MATLAB Drive/Lab-3/lab3_code/models > In path (line 109)
In addpath>doPathAddition (line 116)
In addpath (line 80)
In identify_k (line 4)
starting sim

out =

  Simulink.SimulationOutput:

                  Omega: [1x1 timeseries] 
                      T: [1x1 timeseries] 
                    acc: [1x1 timeseries] 
                 attacc: [1x1 timeseries] 
                attrate: [1x1 timeseries] 
                   deta: [1x1 timeseries] 
                    eta: [1x1 timeseries] 
                 moment: [1x1 timeseries] 
                      p: [1x1 timeseries] 
                   tout: [5004x1 double] 
                      v: [1x1 timeseries] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 

sim done

k_est =

   2.2067e-08

k =

   2.2000e-08

>> identify_k

inner_h =

   1.0000e-03

sample_time =

   1.0000e-03
Warning: Name is nonexistent or not a directory: /MATLAB Drive/Lab-3/lab3_code/models > In path (line 109)
In addpath>doPathAddition (line 116)
In addpath (line 80)
In identify_k (line 4)
starting sim

out =

  Simulink.SimulationOutput:

                  Omega: [1x1 timeseries] 
                      T: [1x1 timeseries] 
                    acc: [1x1 timeseries] 
                 attacc: [1x1 timeseries] 
                attrate: [1x1 timeseries] 
                   deta: [1x1 timeseries] 
                    eta: [1x1 timeseries] 
                 moment: [1x1 timeseries] 
                      p: [1x1 timeseries] 
                   tout: [5004x1 double] 
                      v: [1x1 timeseries] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 

sim done

sys1 =

Process model with transfer function:
  G(s) = Kp

        Kp = 0.00040866              

Parameterization:
    {'P0'}
   Number of free coefficients: 1
   Use "getpvec", "getcov" for parameters and their uncertainties.

Status:
Estimated using PROCEST on time domain data "dat1".
Fit to estimation data: 0%
FPE: 0.009938, MSE: 0.009934
 Model Properties

sys2 =

Process model with transfer function:
  G(s) = Kp

        Kp = 8.1731e-07              

Parameterization:
    {'P0'}
   Number of free coefficients: 1
   Use "getpvec", "getcov" for parameters and their uncertainties.

Status:
Estimated using PROCEST on time domain data "dat2".
Fit to estimation data: 0%
FPE: 0.009938, MSE: 0.009934
 Model Properties

sys3 =

Process model with transfer function:
  G(s) = Kp

        Kp = 1.6346e-09              

Parameterization:
    {'P0'}
   Number of free coefficients: 1
   Use "getpvec", "getcov" for parameters and their uncertainties.

Status:
Estimated using PROCEST on time domain data "dat3".
Fit to estimation data: 0%
FPE: 0.009938, MSE: 0.009934
 Model Properties

k_est =

   2.2067e-08

k =

   2.2000e-08

### Discussion 1

## Task 2

### Results 2

c = 1.1
Omega1 = sqrt(m*g/(2*(c^2+1)*k))
segments = 12
b_est =

### Discussion 2
