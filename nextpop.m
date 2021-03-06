function childpop = nextpop(pop,fitness,temper)

for i = 1:30
    prob(i) = sum(fitness(1:i))/sum(fitness);
end

column = zeros(10,1);

for k = 1:28
    seletprob = rand();
    for j = 1:30
        if prob(j) >= seletprob
                dad = pop(:,:,j);
                break
        end
    end
    mom = pop(:,:,randi(30));  
    for i = 1:10
        for j = 1:5
            if rand() > 0.5
                childpop(i,j,k) = dad(i,j);
            else
                childpop(i,j,k) = mom(i,j);
            end
        end
        childpop(i,6,k) = 0;
    end
end

for k = 29:30
    childpop(:,:,k) = [temper *0.01* (rand(10,5)-0.5) column];
end

end