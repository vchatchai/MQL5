//+------------------------------------------------------------------+
//|                                             SimpleSwitchCase.mq5 |
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
int choice =2;
void OnTick()
  { 
      string entry = "";
      switch(choice) 
      {
         case 5:
         entry +=  "customer wants RSI";
         break;
         
         case 4:
         entry += "customer wants Bollinger Band";
         break;
         
         case 3:
         entry += "customer wants MACD";
         break;
         
         case(1+1):
         entry += "customer wants Random entries";
         
         default:
         entry += "customer does not know ";
         }
     Comment(entry);
   
  }
//+------------------------------------------------------------------+
