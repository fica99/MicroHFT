#pragma once
#include <iostream>
#include <string>
#include "logger.hpp"

class OrderManager {
public:
	OrderManager(Logger& logger) : logger_(logger) {}

	void send_order(const std::string& side, double price) {
		logger_.log("Sending order: " + side + " @ " + std::to_string(price));
	}

private:
	Logger& logger_;
};
