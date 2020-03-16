function PlotM2(All_Betas)
All_Betas.exp2.mean.m1(1)= mean(All_Betas.exp2.m1(:,1));
All_Betas.exp2.mean.m1(2)= mean(All_Betas.exp2.m1(:,2));
All_Betas.exp2.mean.m1(3)= 0;

All_Betas.exp2.mean.m2(1)= mean(All_Betas.exp2.m2(:,1));
All_Betas.exp2.mean.m2(2)= mean(All_Betas.exp2.m2(:,2));
All_Betas.exp2.mean.m2(3)= mean(All_Betas.exp2.m2(:,3));


y=[[All_Betas.exp2.mean.m1]; [All_Betas.exp2.mean.m2];];
str=({'Model 1','Model 2'});

 h1 = figure('pos',[10 10 1800 1600]);
%bar([[All_Betas.exp1.mean.m1]; [All_Betas.exp1.mean.m2]; [All_Betas.exp1.mean.m3]])
hB=bar(y);          % use a meaningful variable for a handle array...
hAx=gca;            % get a variable for the current axes handle
hAx.XTickLabel=str; % label the ticks
hT=[];              % placeholder for text object handles
for i=1:length(hB)  % iterate over number of bar objects
  hT=[hT text(hB(i).XData+hB(i).XOffset,hB(i).YData,num2str(hB(i).YData.','%.3f'), ...
                          'VerticalAlignment','bottom','horizontalalign','center','FontSize',36)];
end
legend();
title('Experiment 2 ','FontSize',72);
%xlabel('Subjects','FontSize',28);
ylabel('Beta value','FontSize',72);
xL = get(gca,'XLim');
ylim([0 1]);
 set(findall(gca, 'Type', 'Line'),'LineWidth',2);
str=({'Model 1','Model 2'});
set(gca, 'XTickLabel',str, 'XTick',1:numel(str),'FontSize',42)
legend('\beta_A','\beta_B','\beta_\lambda', 'FontSize',42); 

end