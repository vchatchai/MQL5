//+------------------------------------------------------------------+
//|                                           SimpleCalculations.mq5 |
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
         int a = 5;
         int b = 3;
         
         double c = 5;
         double d = 3;
         
         Comment("The result : " , a+b);
         Comment("The result : " , a-b);
         Comment("The result : " , a*b);
         Comment("The result : " , a/b);
         Comment("The result : " , c/d);
         Comment("The result : " , c+d*d);
  }
//+------------------------------------------------------------------+
