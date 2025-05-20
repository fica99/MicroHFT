#pragma once
#include <chrono>

inline uint64_t now() {
	return std::chrono::duration_cast<std::chrono::microseconds>(
		std::chrono::steady_clock::now().time_since_epoch()).count();
}
