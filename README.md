# HM-MRI
Matlab code for the hybrid multi-dimensional MRI with a modified three-compartment model
1. Researchers should use the "dicom to nii" and manipulating NIFTI files in MATLAB tools for importing the DICOM into the Matlab.
  "dicom to nii" Link:https://github.com/xiangruili/dicm2nii
  "manipulating NIFTI files in MATLAB" Link:https://github.com/sergivalverde/nifti_tools
2. Researchers should arrage their HM-MRI data at a right order and do some registration before fitting to avoid bad results.
3. The Matlab 2023a or 2023b version can direct support the the lsqnonlin with unequal and equal constraints, while the previous version needs additional functions.
4. When investigating other tumors rather than brain tumors, please take a look at choosing intial values and right constraints properly. They are also very important for the fitting.
5. If your scanner is 1.5T, a higher TE for the DWI sequence can be achieved when compared to 3.0T.

