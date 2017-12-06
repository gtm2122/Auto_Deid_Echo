function show_im(tag_info,b)

for i = 1:length(b)
    name_of_file = b{1,i}
%     if ismember('.SR1',b{1,i})
%         name_of_file = strrep(b{1,i},'.SR1','.1')
%     end
    %name_of_file(end-1:end)
    if ismember('.1',name_of_file(end-1:end)) 
        %if not(ismember('.10',name_of_file))
        name_of_file = strrep(name_of_file,'.1','.11');
        
        %end
    end
    
    if ismember('.SR1',name_of_file)
        name_of_file = strrep(name_of_file,'.SR1','.11');
    end
    
    name_of_file
    img = dicomread(name_of_file);
    sz = size(img)
    tag_info{1,i}
    name_of_file
    if(length(sz)==4)
        a = 4
        
        %b(i)
        imshow(img(:,:,:,10));
        %pause(1)
        %implay(img);
        %pause(1)
    else
        a = 1
        %tag_info{1,i}
        imshow(img);
    end
    pause;
end

end