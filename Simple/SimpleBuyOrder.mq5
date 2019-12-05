
#include <Trade\Trade.mqh>

CTrade trade;

void OnTick()
{
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);

   MqlRates PriceInfo[];

   ArraySetAsSeries(PriceInfo, true);

   int PriceData = CopyRates(Symbol(), Period(), 0, 3, PriceInfo);

   if (PriceInfo[1].close > PriceInfo[1].open)
   {
      if (PositionsTotal() == 0)
      {
         trade.Buy(
             0.10,               // how much
             NULL,               // current symbol
             Ask,                // buy price
             Ask - 300 * _Point, //Stop loss
             Ask + 150 * _Point, //Take profit
             NULL                // Comment
         );
      }
   }
}
//+------------------------------------------------------------------+
