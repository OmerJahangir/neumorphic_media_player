#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "StoragePathPlugin.h"

FOUNDATION_EXPORT double flutter_storage_pathVersionNumber;
FOUNDATION_EXPORT const unsigned char flutter_storage_pathVersionString[];

