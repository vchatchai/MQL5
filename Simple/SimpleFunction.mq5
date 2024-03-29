//+------------------------------------------------------------------+
//|                                               SimpleFunction.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
     static int counter = 1;
     counter = DoubleTheValue(counter);
     Comment("Counter Value ", counter);
   
  }
  
int DoubleTheValue(int CounterValue)
  {
      int DoubleValue = CounterValue  + 1;
      return DoubleValue;
  }
//+------------------------------------------------------------------+
