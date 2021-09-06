function plot = PlotPattern(pattern, width, height)
    plot = ~(reshape(pattern, width, height)'==1);
    imshow(plot,'InitialMagnification','fit');
end