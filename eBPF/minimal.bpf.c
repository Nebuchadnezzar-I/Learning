/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
#define BPF_NO_GLOBAL_DATA
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

typedef unsigned int u32;
typedef int pid_t;
const pid_t pid_filter = 0;

char LICENSE[] SEC("license") = "Dual BSD/GPL";

SEC("tp/syscalls/sys_enter_write")
int handle_tp(void *ctx) {
    bpf_printk("BPF program triggered!\n");

    // pid_t pid = bpf_get_current_pid_tgid() >> 32;
    // if (pid == 16729) return 0;
    // bpf_printk("BPF triggered sys_enter_write from PID %d.\n", pid);
    // return 0;
    return 0;
}