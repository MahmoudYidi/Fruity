function T = inPosevec2Posemat(posevec)
    T = [su2_to_so3(posevec(1:4)) posevec(5:7)';
         zeros(1,3)                          1];
end