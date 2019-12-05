#include <Trade\Trade.mqh>


CTrade trade;
void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      
      string signal = "";
      
      double myMovingAverageArray[];
      
      double myShiftedAverrageArray[];
      
      int movingAverageDefinition = iMA(_Symbol, _Period, 20, 0 , MODE_SMA, PRICE_CLOSE);
      
      int ShiftedAverageDefinition = iMA(_Symbol, _Period, 20, 20, MODE_SMA, PRICE_CLOSE);
      
      ArraySetAsSeries(myMovingAverageArray, true);
      
      ArraySetAsSeries(myShiftedAverrageArray, true);
      
      CopyBuffer(movingAverageDefinition, 0, 0, 3, myMovingAverageArray);
      CopyBuffer(ShiftedAverageDefinition, 0, 0, 3, myShiftedAverrageArray);
      
      
      double myMovingAverageValue = myMovingAverageArray[0];
      
      double myShiftedAverrageValue = myShiftedAverrageArray[0];
      
      if(myMovingAverageValue > myShiftedAverrageValue)
        {
            signal = "buy";
        }
        
       if(myMovingAverageValue < myShiftedAverrageValue)
         {
            signal = "sell";
         }
         
         if(signal == "sell" && PositionsTotal() < 1)
           {
               trade.Sell(0.10, NULL, Bid, 0, (Bid-150* _Point), NULL);
           }
           
         if(signal == "buy" && PositionsTotal()< 1)
           {
               trade.Buy(0.10, NULL, Ask, 0, (Ask+150 * _Point), NULL);
           }
         Comment("The signal is now : ", signal); 
  }
  
