load("thrustConfig.mat");
load("thruster_pwm.mat");
load("AUV.mat");
load("T200.mat");
%Calculate Earth magnetic field and secular variation at a location using International Geomagnetic Reference Field
[XYZ,H,D,I,F] = igrfmagm(1,33.7021,-117.7805,decyear(2024,7,4),13);
