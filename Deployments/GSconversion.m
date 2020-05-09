 contents = dir('cell_images/parasitized/') % or whatever the filename extension is
 for k = 1:numel(contents)
  filename   = contents(k).name;
  rgbImg     = imread(filename);
  gsImg      = rgb2gray(rgbImg);
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%s_gs.jpg', name);
  imwrite(gsImg,gsFilename);
end