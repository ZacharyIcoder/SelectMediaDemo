//
//  NIMKitMediaFetcher.h
//  NIMKit
//
//  Created by chris on 2016/11/12.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>


typedef void(^NIMKitLibraryFetchResult)(NSArray *images, NSString *path, PHAssetMediaType type);

typedef void(^NIMKitCameraFetchResult)(NSString *path, UIImage *image);

@interface NIMKitMediaFetcher : NSObject

@property (nonatomic,assign) NSInteger limit;

@property (nonatomic,strong) NSArray *mediaTypes; //kUTTypeMovie,kUTTypeImage

- (void)fetchPhotoFromLibrary:(NIMKitLibraryFetchResult)result;

- (void)fetchMediaFromCamera:(NIMKitCameraFetchResult)result;

//新增 选择视频的方法
- (void)fetchVideoMediaFromCamera:(NIMKitCameraFetchResult)result;


@end
