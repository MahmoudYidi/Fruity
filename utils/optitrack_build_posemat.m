function tmat = optitrack_build_posemat(tvec,qvec)

rmat = optitrack_quat_to_dcm(qvec);
tmat = eye(4,4);
tmat(1:3,1:3) = rmat;
tmat(1:3,4) = tvec';

end