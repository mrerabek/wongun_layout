function edge_im = draw_line_image2(edge_im,linesnnorm , grpno);

if grpno==1
     color='r';
elseif grpno==2
    color='g';
else
    color='b';
    
end
    
      
    for i=1:size(linesnnorm,2)
        x1=lines(1,i);
        x2=lines(2,i);
        y1=lines(3,i);
        y2=lines(4,i);
        
        line([y1 y2],[x1 x2],'Color',color);
        
        
    end
        
    
    return
    
    
img=imread([dirname d(1).name]);
grayIm=rgb2gray(img);
[lines] = APPgetLargeConnectedEdges(grayIm, 20);
imsize=size(img);

[v2, sigma, p, hpos] = APPestimateVp(lines, imsize, DO_DISPLAY);
[tmp, bestv] = max(p, [], 2);


figure(1001);
imshow(img)
tempind=find(bestv==1);
hold on, plot(lines(tempind, [1 2])', lines(tempind, [3 4])','r')
tempind=find(bestv==2);
hold on, plot(lines(tempind, [1 2])', lines(tempind, [3 4])','g')
tempind=find(bestv==3);
hold on, plot(lines(tempind, [1 2])', lines(tempind, [3 4])','b')
v2=v2.*imsize(1);

imagesc(img);
hold on; plot(v2(1,1)/v2(1,3),v2(1,2)/v2(1,3),'r*');
plot(v2(2,1)/v2(2,3),v2(2,2)/v2(2,3),'g*');
plot(v2(3,1)/v2(3,3),v2(3,2)/v2(3,3),'b*');
 
 
    
    
    