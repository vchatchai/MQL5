//+------------------------------------------------------------------+
//|                                              SimpleWhileLoop.mq5 |
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
int DelayCounter = 1;

//create a min value
int MinNumber= 500000;


void OnTick()
  {
      while(DelayCounter < MinNumber)
      {
            //output the current value 
            Comment("DelayCounter:",DelayCounter);
            
            //increase DelayCounter by one
            DelayCounter = DelayCounter+1;
      
      }
      
   
  }
//+------------------------------------------------------------------+
