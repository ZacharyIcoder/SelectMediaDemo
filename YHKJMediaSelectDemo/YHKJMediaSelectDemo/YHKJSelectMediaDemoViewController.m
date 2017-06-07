//
//  YHKJSelectMediaDemoViewController.m
//  YHKJMediaSelectDemo
//
//  Created by ZIKong on 2017/6/7.
//  Copyright © 2017年 youhuikeji. All rights reserved.
//

//相关 图片选择 https://github.com/banchichen/TZImagePickerController
    //移动云信 http://netease.im/im-sdk-demo?solutionType=0#solution

#import "YHKJSelectMediaDemoViewController.h"

@import MobileCoreServices;
@import AVFoundation;
#import "NIMKitMediaFetcher.h"
#import "UIActionSheet+NTESBlock.h"


@interface YHKJSelectMediaDemoViewController ()
@property (nonatomic, strong)   NIMKitMediaFetcher *mediaFetcher;
@property (nonatomic, strong)   NSString *videoPath;

@property (nonatomic, strong)   UIButton *imageButton;
@property (nonatomic, strong)   UIButton *mediaButton;
@end

@implementation YHKJSelectMediaDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图片|视频 选择";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageButton];
    [self.view addSubview:self.mediaButton];
    
}

- (void)imageClick {
    _mediaFetcher.limit = 9;

    [self.mediaFetcher fetchPhotoFromLibrary:^(NSArray *images, NSString *path, PHAssetMediaType type) {
        NSLog(@"%@",images);
        NSLog(@"%@",path);
    }];
}

- (void)mediaClick {
    _mediaFetcher.limit = 1;
    _mediaFetcher.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];

    [self.mediaFetcher fetchMediaFromCamera:^(NSString *path, UIImage *image) {
        NSLog(@"media,path:%@",path);
    }];
}

-(UIButton *)imageButton {
    if (_imageButton == nil) {
        _imageButton = [[UIButton alloc] init];
        _imageButton.frame = CGRectMake(20, 100, 100, 100);
        [_imageButton setTitle:@"选择图片" forState:UIControlStateNormal];
        [_imageButton setBackgroundColor:[UIColor lightGrayColor]];
        [_imageButton addTarget:self action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageButton;
}

-(UIButton *)mediaButton {
    if (_mediaButton == nil) {
        _mediaButton = [[UIButton alloc] init];
        _mediaButton.frame = CGRectMake(20, 240, 100, 100);
        [_mediaButton setTitle:@"选择视频" forState:UIControlStateNormal];
        [_mediaButton setBackgroundColor:[UIColor lightGrayColor]];
        [_mediaButton addTarget:self action:@selector(mediaClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mediaButton;
}

- (NIMKitMediaFetcher *)mediaFetcher
{
    if (!_mediaFetcher) {
        _mediaFetcher = [[NIMKitMediaFetcher alloc] init];
        _mediaFetcher.limit = 9;
        _mediaFetcher.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
    }
    return _mediaFetcher;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
