function F = create_mat_dct()
F = zeros(8);
    for u=1:8
        F(1,u) = sqrt(1/8);
    end
    for v = 2:8
        for u = 1:8
            F(v,u) = sqrt(2/8)*(cos(pi*(2*(u-1)+1)*(v-1)/(2*8)));
        end
    end 
    end

