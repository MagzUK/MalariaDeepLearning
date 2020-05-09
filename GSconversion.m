 contents = dir('cell_images/uninfected/') % or whatever the filename extension is
 for k = 3:numel(contents)
  filename   = contents(k).name;
  rgbImg     = imread(strcat('cell_images/uninfected/',filename));
  gsImg      = rgb2gray(rgbImg);
  [~,name,~] = fileparts(filename);
  gsFilename = sprintf('%s_gs.jpg', name);
  imwrite(gsImg,gsFilename);
end