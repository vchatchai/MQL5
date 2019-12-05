#include <Trade\Trade.mqh>

input int SmallMovingAverage=20;
input int BigMovingAverage=50;

CTrade trade;

void OnTick()
  {
         double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
         
         double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID), _Digits);
         
         string  signal = "";
         
         double SmallMovingAverageArray[], BigMovingAverageArray[];
         
         int SmallMovingAverageDefinition = iMA(_Symbol, _Period,SmallMovingAverage, 0, MODE_SMA, PRICE_CLOSE);
         
         int BigMovingAverageDefinition = iMA(_Symbol, _Period, BigMovingAverage, 0 , MODE_SMA, PRICE_CLOSE);
         
         CopyBuffer(SmallMovingAverageDefinition, 0,0,3, SmallMovingAverageArray);
         
         CopyBuffer(BigMovingAverageDefinition, 0, 0, 3, BigMovingAverageArray);
         
         if(BigMovingAverageArray[1] >SmallMovingAverageArray[1]) {
            if(BigMovingAverageArray[2] < SmallMovingAverageArray[2]){
               signal = "buy";
            }
         }
         
         if(BigMovingAverageArray[1] < SmallMovingAverageArray[1]) {
            if(BigMovingAverageArray[2] > SmallMovingAverageArray[2]){
               signal="sell";
               
            }
         }
         
         if(signal == "sell" && PositionsTotal() < 1 ) { 
            trade.Sell(0.10, NULL, Bid, 0, (Bid-150*_Point), "Simple crossover buy" );
            
         }
         
         
         if(signal == "buy" && PositionsTotal() < 1 ) {
            trade.Buy(0.10, NULL, Ask, 0, (Ask+150 *_Point), "Simple crossover buy");
         
         }
         
         Comment("The signal is now: " , signal);
  }
 
