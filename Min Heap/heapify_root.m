function heap = heapify_root(heap)
i=1;
heapified = false;
while ~heapified
    if 2*i<=length(heap)
        if heap(i).c > heap(2*i).c
            if 2*i+1<=length(heap) && heap(2*i).c > heap(2*i+1).c
                temp=heap(i);heap(i)=heap(2*i+1);heap(2*i+1)=temp;
                i=2*i+1;
            else temp=heap(i);heap(i)=heap(2*i);heap(2*i)=temp;
                i=2*i;
            end
        elseif heap(i).c <= heap(2*i).c
            if 2*i+1<=length(heap) && heap(i).c > heap(2*i+1).c
                temp=heap(i);heap(i)=heap(2*i+1);heap(2*i+1)=temp;
                i=2*i+1;
            else heapified=true;
            end
        else heapified=true;
        end
    else heapified = true;
    end
end