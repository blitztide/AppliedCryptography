# AppliedCryptography
A testbench of the lightweight hashing suites Spongent and Quark, against random binary data ranging from 16 bytes to 4096 bytes in powers of two.
Output is in CSV columnar format and can be processed by Gnuplot.

## Usage
* Compile and install Quark and Spongent libraries
* Run scripts/benchmark.sh

## Requirements
* GNU Time
* CLANG/gcc

## Compiling
![Compilation](https://github.com/blitztide/AppliedCryptography/raw/main/Images/Compiling.png "Compiling Hash functions")

## Running the Benchmark

![Benchmarking](https://github.com/blitztide/AppliedCryptography/raw/main/Images/Benchmark.png "Benchmarking Hash Functions")

## Results
### Performance

| Quark | Spongent |
|-------|----------|
|![Quark Results](https://github.com/blitztide/AppliedCryptography/raw/main/Images/Time-Quark.png)|![Spongent Results](https://github.com/blitztide/AppliedCryptography/raw/main/Images/Time-Spongent.png)|

### Memory
![Memory Overview](https://github.com/blitztide/AppliedCryptography/raw/main/Images/Memory-Full.png)

## References
* **Spongent** https://asecuritysite.com/encryption/spongent
* **Quark** https://github.com/veorq/Quark
