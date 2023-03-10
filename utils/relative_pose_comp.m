% %%%%%%%%%% Relative Pose Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script computes the relative pose between the camera and the target%
% Load the raw poses csv consisting of the translation and quotonian      %
% [rx,ry,rz,rw,tx,ty,tz]                                                  %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Paths to camera poses and target poses
world_cam = 'path to camera poses';
world_target = 'path to target poses';

% Number of images
Nos_image = 835;

% Read the camera and target pose data
posevecs_oc = readmatrix(world_cam);
posevecs_ot = readmatrix(world_target);

% Convert the pose data into cell arrays
posevecs_oc = iMatPts2CellPts(posevecs_oc, 7);
posevecs_ot = iMatPts2CellPts(posevecs_ot, 7);

% Initialize the A matrix
A = zeros(Nos_image,7);

% Loop over all images
for i = 1:Nos_image
    % Get the camera and target pose vectors for the current image
    posevec_oc = posevecs_oc{i};
    posevec_ot = posevecs_ot{i};
    
    % Compute the relative transformation between the camera and target
    T_oc = optitrack_build_posemat(posevec_oc(5:7),posevec_oc(1:4));
    T_ot = optitrack_build_posemat(posevec_ot(5:7),posevec_ot(1:4));
    T_ct = T_ot \ T_oc;
    
    % Compute the quaternion and translation vector from the relative transformation
    q = so3_to_su2(T_ct(1:3,1:3));
    t = T_ct(1:3,4);
    posevec = [q' t'];
    
    % Normalize the quaternion and store the pose vector in the A matrix
    posevec(1:4) = posevec(1:4)/norm(posevec(1:4));
    A(i,:) = posevec;
end

% Write the A matrix to a CSV file
writematrix(A,'final_relative_pose_raw.csv');