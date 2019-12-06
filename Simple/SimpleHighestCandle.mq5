#include<Trade\Trade.mqh>


CTrade trade;

void OnTick()
  {
   MqlRates PriceInformation[];
   
   ArraySetAsSeries(PriceInformation, true);
   
   int Data = CopyRates(_Symbol, _Period, 0, 100, PriceInformation);
   
   int HighestCandle;
   
   double High[];
   
   ArraySetAsSeries(High, true);
   
   CopyHigh(_Symbol, _Period, 0, 100, High);
   
   HighestCandle = ArrayMaximum(High,0, 100);
   
   string objectName = "Line1";
   
   ObjectCreate(_Symbol, objectName, OBJ_HLINE,0,0,PriceInformation[HighestCandle].high );
   
   ObjectSetInteger(0, objectName, OBJPROP_COLOR,clrMagenta);
   
   ObjectSetInteger(0, objectName, OBJPROP_WIDTH, 3);
   
   ObjectMove(_Symbol,objectName, 0, 0, PriceInformation[HighestCandle].high );
   
   Comment("Highest candle: ", HighestCandle, "Highest price ", PriceInformation[HighestCandle].high);
   
  }