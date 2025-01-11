#include <stdio.h>
#include "clay.h" // Include the Clay header

#define CLAY_IMPLEMENTATION

int main() {
    clay_init(); // Initialize Clay

    // Create a window
    clay_window_t *window = clay_window_create("Basic Window", 800, 600);
    if (!window) {
        fprintf(stderr, "Failed to create window\n");
        return 1;
    }

    // Main loop
    while (clay_window_is_open(window)) {
        clay_window_poll_events(window);
        clay_window_clear(window, CLAY_COLOR_BLACK);
        clay_window_display(window);
    }

    // Cleanup
    clay_window_destroy(window);
    clay_cleanup(); // Cleanup Clay

    return 0;
}
