#include "market_data.hpp"
#include "strategy.hpp"
#include "order_manager.hpp"
#include "logger.hpp"

int main() {
	Logger logger;
	MarketDataReceiver receiver(logger);
	OrderManager orderManager(logger);
	Strategy strategy(orderManager, logger);

	receiver.start([&](const MarketData& data) {
		strategy.on_market_data(data);
	});

	return 0;
}
