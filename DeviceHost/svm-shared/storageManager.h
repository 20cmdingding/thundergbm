/*
 * storageManager.h
 *
 *  Created on: 15/10/2015
 *      Author: Zeyi Wen
 */

#ifndef STORAGEMANAGER_H_
#define STORAGEMANAGER_H_

#include "hostStorageManager.h"

class StorageManager: public HostStorageManager
{
private:
	long long m_nMaxNumofFloatPointInGPU;
	StorageManager();
	static StorageManager *manager;

public:
	static StorageManager* getManager();
	virtual ~StorageManager();
	int PartOfRow(int, int);
	int PartOfCol(int, int, int);

	int RowInGPUCache(int, int);

//	void ReleaseModel(svm_model&);
};


#endif /* STORAGEMANAGER_H_ */
