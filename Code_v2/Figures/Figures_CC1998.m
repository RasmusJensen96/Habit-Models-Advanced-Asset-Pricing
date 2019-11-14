global Regressions
%% Figures
% Figure 7 in CC1998
figure;
subplot(2,1,1)
scatter(lnrtsim*1e2,lndctsim*1e2);title("Monthly Returns vs. consumption growth");
subplot(2,1,2)
scatter(alnrtsim_pf*1e2,alndctsim_pf*1e2);title("Annual Returns vs. consumption growth");
saveas(gcf,'Figures/Figure_7_CC_1998.eps','eps2c');

%% Stationary Density 
warning('off','all'); % fplot doest like the integral functions
figure;
fplot(@q_s, [min(log(S)+3) s_max+0.15]);title('Stationary Distribution of s')
%hold on %% Only works for MatLab later than 2018b 
% xline(s_bar, '--','$\bar{s}$', 'interpreter','latex', 'fontsize', 16);
%%% ----- %%%
% hold on
% xline(s_max, '--','$s_{max}$', 'interpreter','latex', 'fontsize', 16);
% MatLab laver selv den her, naar den kan se at s_max er functionens
% asymptote. Den laver ikke s_bar. 
warning('on','all');
saveas(gcf,'Figures/Stationary_Density.eps','eps2c');
%%
figure;
plot(S,PC_ratio/tsc,'red');title("PC vs. PD"); % Annulized P/C-curve
hold on;
plot(S,PD_ratio/tsc,'blue'); % Annulized P/D-curve
legend('PC-Ratio', 'PD-Ratio')
hold off;
saveas(gcf,'Figures/PC_&_PD_ratio.eps','eps2c');

%% Regression
% plot fitted vs actual
if Regressions == 1
figure;
plot(y)
hold on
plot(reg.yhat)
saveas(gcf,'Figures/Reg_Fitted_vs_Actual.eps','eps2c');
end