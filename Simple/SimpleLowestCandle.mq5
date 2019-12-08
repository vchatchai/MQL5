#include <Trade\Trade.mqh>
void OnTick()
  {
      MqlRates PriceInformation[];
      
      ArraySetAsSeries(PriceInformation, true);
      
      int Data = CopyRates(_Symbol, _Period, 0, 100, PriceInformation);
      
      int LowestCandle;
      
      double Low[];
      
      ArraySetAsSeries(Low, true);
      
      CopyLow(_Symbol, _Period, 0, 100, Low);
      
      LowestCandle =  ArrayMinimum(Low,0,100); 
      
      string name = "Line1";
      
      ObjectCreate(_Symbol, name,OBJ_HLINE,0,0,PriceInformation[LowestCandle].low);
      
      ObjectSetInteger(0, name, OBJPROP_COLOR, clrMagenta);
      
      ObjectSetInteger(0,name, OBJPROP_WIDTH, 3);
      ObjectMove(_Symbol, name, 0,0, PriceInformation[LowestCandle].low);
      
      
         
  }
