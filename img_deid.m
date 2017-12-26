function rc_map = img_deid(image)
    sz = size(image);
    img_copy = image;
    img2 = 0.2125*image(:,:,1)+0.7154*image(:,:,2)+0.0721*image(:,:,3);
    a = imbinarize(img2,'global');
    %imshow(a)
    %pause;
    SE = strel('rectangle',[1,5]);
    %[idx,C] = kmeans(a,2);
    %idx;
    %size(idx)
    %C
    img2 = imdilate(a,SE);
    img2 = imdilate(a,SE);
    imshow(img2);
    pause;
    L = bwlabel(img2,8);
    L_1 = vec2mat(L,1);
    
    %L
    %pause;
    max_l = max(L_1);
    recon_arr = zeros(sz(1),sz(2));
    
    k = {};
    v = {};
    max_l;
    %pause;
    for i = 1:max_l
        
        [r,c] = find(L==i);
        H = max(r)-min(r);
        B = max(c)-min(c);
        new_arr = zeros(H+4,B+4);
        %new_arr = zeros(2*H,2*B);
        
        
        
        if(H < 40 && H>9 && B<200 && B>9)
            %ll = H - 5
            %cc = B - 5 
            new_arr(2:H+2,2:B+2) = a(min(r):max(r),min(c):max(c));
            
            new_arr2 = bwareaopen(new_arr,10);

            imshow(new_arr2);
            pause;
            if(sum(mean(new_arr2))>1)
                
                
                letters = bwlabel(new_arr2,4);
                letter_arr = vec2mat(L,1);

                %letter_arr
                max_letter = max(letter_arr);
                mm=16;
                word_recon = zeros(H+4,max_letter*5);
                
%                 for j = 1:max_letter
%                     [r2,c2] = find(letters==j);
%                     
%                     imshow(new_arr2)
%                     pause;
%                     H2=max(r2)-min(r2);
%                     B2=max(c2)-min(c2);
%                     new_arr4 = zeros(H2+mm,B2+mm);
%                     new_arr4(mm/2:H2+mm/2,mm/2:B2+mm/2) = new_arr2(min(r2):max(r2),min(c2):max(c2));
%                     imshow(new_arr4)
%                     pause;
%                     sz33=size(H2);
%                     if(sz33(1) > 0 && H2<15 && B2<10)
%                         word_recon(mm/2:H2+mm/2,j*(B2)+mm/2:(j+1)*(B2)+mm/2) = new_arr4(mm/2:H2+mm/2,mm/2:B2+mm/2);
%                     
%                         new_arr2 = bwareaopen(new_arr2,1);
%                         imshow(new_arr4)
%                         ocr_1 = ocr(new_arr4)
%                         ocr_1.Text
%                         pause;
%                         resize_img2 = imresize(new_arr4,5);
%                         imshow(resize_img2)
%                         ocr_2 = ocr(resize_img2)
%                         ocr_2.Text
%                         pause;
%                     end
% 
%                 end
%                 imshow(word_recon)
%                 ocr_3 = ocr(word_recon)
%                 ocr_3.Text
%                 pause;
            end
            
            %new_arr = wiener2(new_arr2,[2 1]);
            
            %imshow(new_arr2)
            recon_arr(min(r):max(r),min(c):max(c)) = new_arr2(2:end-2,2:end-2);
            %recon_arr(min(r):max(r),min(c):max(c)) = new_arr(H-9:ll,B-9:cc);
            
            %imshow(new_arr2)
            
            resize_img = imresize(new_arr2,10);
            %imshow(resize_img)
            %imshow(new_arr2)
            ocr_text= ocr(resize_img);
            
            ocr_text.Text;
            v{end+1} = ocr_text.Text;
            %k{end+1} = sprintf('%s_%s',num2str(min(r)),num2str(min(c)));
            k{end+1} = str2num(sprintf('%s%s',num2str(min(r)),num2str(min(c))));
            
            %pause;
            
        end
        
        
        
        %size(arr)
        
    end
    %imshow(recon_arr)
    %ocr_t2 = ocr(recon_arr)
    %ocr_t2.Text
    rc_map = containers.Map(k,v);
    
end