/*
 * initCuda.h
 *
 *  Created on: 10/12/2014
 *      Author: Zeyi Wen
 */

#ifndef INITCUDA_H_
#define INITCUDA_H_

bool InitCUDA(char, CUcontext &context);
bool ReleaseCuda(CUcontext &context);

#endif /* INITCUDA_H_ */
