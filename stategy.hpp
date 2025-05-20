#pragma once
#include "order_manager.hpp"
#include "market_data.hpp"
#include "logger.hpp"

class Strategy {
public:
	Strategy(OrderManager& om, Logger& logger)
		: orderManager_(om), logger_(logger) {}

	void on_market_data(const MarketData& md) {
		if (md.price < 100.5) {
			orderManager_.send_order("BUY", md.price);
		}
	}

private:
	OrderManager& orderManager_;
	Logger& logger_;
};
