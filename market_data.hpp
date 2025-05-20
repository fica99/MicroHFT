#pragma once
#include <functional>
#include "utils.hpp"
#include "logger.hpp"

struct MarketData {
	double price;
	uint64_t timestamp;
};

class MarketDataReceiver {
public:
	MarketDataReceiver(Logger& logger) : logger_(logger) {}

	void start(std::function<void(const MarketData&)> callback) {
		// Здесь будет TCP-сокет, пока эмулятор
		for (int i = 0; i < 1000; ++i) {
			MarketData md{100.0 + i * 0.01, now()};
			callback(md);
		}
	}

private:
	Logger& logger_;
};
