#include <Trade\Trade.mqh>

CTrade trade;

int OnInit()
  {
   OpenTestPositions();
   return(INIT_SUCCEEDED);
  }
void OnTick()
  {
      Comment("Number of positions:",CountbBuyPositions());
   
  }
  
  int CountbBuyPositions()
  {
   int NumberOfBuyPositions=0;
   for(int i=PositionsTotal();i >= 0;i--)
     {
         string CurrencyPair = PositionGetSymbol(i);
         
         int PositionDirection = PositionGetInteger(POSITION_TYPE);
         
         if(Symbol() == CurrencyPair)
           {
            if(PositionDirection == POSITION_TYPE_BUY)
              {
               NumberOfBuyPositions = NumberOfBuyPositions + 1;
              }
           }
     }
     return NumberOfBuyPositions;
  
  }
  
  void OpenTestPositions() {
  
   MathSrand(GetTickCount());
   
   double NumberOfTestPositons = MathRand()%10;
   
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK), _Digits);
   
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   for(int i=0;i<NumberOfTestPositons;i++)
     
     {
      trade.Buy(0.10, NULL, Ask, 0, (Ask+300*_Point), i );
      trade.Sell(0.10, NULL, Bid, 0, (Bid-300 * _Point), i );
      
     }
  
  }