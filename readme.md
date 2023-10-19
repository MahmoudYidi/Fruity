# Fruity Dataset Repo

1. Downloading the dataset.
	You can download the dataset (~8GB) by typing the following in your terminal:
	
	if you dont already have gdown:
	```
	$ pip install gdown
	```
	download:
	```
	$ gdown https://drive.google.com/uc?id=1cjavRlhdpzV3SC2px7z_g0-AoVnP3JYf
	```
	or you can follow this link:
	
	https://drive.google.com/file/d/1cjavRlhdpzV3SC2px7z_g0-AoVnP3JYf/view
	
	unzip by typing:
	```
	$ unzip fruity.zip	
	```

2. Two csv's are provided in the dataset. The 'Fruit_Pose' contains the ground truth poses of the fruits, while the 'Poses' in each folder of the dataset contains the camera rig pose per frame. Hence, you can either:
  
  i. choose to use the 'poses' on its own if you want to train a model that estimates the camera/vehicle pose or
  ii. Compute the relative pose between the camera and the target using the script provided for all the frames and for each class if you want to train a model that 	estimates the relative pose of the target (which in most cases is done) and use that instead of 'poses' to train your model.
  
  NB: Camera pose = poses.csv, target poses = fruit_poses.csv
  
  



3. Using the "relative_pose_comp" script

	It is used for computing the relative transformation between a camera and a target, and then storing the data in a matrix, which is then written to a CSV file.

	To use this code, follow these steps:

	Set the paths to the camera pose data and target pose data by modifying the 'path to camera poses' and 'path to target poses' strings respectively.

	Set the number of images to be processed by modifying the value of the 'Nos_image' variable.

	Run the code to read the pose data from the specified files, convert the pose data into cell arrays, and initialize a matrix for storing the relative 		transformation data.

	Loop through each image, compute the relative transformation between the camera and target, compute the quaternion and translation vector from the relative transformation, normalize the quaternion, and store the pose vector in the matrix.

	Write the resulting matrix to a CSV file named 'final_relative_pose_raw.csv' using the 'writematrix' function.

	Note that this code assumes that the pose data is in a specific format and uses several helper functions, such as 'iMatPts2CellPts' and 'so3_to_su2'.

4. If you find any of this useful, please don't forget to cite accordingly.

Update: Paper now availabe on IEEE xplore
 
