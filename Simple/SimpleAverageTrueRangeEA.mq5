#include <Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
         string signal = "";
         double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK ), _Digits);
  
         double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
         
         double PriceArray[];
         
         int AverageTrueRangeDefinition = iATR(_Symbol, _Period, 14);
         
         ArraySetAsSeries(PriceArray, true);
         
         CopyBuffer(AverageTrueRangeDefinition, 0, 0, 3,PriceArray);
         
         double AverageTrueRangeValue = NormalizeDouble(PriceArray[0], 5);
         
         static double OldValue;
         
         if(OldValue ==0 )
           {
              OldValue = AverageTrueRangeValue;
           }
           
           if(AverageTrueRangeValue > OldValue)
             {
              signal = "buy";
             }
             
             if(AverageTrueRangeValue < OldValue)
               {
                signal = "sell";
               }
               
              if(signal == "sell" && PositionsTotal()  < 1 ) 
              {
                  trade.Sell(0.10, NULL, Bid, (Bid + 200 * _Point), (Bid-150 *_Point), "SimpleAverageTrueRangeEA Sell");
                  
              }
              
              if(signal == "buy" && PositionsTotal() < 1 )
              {
                  trade.Buy(0.10, NULL, Ask, (Ask - 200 * _Point), (Ask+150 * _Point), "AverageTrueRangeDefinition Buy" );
              }
              
              Comment("The signal is: ", signal, "\n", OldValue, "\n", AverageTrueRangeValue);
  
  }
