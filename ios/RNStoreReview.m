#import "RNStoreReview.h"
#if __has_include(<StoreKit/SKStoreReviewController.h>)
  #import <StoreKit/SKStoreReviewController.h>
  #define HAS_STORE_KIT true
#else
  #define HAS_STORE_KIT false
#endif

@implementation RNStoreReview

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
  Class reviewController = NSClassFromString(@"SKStoreReviewController");
  return @{
    @"isAvailable": reviewController != nil ? @(YES) : @(NO)
  };
}

RCT_EXPORT_METHOD(requestReview)
{
  Class reviewController = NSClassFromString(@"SKStoreReviewController");
  if (reviewController != nil) {
    [reviewController requestReview];
  }
}

@end
