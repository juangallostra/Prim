function heap = insert_heap(heap,element)
    heap = [heap, element];
    i = length(heap);
    heapified = false;
    while ~heapified
        n = floor(i/2);
        if n==0; heapified = true;
        else
            if heap(n).c > heap(i).c
                temp=heap(n); heap(n)=heap(i); heap(i) = temp;
                i=n;
            else
                heapified = true;
            end
        end
    end
end