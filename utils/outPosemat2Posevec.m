function posevec = outPosemat2Posevec(T)
    q = so3_to_su2(T(1:3,1:3));
    t = T(1:3,4);
    
    posevec = [t' q'];
end