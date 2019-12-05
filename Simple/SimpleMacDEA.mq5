 #include <Trade\Trade.mqh>
 
 CTrade trade;
void OnTick()
  { 
  
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   double BID = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
   
   string signal = "";
   
   double myPriceArray[];
   
   int MacDDefinition = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE );
   
   CopyBuffer(MacDDefinition, 0, 0, 3, myPriceArray);
   
   float MacDValue = (myPriceArray[0]);
   
   if(MacDValue > 0)
     {
      signal = "sell";
     }else
      {
         signal = "buy";
        }
        
       if(signal == "sell" && PositionsTotal() < 1 ) 
       {
         trade.Sell(0.10,NULL,BID,(BID+200 * _Point), (BID-150*_Point), "Simple MACD SELL" );
       }
       if(signal == "buy" && PositionsTotal() < 1)
       { 
         trade.Buy(0.10, NULL, Ask, (Ask-200*_Point), (Ask+150 * _Point), "Simple MACD BUY");
       
       }
       
       Comment("This signal is now : ", signal);
       
       
   
  } 