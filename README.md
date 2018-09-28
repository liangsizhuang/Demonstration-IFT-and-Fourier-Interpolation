# Demonstration-IFT-and-Fourier-Interpolation
This is a demonstration of Inverse Fourier Transforms and Fourier Interpolation.

Suppose we have a periodic continuous-time signal x(t) and its FS is c[k]. Inverse Fourier Series (IFS) refers to a process to reconstruct x(t) using c[k]. Suppose we have a periodic discrete-time signal x[n] and its DFT is X[k]. Inverse Discrete Fourier Transform (IDFT) refers to a process to reconstruct x[n] using X[k]. IFS and IDFT are collectively referred to as Inverse Fourier Transform (IFT). We don’t have to use all harmonics in c[k] or X[k] to reconstruct x(t) or x[n]. If some of the harmonics are suppressed, we can achieve a filtering effect.

When we have x[n], we can construct its sinc interpolation. Suppose the sinc interpolation of x[n] is x(t). One can prove that the FS of x(t) is equal to the DFT of x[n] for spectral lines within f = -fs/2 to fs/2, where fs is the sampling frequency of x[n]. For this reason, we can obtain x[n] using the inverse FS formula on X[k].

In this demonstration, we show IDFT and IFS on the same signal with different numbers of harmonics. One will observe the filtering effect. IDFT and IFS have the same reconstructed value on sampling points. However, IFS also gives results on non-sampling points. When all harmonics are used, IFS can achieve interpolation effects. This interpolation is called the Fourier interpolation. One can see that the Fourier interpolation is equal to the sinc interpolation.

Demo_InverseFourierTransform.m shows IDFT and IFS, whereas Demo_FourierInterpolation.m compares the Fourier interpolation and the Sinc interpolation.

![alt text](https://github.com/liangsizhuang/Demonstration-IFT-and-Fourier-Interpolation/blob/master/figure1.png)

![alt text](https://github.com/liangsizhuang/Demonstration-IFT-and-Fourier-Interpolation/blob/master/figure2.png)

![alt text](https://github.com/liangsizhuang/Demonstration-IFT-and-Fourier-Interpolation/blob/master/figure3.png)

![alt text](https://github.com/liangsizhuang/Demonstration-IFT-and-Fourier-Interpolation/blob/master/figure4.png)
