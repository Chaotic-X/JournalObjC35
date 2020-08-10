//
//  AXLEntryDetailViewController.m
//  JournalObjC35
//
//  Created by Alex Lundquist on 8/10/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

#import "AXLEntryDetailViewController.h"
#import "AXLEntryController.h"

@interface AXLEntryDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation AXLEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  [self updateViews];
}

- (void)updateViews
{
  if (self.entry)
    {
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
    }
}

- (IBAction)saveButtonTapped:(id)sender
{
  if (self.entry)
    {
    [[AXLEntryController sharedInstance] udpateEntry:self.entry withTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
    } else {
      AXLEntry * entry = [[AXLEntry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
      [[AXLEntryController sharedInstance]addEntry:entry];
    }
  [self.navigationController popViewControllerAnimated:YES];
}
@end
