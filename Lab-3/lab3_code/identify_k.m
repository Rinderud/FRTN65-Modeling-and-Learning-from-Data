run('init_quadcopter_model')
run('init_quadcopter_states')
run('init_noise_levels')
addpath ('Lab-3/lab3_code/models')
%%
Omega_in.time = (0:inner_h:10)';

Omega_in.signals.values = ones(length(Omega_in.time),1)*ones(1,4);
%You will need to change ones to something better, HINT linspace
%%
disp('starting sim')
out = sim('omega_input','StopTime', '5')
disp('sim done')
%%
figure(1)
clf
plot(out.p)
title('Position')
legend('x','y','z')
exportgraphics(figure(1), "Lab-3/img/T1_fig1.pdf", "ContentType","vector")
%% Using Toolbox, estimating from accelerometer.
%Assuming that the only difference is to not do power of 2
dat1 = iddata(out.acc.data(:,3)+g,4*out.Omega.data(:,1),inner_h);

%dat2 = iddate(zdotdot + g, 4 * omega.^2, h)
dat2 = iddata(out.acc.data(:,3)+g,4*out.Omega.data(:,1).^2,inner_h);

%Same assumptions as on dat1s
dat3 = iddata(out.acc.data(:,3)+g,4*out.Omega.data(:,1).^3,inner_h);

sys1 = procest(dat1,'p0');
sys2 = procest(dat2,'p0'); %p0 means zero poles
sys3 = procest(dat3,'p0');

figure(2)
clf
subplot(3,1,1)
compare(dat1,sys1)
subplot(3,1,2)
compare(dat2,sys2)
subplot(3,1,3)
compare(dat3,sys3)
exportgraphics(figure(2), "Lab-3/img/T1_fig2.pdf", "ContentType","vector")

%u = 4 omega^2
%K_p = (zdotdot + g) / u
%k_est = K_p * m
k_ests = (out.acc.data(:,3)+g) .* m ./ (4 * out.Omega.data(:,1).^2);
% => an array of a k for each datapoint in zdotdot
k_est = mean(k_ests)
k
