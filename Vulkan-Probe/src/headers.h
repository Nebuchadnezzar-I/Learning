#pragma once

#include "vulkan_core.h"
#include <GLFW/glfw3.h>

typedef struct {
    const char *windowTitle;
    bool windowFullscreen;
    uint16_t windowWidth;
    uint16_t windowHeight;

    GLFWwindow *window;
} AppConfig;

typedef struct {
    VkInstance instance;
    VkPhysicalDevice physicalDevice;
    uint32_t queueFamily;
    VkDevice device;
} Vulkan;

typedef struct {
    AppConfig conf;
    Vulkan vulkan;
} State;
