#include <GLFW/glfw3.h>

#include <stdio.h>
#include <stdlib.h>

#include "headers.h"
#include <vulkan/vulkan.h>
#include <vulkan/vulkan_core.h>


void createDevice(State *state) {
    float queuePriority = 1.0f;

    VkDeviceQueueCreateInfo queueInfo = {
        .sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
        .pNext = NULL,
        .queueFamilyIndex = state->vulkan.queueFamily,
        .queueCount = 1,
        .pQueuePriorities = &queuePriority,
    };

    const char *swapchainExtension = VK_KHR_SWAPCHAIN_EXTENSION_NAME;

    VkDeviceCreateInfo createInfo = {
        .sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
        .pNext = NULL,
        .queueCreateInfoCount = 1,
        .pQueueCreateInfos = &queueInfo,
        .enabledExtensionCount = 1,
        .ppEnabledExtensionNames = &swapchainExtension,
        .pEnabledFeatures = NULL,
    };

    VkResult vkDeviceResult = vkCreateDevice(
        state->vulkan.physicalDevice,
        &createInfo,
        NULL,
        &state->vulkan.device
    );

    if (vkDeviceResult != VK_SUCCESS) {
        printf("Error: Failed to create logical device (VkResult: %d)\n", vkDeviceResult);
        exit(1);
    }
}

void queueFamilySelect(State *state) {
    state->vulkan.queueFamily = UINT32_MAX;

    uint32_t count;
    vkGetPhysicalDeviceQueueFamilyProperties(state->vulkan.physicalDevice,
                                             &count, NULL);

    VkQueueFamilyProperties *queueFamilies =
        malloc(count * sizeof(VkQueueFamilyProperties));

    if (queueFamilies == NULL) {
        printf("Couldn't allocate memory\n");
        exit(1);
    }

    vkGetPhysicalDeviceQueueFamilyProperties(state->vulkan.physicalDevice,
                                             &count, queueFamilies);

    for (uint32_t queueFamilyIndex = 0; queueFamilyIndex < count;
         ++queueFamilyIndex) {
        VkQueueFamilyProperties properties = queueFamilies[queueFamilyIndex];

        if (properties.queueFlags & VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU) {
            state->vulkan.queueFamily = queueFamilyIndex;
            break;
        }
    }

    free(queueFamilies);
}

void selectPhysicalDevice(State *state) {
    uint32_t deviceCount;
    VkResult enumerationRes =
        vkEnumeratePhysicalDevices(state->vulkan.instance, &deviceCount, NULL);

    if (enumerationRes != VK_SUCCESS || deviceCount == 0) {
        printf("Count not list physical devices\n");
        exit(1);
    }

    printf("Number of physical devices: %d\n", deviceCount);

    VkResult res = vkEnumeratePhysicalDevices(
        state->vulkan.instance, &(uint32_t){1}, &state->vulkan.physicalDevice);

    if (res == VK_INCOMPLETE) {
        printf("Count not list physical devices\n");
        exit(1);
    }
}

void initVulkan(State *state) {
    VkApplicationInfo appInfo;
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pApplicationName = state->conf.windowTitle;
    appInfo.apiVersion = VK_API_VERSION_1_0;

    VkInstanceCreateInfo createInfo;
    createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    createInfo.pApplicationInfo = &appInfo;

    uint32_t glfwExtensionCount = 0;
    const char **glfwExtensions;
    glfwExtensions = glfwGetRequiredInstanceExtensions(&glfwExtensionCount);

    createInfo.enabledExtensionCount = glfwExtensionCount;
    createInfo.ppEnabledExtensionNames = glfwExtensions;

    createInfo.enabledLayerCount = 0;

    if (vkCreateInstance(&createInfo, nullptr, &state->vulkan.instance) !=
        VK_SUCCESS) {
        printf("failed to create instance!\n");
        exit(1);
    }
}

void init(State *state) {
    glfwInit();
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    state->conf.window =
        glfwCreateWindow(state->conf.windowWidth, state->conf.windowHeight,
                         state->conf.windowTitle, NULL, NULL);

    initVulkan(state);
    selectPhysicalDevice(state);
    queueFamilySelect(state);
    createDevice(state);
}

void loop(State *state) {
    while (!glfwWindowShouldClose(state->conf.window)) {
        glfwPollEvents();
    }
}

void cleanup(State *state) {
    glfwDestroyWindow(state->conf.window);
    glfwTerminate();
}

int main() {
    const char windowTitle[] = {"Learning Vulkan"};
    State state = {.conf = {.windowTitle = windowTitle,
                            .windowFullscreen = false,
                            .windowWidth = 720,
                            .windowHeight = 480,
                            .window = NULL}};

    init(&state);
    loop(&state);
    cleanup(&state);

    return EXIT_SUCCESS;
}
