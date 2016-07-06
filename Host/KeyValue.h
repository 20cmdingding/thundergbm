/*
 * keyValue.h
 *
 *  Created on: 9 Mar 2016
 *      Author: Zeyi Wen
 *		@brief: 
 */

#ifndef KEYVALUE_H_
#define KEYVALUE_H_

#include <vector>
#include "../DeviceHost/DefineConst.h"


using std::vector;

class KeyValue
{
public:
	float_point featureValue;
	int id;//This id may be used as feature id or instance id

public:
	static void SortFeaValue(int nNumofDim, vector<vector<KeyValue> > &vvInsSparse, vector<vector<KeyValue> > &vvFeaInxPair);
	static void VecToArray(vector<vector<KeyValue> > &vvFeaInxPair, int *pInsId, float_point *pdValue, int *pNumofKeyValue, long long *plStartPos);

	static void TestVecToArray(vector<vector<KeyValue> > &vvFeaInxPair, int *pInsId, float_point *pdValue, int *pNumofKeyValue);
};



#endif /* KEYVALUE_H_ */
