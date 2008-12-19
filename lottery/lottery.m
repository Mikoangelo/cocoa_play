#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main (int argc, const char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  
  // Create the date object
  NSCalendarDate *now = [[NSCalendarDate alloc] init];
  
  // Seed the random number generator
  srandom(time(NULL));
  
  NSMutableArray *array = [[NSMutableArray alloc] init];
  
  for (int i=0;i<10;i++) {
    // Create a date/time object that is 'i' weeks from now
    NSCalendarDate *iWeeksFromNow = [now dateByAddingYears:0
                                                    months:0
                                                      days:(i * 7)
                                                     hours:0
                                                   minutes:0
                                                   seconds:0];
    
    // Create a new instance of LotteryEntry
    LotteryEntry *newEntry = [[LotteryEntry alloc] init];
    [newEntry prepareRandomNumbers];
    [newEntry setEntryDate:iWeeksFromNow];
    // Add the LotteryEntry object to the array
    [array addObject:newEntry];
  }
  
  for (LotteryEntry *entryToPrint in array) {
    // Display its contents
    NSLog(@"%@", entryToPrint);
  }
  
  [pool drain];
  return 0;
}
