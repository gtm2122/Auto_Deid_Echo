function [info_tags,unique_file_names] = find_unique_res(main_fold)
    info_tags = {}
    sub_fold = dir(main_fold);
    
    num_sub_fold = length(sub_fold)
    unique_file_names = {}
    
    for i = 3:num_sub_fold
        sub_fold(i).name;
        
        name_of_subdir = strcat(main_fold,'/');
        name_of_subdir = strcat(name_of_subdir,sub_fold(i).name);
        name_of_subdir = strcat(name_of_subdir,'/');
        dicom_files = dir(name_of_subdir);
        
        num_dicom_files = length(dicom_files);
        
        for j = 3:num_dicom_files;
            if ismember(sub_fold(i).name,dicom_files(j).name);
                dir_of_dicom = strcat(name_of_subdir,dicom_files(j).name);
                dicom_metatags = dicominfo(dir_of_dicom);
                file_info_tags = dicom_metatags.ManufacturerModelName;
                file_info_tags = strcat(file_info_tags,dicom_metatags.Manufacturer);
                file_info_tags = strcat(file_info_tags,num2str(dicom_metatags.Height));
                file_info_tags = strcat(file_info_tags,num2str(dicom_metatags.Width));
                if(not(ismember(file_info_tags,info_tags)));
                    info_tags{end+1} = file_info_tags;
                    unique_file_names{end+1} = dir_of_dicom
                end
            end
            %break
        end
        
        %info_tags
        %break
        
    end
unique_file_names
end