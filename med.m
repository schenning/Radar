function numb = med(n)

    if mod(numel(n),2)==0
        val = median(n);
        tmp = abs(n-val);
        [idx idx] = min(tmp); %index of closest value
        closest = n(idx); %closest value
        numb=closest;

    else
        numb = median(n);
    end
end
