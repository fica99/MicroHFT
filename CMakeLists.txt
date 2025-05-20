cmake_minimum_required(VERSION 3.10)
project(microhft)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O2 -Wall -Wextra -pthread")

add_executable(microhft
	main.cpp
	market_data.hpp
	strategy.hpp
	order_manager.hpp
	logger.hpp
	utils.hpp
)