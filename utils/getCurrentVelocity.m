function currentVelocity = getCurrentVelocity()
    
    currentVelocity = zeros([3,1]);
    dir = -pi + rand(1)*(2*pi);
    min_crrent = 0.05/60;
    max_current = 0.1/60;
    current_val = min_crrent + rand(1)*(max_current - min_crrent);

    currentVelocity(1,1) = current_val*cos(dir);
    currentVelocity(2,1) = current_val*sin(dir);