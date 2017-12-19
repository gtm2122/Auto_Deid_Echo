function img_deid(image)
    sz = size(image);
    img_copy = image;
    img2 = 0.2125*image(:,:,1)+0.7154*image(:,:,2)+0.0721*image(:,:,3);
    a = imbinarize(img2,'global');
    imshow(a)
    
    SE = strel('rectangle',[1,5]);
    %[idx,C] = kmeans(a,2);
    %idx;
    %size(idx)
    %C
    img2 = imdilate(a,SE);
    img2 = imdilate(a,SE);
    imshow(img2);
    L = bwlabel(img2,8);
    L_1 = vec2mat(L,1);
    
    max_l = max(L_1);
    recon_arr = zeros(sz(1),sz(2));
    for i = 1:max_l
        
        [r,c] = find(L==i);
        H = max(r)-min(r);
        B = max(c)-min(c);
        new_arr = zeros(H+4,B+4);
        
        
        new_arr(2:end-2,2:end-2) = a(min(r):max(r),min(c):max(c));
        

        if(H < 40 && H>5 && B<200)
            new_arr = bwareaopen(new_arr,10);
            
            new_arr = medfilt2(new_arr)
            
            %imshow(new_arr)
            recon_arr(min(r):max(r),min(c):max(c)) = new_arr(2:end-2,2:end-2);
            %imshow(new_arr)
            
            resize_img = imresize(new_arr,10);
            imshow(resize_img)
            ocr_text= ocr(resize_img);
            ocr_text.Text
            pause;
        
        end
        
        
        
        %size(arr)
        
    end
    imshow(recon_arr)
end