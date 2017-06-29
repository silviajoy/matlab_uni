ti = 0:0.1:10;

alfa = 1;
func2 = exp(-alfa*ti);

alfa = 5;
func1 = exp(-alfa*ti);


subplot(1,2,1)
plot(t1,func1)

xlabel('x')
ylabel('func1(x)')
title('dumping: 1')


subplot(1,2,2)
plot(t1, func2)

xlabel('x')
ylabel('func2(x)')
title('dumping: 5')