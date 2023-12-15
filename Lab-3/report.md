# Learning Quadcopter Flight Dynamics

We denote the position of the quadcopter with $x, y, z$ [m],
the orientation by $\phi, \theta, \psi$ [rad]
and the angular speed of the four rotors as
$\mathbf{\Omega}~=~[\Omega_1, \Omega_2, \Omega_3, \Omega_4]$ [rad/s].

## Task 1, estimating $k$

Estimating $k$ using $k_{est} = K_p * m$.
Which is derived from $m \"{z} = F = 4 \cdot k\Omega^2 - mg$
where $\Omega_i = \Omega$ for all rotors,
and by letting the $u~=~4\Omega^2$ we get $\zeta~=~\"{z}+g~=~\frac{k}{m} * u$
This gives an estimate on the form $\zeta~=~K_p u$
from which we can estimate $k$ as $k_{est}~=~K_p \cdot m$. This results in the code below.

```matlab
k_est = sys2.Kp * m
```

Which results in $k_{est} = 2.2067e-08$, and the true $k = 2.2000e-08$.

This difference is $\approx 6.7e-11$ which is $0.3~\%$ of the true value. The estimation is very close to the real value and can be considered a good estimation.
