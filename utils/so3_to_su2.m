function [ su2_ ] = so3_to_su2(so3_)

% Notations
R11 = so3_(1,1);
R12 = so3_(1,2);
R13 = so3_(1,3);
R21 = so3_(2,1);
R22 = so3_(2,2);
R23 = so3_(2,3);
R31 = so3_(3,1);
R32 = so3_(3,2);
R33 = so3_(3,3);

% Algorithm
t = zeros(1,4);
t(1) = 1 + R11 + R22 + R33;
t(2) = 1 + R11 - R22 - R33;
t(3) = 1 - R11 + R22 - R33;
t(4) = 1 - R11 - R22 + R33;

[arg, idx] = max(t);

switch idx
    case 1
        q4 = 0.5*sqrt(arg);
        q1 = 1/(4*q4)*(R23 - R32);
        q2 = 1/(4*q4)*(R31 - R13);
        q3 = 1/(4*q4)*(R12 - R21);
    case 2
        q1 = 0.5*sqrt(arg);
        q2 = 1/(4*q1)*(R12 + R21);
        q3 = 1/(4*q1)*(R13 + R31);
        q4 = 1/(4*q1)*(R23 - R32);
    case 3
        q2 = 0.5*sqrt(arg);
        q1 = 1/(4*q2)*(R21 + R12);
        q3 = 1/(4*q2)*(R23 + R32);
        q4 = 1/(4*q2)*(R31 - R13);
    otherwise
        q3 = 0.5*sqrt(arg);
        q1 = 1/(4*q3)*(R31 + R13);
        q2 = 1/(4*q3)*(R32 + R23);
        q4 = 1/(4*q3)*(R12 - R21);
end

su2_ = [q1;q2;q3;q4];

end