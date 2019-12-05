//+------------------------------------------------------------------+
//|                                          SimpleMovingAverage.mq5 |
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
      double myMovingAverageArray[];
      
      int movingAverageDefinition = iMA(_Symbol,_Period, 20, 0, MODE_SMA, PRICE_CLOSE);
      CopyBuffer(movingAverageDefinition, 0, 0, 3, myMovingAverageArray);
      
      float myMovingAverage20 = myMovingAverageArray[1];
      
      
      
      Comment("MyMovingAverage20: ",  myMovingAverage20);
  }
//+------------------------------------------------------------------+
