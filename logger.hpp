#pragma once
#include <iostream>
#include <string>
#include <mutex>

class Logger {
public:
	void log(const std::string& msg) {
		std::lock_guard<std::mutex> lock(mtx_);
		std::cout << "[LOG] " << msg << "\n";
	}

private:
	std::mutex mtx_;
};
