#import "../substrate.h"
#import <UIKit/UIKit.h>
#import <mach-o/dyld.h>
#import <initializer_list>
#import <vector>
#import <map>
#import <mach-o/dyld.h>
#import <string>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <initializer_list>
#import <vector>
#import <mach-o/dyld.h>
#import <UIKit/UIKit.h>
#import <iostream>
#import <stdio.h>
#include <sstream>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <string.h>
#include <algorithm>
#include <fstream>
#include <ifaddrs.h>
#include <stdint.h>
#include <dlfcn.h>

static bool(*ChestBlockEntity$isLargeChest)(uintptr_t*);

int (*ChestBlockEntity_getContainerSize)(uintptr_t*);
int _ChestBlockEntity_getContainerSize(uintptr_t* self) {
	if(ChestBlockEntity$isLargeChest(self)) {
		return 1;
	} else {
		return 10;
	}
}

%ctor {
	MSHookFunction((void*)(0x1008348a4 + _dyld_get_image_vmaddr_slide(0)), (void*)&_ChestBlockEntity_getContainerSize, (void**)&ChestBlockEntity_getContainerSize);

	ChestBlockEntity$isLargeChest = (bool(*)(uintptr_t*))(0x1008348bc + _dyld_get_image_vmaddr_slide(0));
}