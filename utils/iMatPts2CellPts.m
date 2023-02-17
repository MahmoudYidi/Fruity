function cellPts = iMatPts2CellPts(matPts, dim)
    % x11 x12 ... x1N
    % ...
    % xM1 xM2 ... xMN
    nImgs = size(matPts,1);
    cellPts = cell(0,1);
    
    for i = 1:nImgs
        obs_i = matPts(i,:);
        obs_i = rmmissing(obs_i);
        nObs_i = length(obs_i);
        
        if (nObs_i == 0)
            continue;
        end
        
        assert(mod(nObs_i, dim) == 0);
        
        obs_i_re = reshape(obs_i,dim,[]);
        cellPts{end+1} = obs_i_re; %#ok<AGROW>
    end
end