//
//  SharedSwiftCode.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/11/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import Foundation

extension NSDate
{
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
        {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    
    func isLessThanDate(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
        {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    /*
    
    func isEqualToDate(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame
        {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    
    
    func addDays(daysToAdd : Int) -> NSDate
    {
        var secondsInDays : NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        var dateWithDaysAdded : NSDate = self.dateByAddingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    
    func addHours(hoursToAdd : Int) -> NSDate
    {
        var secondsInHours : NSTimeInterval = Double(hoursToAdd) * 60 * 60
        var dateWithHoursAdded : NSDate = self.dateByAddingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
*/
}

func checkForNewPeriod(){
    
    let now = NSDate()
    
    
    if(now.isGreaterThanDate(periodEndDates[periodEndDates.count - 1])){
        
        
    
        while (now.isGreaterThanDate(periodEndDates[periodEndDates.count - 1])){
            
            let flags: NSCalendarUnit = NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitSecond | NSCalendarUnit.CalendarUnitTimeZone
            
            
            let endDateComponents = NSCalendar.currentCalendar().components(flags, fromDate:periodEndDates[periodEndDates.count - 1])
            
    
            let newEndDateComponents = NSDateComponents()
            let newStartDateComponents = NSDateComponents()
            
            if endDateComponents.day == 1{
                
                newEndDateComponents.day = 16
                newEndDateComponents.month = endDateComponents.month
                newEndDateComponents.year = endDateComponents.year
                newEndDateComponents.hour = 0
                newEndDateComponents.minute = 0
                newEndDateComponents.second = 0
                newEndDateComponents.timeZone = NSTimeZone.localTimeZone()
                
                newStartDateComponents.day = 1
                newStartDateComponents.month = endDateComponents.month
                newStartDateComponents.year = endDateComponents.year
                newStartDateComponents.hour = 0
                newStartDateComponents.minute = 1
                newStartDateComponents.second = 0
                newStartDateComponents.timeZone = NSTimeZone.localTimeZone()
                
                
            }else{
                
                newEndDateComponents.day = 1
                if endDateComponents.month == 12{
                newEndDateComponents.month = 1
                newEndDateComponents.year = endDateComponents.year + 1
                }else{
                newEndDateComponents.month = endDateComponents.month + 1
                newEndDateComponents.year = endDateComponents.year
                }
                newEndDateComponents.hour = 0
                newEndDateComponents.minute = 0
                newEndDateComponents.second = 0
                newEndDateComponents.timeZone = NSTimeZone.localTimeZone()
                
                newStartDateComponents.day = 16
                newStartDateComponents.month = endDateComponents.month
                newStartDateComponents.year = endDateComponents.year
                newStartDateComponents.hour = 0
                newStartDateComponents.minute = 1
                newStartDateComponents.second = 0
                newStartDateComponents.timeZone = NSTimeZone.localTimeZone()
                
            }
            
            let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
            let newEndDate = calendar!.dateFromComponents(newEndDateComponents)!
            let newStartDate = calendar!.dateFromComponents(newStartDateComponents)!
            
            periodEndDates.append(newEndDate)
            periodStartDates.append(newStartDate)
            
            periodCharges = []
            
            for (key, value) in periodEmployeeDict{
                periodEmployeeDict[key] = []
            }
            
        }
    
    }
}
