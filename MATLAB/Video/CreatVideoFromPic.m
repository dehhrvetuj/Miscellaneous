function CreatVideoFromPic(dn, picformat,aviname)
% CreatVideoFromPic(dn, picformat,aviname)
% 将某个文件夹下某种格式的所有图片合成为视频文件
% dn : 存储图片的文件夹
% picformat : 要读取的图片的格式，如png、jpg等形式，字符串数组
% aviname   : 存储的视频的文件名
% example : CreatVideoFromPic( './', 'png','presentation.avi');

    if ~exist(dn, 'dir')
        error('dir not exist!!!!');
    end
    picname=fullfile( dn, strcat('*.',picformat));
    picname=dir(picname);

    aviobj = VideoWriter(aviname);

    open(aviobj);

    for i=1:length(picname)
        picdata=imread( fullfile(dn, (picname(i,1).name)));
        if ~isempty( aviobj.Height)
            if size(picdata,1) ~= aviobj.Height || size(picdata,2) ~= aviobj.Width
                close(aviobj);
                delete( aviname )
                error('所有图片的尺寸要相同！！');
            end
        end
        writeVideo(aviobj,picdata);
    end
    close(aviobj);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file_path = 'F:\数据\cqq\融合\11-08tig钛合金\16-47\低曝光';

img_path_list = dir(strcat(file_path,'\*.bmp'));
img_num = length(img_path_list);

% path_in='Q:\08-21\11-11\';
% path_in2='C:\Users\Administrator\Desktop\新建文件夹 2\';


% temp1='C:\Users\Administrator\Desktop\视频变单帧图像\视频变单帧图像\bd\';% 路径名1
WriterObj=VideoWriter('tig1647低曝光.mp4');% xxx.avi表示待合成的视频（不仅限于avi格式）的文件路径
% WriterObj2=VideoWriter('2','MPEG-4');% xxx.avi表示待合成的视频（不仅限于avi格式）的文件路径
open(WriterObj);
% for i=1:img_num % n_frames表示图像帧的总数
for i=1:200
frame=imread(strcat(file_path,'\',img_path_list(i).name));% 读取图像，放在变量frame中
           %  image = double(frame);
            %b=frame(211:470,555:854,:);
          %  image = image /65536 *256;
           %  image = uint8(image);
writeVideo(WriterObj,frame);% 将frame放到变量WriterObj中
end
close(WriterObj);

% open(WriterObj2);
% for i=1:325 % n_frames表示图像帧的总数
% frame2=imread(strcat(path_in2,num2str(i)),'png');% 读取图像，放在变量frame中
% writeVideo(WriterObj2,frame2);% 将frame放到变量WriterObj中
% end
% close(WriterObj2);




