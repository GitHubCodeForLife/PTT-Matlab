clear all
clc
xx = [0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4];
yy = [0.7174, 0.7833, 0.8415, 0.8912, 0.9320, 0.9636, 0.9854];
xc = 1;
df = 0.5403;
[df_3DC,rEdf_3DC,df_3DG,rEdf_3DG] = ba_diem(xx,yy,xc,df)