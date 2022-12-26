//+------------------------------------------------------------------+
//|                                  UnmanagedExportsDLLExample6.mq5 |
//|                                      Copyright 2011, Investeo.pl |
//|                                                http:/Investeo.pl |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, Investeo.pl"
#property link      "http:/Investeo.pl"
#property version   "1.00"

#import "MTDllExportExample.dll"
   int AddTick(MqlTick &tick, double& bidsum);
#import
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
//---
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
  {
//---
   MqlTick newTick;
   double bidsum;
   
   SymbolInfoTick(Symbol(), newTick);
   
   Print("before = " + IntegerToString(newTick.volume));
   
   Print(AddTick(newTick, bidsum));
   
   Print("after = " + IntegerToString(newTick.volume) + " : " + DoubleToString(bidsum));
   
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
