function STAT = computeSimStats(SimSet)
    
    Nsim = length(SimSet);
    
    SIM = SimSet{1};
    [Nr, Nc] = size(SIM.SharePerAssetMonthlySeries);
    
    STAT.Percentile10 = nan(Nr, Nc);
    STAT.Percentile50 = nan(Nr, Nc);
    STAT.Percentile90 = nan(Nr, Nc);
    for m = 1:Nr
        for n = 1:Nc
            tmpVec = nan(Nsim, 1);
            for p = 1:Nsim
                tmpVec(p) = SimSet{p}.SharePerAssetMonthlySeries(m, n);
            end
            pVec = prctile(tmpVec, [10, 50, 90]);
            STAT.Percentile10(m,n) = pVec(1);
            STAT.Percentile50(m,n) = pVec(2);
            STAT.Percentile90(m,n) = pVec(3);
        end
    end
end