//
//  PBAppDelegate.m
//  AMWorkflowCaller
//
//  Created by Peter Brachwitz on 27/08/2012.
//  Copyright (c) 2012 Peter Brachwitz. All rights reserved.
//

#import "PBAppDelegate.h"
#import "Automator/AMWorkflow.h"

@implementation PBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    NSOpenPanel * panel = [NSOpenPanel openPanel];
	[panel setAllowsMultipleSelection:NO];
	[panel setCanChooseFiles:YES];
	[panel setCanChooseDirectories:NO];
    [panel setAllowedFileTypes:[NSArray arrayWithObject: @"com.apple.automator-workflow"]];
	NSInteger result = [panel runModal];
	if (result == NSFileHandlingPanelOKButton) {
        NSURL * workflow = [[panel URLs]objectAtIndex:0];
        NSLog(@"selected url %@", workflow);
        NSError * error = nil;
        [AMWorkflow runWorkflowAtURL:workflow withInput:[NSArray arrayWithObject:workflow] error:&error];
        if(error) {
            NSLog(@"Error while executing workflow %@", [error localizedDescription]);
        }
        
	}

}

@end
