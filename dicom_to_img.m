function dicom_to_img()
%%% Used to convert a directory containing dicoms to imagesdirs = '/data/Gabriel_De_id_11_27_2017/0M7FG_48/';
save_dir = '/data/gabriel/AUTODEID/dms/'
file_n = dir(dirs);

sz = length(file_n);

for i = 1:sz
    if(length(file_n(i).name)>3);
        name_of_d = strcat(dirs,file_n(i).name);
        name_of_d;
        save_d = strcat(save_dir,file_n(i).name);
        img = dicomread(name_of_d);
        sz = size(img)
        if length(sz)==4;
            for j = 1:sz(4);
                numm = num2str(j);
                save_dir3 = strcat(save_dir,numm);
                save_dir2 = strcat(save_dir3,'.bmp')
                save_dir2
                imwrite(img(:,:,:,j),save_dir2)
            end
        else
            %save_dir = strcat(save_d,numm);
            save_dir2 = strcat(save_d,'.bmp')
            imwrite(img,save_dir2)
        end
    end
end

end