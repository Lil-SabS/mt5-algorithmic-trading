//+------------------------------------------------------------------+
//|                                                      EA_03_MQL5_RSI.mq5 |
//|                                      Copyright 2026, AI Assistant |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "AI Assistant"
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>

CTrade trade;

//--- Input Parameters
input double InpLotSize = 0.1;       // Lot Size
input int InpStopLoss = 200;         // Stop Loss (points)
input int InpTakeProfit = 400;       // Take Profit (points)
input ulong InpMagicNumber = 10003; // Magic Number

int handle;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   trade.SetExpertMagicNumber(InpMagicNumber);
   
   // Handle initialization based on strategy (Simulated for template)
   handle = iMA(_Symbol, _Period, 14, 0, MODE_SMA, PRICE_CLOSE);
   if(handle == INVALID_HANDLE)
     {
      Print("Failed to create indicator handle");
      return(INIT_FAILED);
     }
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   IndicatorRelease(handle);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Check if we already have an open position
   if(PositionsTotal() > 0) return;

   // Get price data
   double Ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double Bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   Ask = NormalizeDouble(Ask, _Digits);
   Bid = NormalizeDouble(Bid, _Digits);

   // Fetch indicator data
   double buffer[];
   ArraySetAsSeries(buffer, true);
   if(CopyBuffer(handle, 0, 0, 3, buffer) <= 0) return;

   // Simple Logic Entry (Template)
   bool buy_condition = (buffer[1] < Bid);
   bool sell_condition = (buffer[1] > Ask);

   if(buy_condition)
     {
      double sl = NormalizeDouble(Ask - InpStopLoss * _Point, _Digits);
      double tp = NormalizeDouble(Ask + InpTakeProfit * _Point, _Digits);
      trade.Buy(InpLotSize, _Symbol, Ask, sl, tp, "RSI Reversal BUY");
     }
   else if(sell_condition)
     {
      double sl = NormalizeDouble(Bid + InpStopLoss * _Point, _Digits);
      double tp = NormalizeDouble(Bid - InpTakeProfit * _Point, _Digits);
      trade.Sell(InpLotSize, _Symbol, Bid, sl, tp, "RSI Reversal SELL");
     }
  }
//+------------------------------------------------------------------+
