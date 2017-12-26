### Important Metatags 
performed procedure description (0040,0254)
viewname (0008,2127)
viewnumber (0008,2128)
Stage name(0008,2120)
protocol name(0018,1030)

# Auto_Deid_Echo
Semi Automated Deidentification of Echocardiography Dicoms

This makes the de-identification of DICOM files pertaining to Echo of patients
faster.

This is based on the assumption that MOST (more than 90%) of dicoms, the position
of PHI within the images will depend on Manufacturer info and resolution.
Thus using this a few rules were made to mask out those regions

First run find_unique_res, this will give you the combination of 
manufacturer info and resolution of Dicom File, and unique instances of 
those files that pertain to given combination.

After this, open those files using show_im and visually find the masking 
boundary for the PHI. This would be different for screenshots containing
other paitent information like height,weight etc.

Then open mask_dicom and edit the if statements based on your observation above
and run it on the folder containing the dicom folders.

The folders are assumed to be organised as follows

/paht/to/folder/main_folder/Patient_folder/dicom_files.dcm
