function rmat = optitrack_quat_to_dcm(q)
rmat = zeros(3,3);

rmat(1,1) = 1-2*q(2)*q(2)-2*q(3)*q(3); rmat(2,1) = 2*q(1)*q(2)-2*q(4)*q(3);   rmat(3,1) = 2*q(1)*q(3)+2*q(4)*q(2);
rmat(1,2) = 2*q(1)*q(2)+2*q(4)*q(3);   rmat(2,2) = 1-2*q(1)*q(1)-2*q(3)*q(3); rmat(3,2) = 2*q(2)*q(3)-2*q(4)*q(1);
rmat(1,3) = 2*q(1)*q(3)-2*q(4)*q(2);   rmat(2,3) = 2*q(2)*q(3)+2*q(4)*q(1);   rmat(3,3) = 1-2*q(1)*q(1)-2*q(2)*q(2);

rmat = rmat';
end