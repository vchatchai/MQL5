#include<Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK), _Digits);
      
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID), _Digits);
      
      MqlRates PriceArray[];
      
      ArraySetAsSeries(PriceArray, true);
      
      int Data = CopyRates(_Symbol, _Period, 0, 3, PriceArray);
      
      double mySARArray[];
      
      int SARDefinition = iSAR(_Symbol, _Period, 0.02, 0.2);
      
      ArraySetAsSeries(mySARArray, true);
      
      CopyBuffer(SARDefinition, 0, 0, 3, mySARArray);
      
      double LastSARValue = NormalizeDouble(mySARArray[1], 5);
      
      string signal = "";
      if(LastSARValue < PriceArray[1].low)
      {
         signal = "buy";
      }
      
      
      if(LastSARValue > PriceArray[1].high)
      {
         signal = "sell";
      }
      
      if (signal == "sell" && PositionsTotal() < 1 ) {
         trade.Sell(0.10, NULL, Bid, (Bid+200 * _Point), (Bid-150 * _Point), "SimpleParabolicSAREA");
      
      }
      
      if(signal == "buy" && PositionsTotal() < 1){
      
         trade.Buy(0.10, NULL, Ask, (Ask-100 * _Point), (Ask + 150 * _Point), "SimpleParabolicSAREA");
         
      
      }
      
      Comment("This signal is: ", signal);
      
      
      
  }
