function plot = PlotPattern(pattern, width)
    plot = reshape(pattern, [], width)==1;
    imshow(plot,'InitialMagnification','fit');
end