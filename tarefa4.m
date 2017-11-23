%'Variável:' 'Informacao:';
%'canais_ordem' 'Matriz de nomes dos canais, tem correspondência direta linha a linha com "xn"';
%'T' 'Período de amostragem (baseado na taxa de amostragem) em segundos';
%'fa' 'Taxa de amostragem da coleta (em Hz)';
%'xn' 'Matriz de valores para os canais -> Correspondência direta linha a linha com "canais_ordem". Valores em uV do EEG naquela amostra';
%'N' 'Quantidade de amostras por canal';
%'n_canais' 'Quantidade de canais na matriz "xn"';
%'tempo_total' 'tempo total do exame (em segudos)';
%'t' 'vetor tempo para plotagem (em segundos)';}

close all;

screensize = get( 0, 'Screensize' );

%Carregando o sinal
load P062;
% Iniciando as variaveis
Ch_sel = 10; % Canal Cz2 canal 10
TempoTotal = 60; %60 segundos
QntJanelas = 10;
duracoes = [1,2,3,4,5,6,7,8,9,10];
tt = zeros(1,11); %% 0 a 1, 6 a 12, 12 a 18 ... 
tt(1) = 0;
for ii = 1:10
   tt(ii+1) = duracoes(ii) + tt(ii); 
end

N=6001;
tempo = 0:T:T*(N-1);

%Janelamento do sinal
x1 = xn(Ch_sel,tt(1) <= tempo & tempo < tt(2));
t1 = tempo(tt(1) <= tempo & tempo < tt(2));

x2 = xn(Ch_sel,tt(2) <= tempo & tempo < tt(3));
t2 = tempo(tt(2) <= tempo & tempo < tt(3));

x3 = xn(Ch_sel,tt(3) <= tempo & tempo < tt(4));
t3 = tempo(tt(3) <= tempo & tempo < tt(4));

x4 = xn(Ch_sel,tt(4) <= tempo & tempo < tt(5));
t4 = tempo(tt(4) <= tempo & tempo < tt(5));

x5 = xn(Ch_sel,tt(5) <= tempo & tempo < tt(6));
t5 = tempo(tt(5) <= tempo & tempo < tt(6));

x6 = xn(Ch_sel,tt(6) <= tempo & tempo < tt(7));
t6 = tempo(tt(6) <= tempo & tempo < tt(7));

x7 = xn(Ch_sel,tt(7) <= tempo & tempo < tt(8));
t7 = tempo(tt(7) <= tempo & tempo < tt(8));

x8 = xn(Ch_sel,tt(8) <= tempo & tempo < tt(9));
t8 = tempo(tt(8) <= tempo & tempo < tt(9));

x9 = xn(Ch_sel,tt(9) <= tempo & tempo < tt(10));
t9 = tempo(tt(9) <= tempo & tempo < tt(10));

x10 = xn(Ch_sel,tt(10) <= tempo & tempo < tt(11));
t10 = tempo(tt(10) <= tempo & tempo < tt(11));


%--------Plotando os sinais--------

% fig = figure;
% set(fig,'Position',screensize)
% colors_sel = ['g','b','g','b','g','b','g','b','g','b'];
% %colors_sel = ['r','g','b','r','g','b','r','g','b','r'];
% hold on;
% plot(t1,x1,'g');
% plot(t2,x2);
% plot(t3,x3,'g');
% plot(t4,x4);
% plot(t5,x5,'g');
% plot(t6,x6);
% plot(t7,x7,'g');
% plot(t8,x8);
% plot(t9,x9,'g');
% plot(t10,x10);

%%------------Fourier pelo cod do Prof. Dr. Destro---------------------------------%%
[f1,Nf1,XN1,XFF1,P1,fm1,XF1,XM1,XQ1] = fft_destro(fa, length(x1),t1,x1);
[f2,Nf2,XN2,XFF2,P2,fm2,XF2,XM2,XQ2] = fft_destro(fa, length(x2),t2,x2);
[f3,Nf3,XN3,XFF3,P3,fm3,XF3,XM3,XQ3] = fft_destro(fa, length(x3),t3,x3);
[f4,Nf4,XN4,XFF4,P4,fm4,XF4,XM4,XQ4] = fft_destro(fa, length(x4),t4,x4);
[f5,Nf5,XN5,XFF5,P5,fm5,XF5,XM5,XQ5] = fft_destro(fa, length(x5),t5,x5);
[f6,Nf6,XN6,XFF6,P6,fm6,XF6,XM6,XQ6] = fft_destro(fa, length(x6),t6,x6);
[f7,Nf7,XN7,XFF7,P7,fm7,XF7,XM7,XQ7] = fft_destro(fa, length(x7),t7,x7);
[f8,Nf8,XN8,XFF8,P8,fm8,XF8,XM8,XQ8] = fft_destro(fa, length(x8),t8,x8);
[f9,Nf9,XN9,XFF9,P9,fm9,XF9,XM9,XQ9] = fft_destro(fa, length(x9),t9,x9);
[f10,Nf10,XN10,XFF10,P10,fm10,XF10,XM10,XQ10] = fft_destro(fa, length(x10),t10,x10);



% 
% %Plotando tudo junto
% fig = figure;
% set(fig,'Position',screensize)
% subplot(2,2,1:2);
% plot(t1,x1);
% subplot(2,2,3);
% plot(f1,XM1);
% subplot(2,2,4);
% plot(f1,XF1);


fig = figure;
set(fig,'Position',screensize)
subplot(5,2,1); plot(t1,x1);
subplot(5,2,2); plot(t2,x2);
subplot(5,2,3); plot(t3,x3);
subplot(5,2,4); plot(t4,x4);
subplot(5,2,5); plot(t5,x5);
subplot(5,2,6); plot(t6,x6);
subplot(5,2,7); plot(t7,x7);
subplot(5,2,8); plot(t8,x8);
subplot(5,2,9); plot(t9,x9);
subplot(5,2,10); plot(t10,x10);

fig = figure;
set(fig,'Position',screensize)
hold on;
plot(f1,XM1,'color',[0.2 1 0.7]);
plot(f2,XM2,'color',[0.1 0.5 0.6]);
plot(f3,XM3,'y');
plot(f4,XM4,'m');
plot(f5,XM5,'c');
plot(f6,XM6,'r');
plot(f7,XM7,'g');
plot(f8,XM8,'b');
plot(f9,XM9,'color',[0.3 0.7 0]);
plot(f10,XM10,'k');
grid on;
xlabel('Frequencia');
ylabel('Power');
legend('1s', '2s','3s','4s','5s','6s','7s','8s','9s','10s');


title('1s');fig = figure(); set(fig,'Position',screensize);
plot(f1,XFF1);
title('2s');fig = figure(); set(fig,'Position',screensize);
plot(f2,XFF2);
title('3s');fig = figure(); set(fig,'Position',screensize);
plot(f3,XFF3);
title('4s');fig = figure(); set(fig,'Position',screensize);
plot(f4,XFF4);
title('5s');fig = figure(); set(fig,'Position',screensize);
plot(f5,XFF5);
title('6s');fig = figure(); set(fig,'Position',screensize);
plot(f6,XFF6);
fig = figure(); set(fig,'Position',screensize);title('7s');
plot(f7,XFF7);
fig = figure(); set(fig,'Position',screensize);title('8s');
plot(f8,XFF8);
fig = figure(); set(fig,'Position',screensize);title('9s');
plot(f9,XFF9);
fig = figure(); set(fig,'Position',screensize);title('10s');
plot(f10,XFF10);
