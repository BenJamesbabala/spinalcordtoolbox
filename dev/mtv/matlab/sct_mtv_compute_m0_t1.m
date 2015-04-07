function [M0, T1] = sct_mtv_compute_m0_t1 (data, flipAngles, TR, b1Map, roi, verbose)

% function function [M0 t1Biased] = fitData_MTV (data, flipAngles, TR, b1Map) 
% ----------------------------------------------------------- 
% This function performs a weighted-least squares data fit
% on SPGR T1-weighted data set
% INPUTS:
% data: width x length x slices x flipAngles matrix
% flipAngles: a vector of flip angles (in degrees) that corresponds to the
% data matrix size
% TR: in s
% b1Map: a width x length x slices matrix that contains the relative flip
% angle (i.e. if nominal alpha is 60, and measured alpha is 61, then b1Map
% = 61/60
dbstop if error

if (nargin < 4) || isempty(b1Map)
    dataSize = size(data);
    b1Map = ones(dataSize(1:end-1));
end

if nargin<5 || isempty(roi)
    dataSize = size(data);
    roi = ones(dataSize(1:end-1));
end

if nargin<6
    verbose = 0;
end

dims = size(data);
T1 = zeros([dims(1:end-1), 3]);
M0 = zeros([dims(1:end-1), 3]);
warning('off');
j_progress('loop over voxels...')
for ii=1:dims(1)
    %ii
    for jj=1:dims(2)
        for kk=1:dims(3)
            j_progress(((ii-1)*dims(2)*dims(3)+(jj-1)*dims(3)+kk)/(dims(1)*dims(2)*dims(3)))
            if roi(ii,jj,kk) && b1Map(ii, jj, kk)~=0
                % T1 Mapping Using Variable Flip Angle SPGR Data With
                % Flip Angle Correction - Liberman, et al.
            y = squeeze(data(ii, jj, kk, :))./sin(flipAngles/180*pi*b1Map(ii, jj, kk))';
            x = squeeze(data(ii, jj, kk, :))./tan(flipAngles/180*pi*b1Map(ii, jj, kk))';
            
            % fit data
%             param = polyfit(x,y,1);
            [fitresult, gof] = LinearFit(x, y, verbose);
            param = coeffvalues(fitresult); % slope and intercept of the fitting
            param(isnan(param))=0;
            
            ci = confint(fitresult,0.682); % confidence interval of the fitting (returns the slope and intercept of the lines framing the fit)
            ci(isnan(ci)) = 0;
            
            % compute PD and T1
%             [M0(ii,jj,kk),T1(ii,jj,kk)]=getM0T1(param,TR);
            [M0(ii,jj,kk,1),T1(ii,jj,kk,1)]=getM0T1(param,TR);
            [M0(ii,jj,kk,2),T1(ii,jj,kk,2)]=getM0T1(ci(1,:),TR);
            [M0(ii,jj,kk,3),T1(ii,jj,kk,3)]=getM0T1(ci(2,:),TR);
            
            % if T1 is known
%             a=exp(-TR/3);
%             M0(ii,jj,kk)=mean((y-x*a)./(1-a));
%             param(1)=a; param(2)=M0(ii,jj,kk)*(1-a);

          
%                         weights = (sin(flipAngles/180*pi)./(1 - slopeBiased.*cos(flipAngles/180*pi))).^2;
%             weights(isinf(weights)) = 0; %remove points with infinite weight
%             
%             test2 = polyfitweighted(x, y, 1, weights');
%             slopeUnbiased = test2(1);    
%             result = abs(-TR./log(slopeUnbiased));    
%             if (~isnan(result) && result < 10)
%                 t1Unbiased(ii,jj,kk) = result;
%             end
            end
        end
    end
end
display('...done')


function [fitresult, gof] = LinearFit(x, y, verbose)
%CREATEFIT(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 22-Jan-2015 15:51:35


% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
if verbose && max(xData~=0) && max(yData~=0)
    
    figure(100)
    h = plot( fitresult, xData, yData,'+');
    set(h,'MarkerSize',30)
    legend( h, 'y vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
    p11 = predint(fitresult,x,0.95,'observation','off');
    hold on
    plot(x,p11,'m--');
    hold off
    % Label axes
    xlabel( 'x' );
    ylabel( 'y' );
    grid on
end


function [M0,T1]=getM0T1(param,TR)
a=param(1); % slope
b=param(2); % intercept
if a>0
    T1 = -TR/log(a);
else  % due to noise or bad fitting
    T1 = 0.000000000000001;
end
M0 = b/(1-exp(-TR/T1));