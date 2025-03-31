import sys
import os
import re


def get_heap_maps(pid):
    """Retrieve heap memory regions from /proc/<pid>/maps."""
    try:
        with open(f"/proc/{pid}/maps", "r") as maps_file:
            for line in maps_file:
                if "[heap]" in line:
                    return line.split()[0]
    except FileNotFoundError:
        print("Error: Process not found.")
        sys.exit(1)
    return None


def read_memory(pid, address_range):
    """Read memory from heap of process."""
    start, end = [int(x, 16) for x in address_range.split("-")]
    try:
        with open(f"/proc/{pid}/mem", "rb") as mem_file:
            mem_file.seek(start)
            return mem_file.read(end - start), start
    except PermissionError:
        print("Error: Permission denied. Try running with sudo.")
        sys.exit(1)


def write_memory(pid, start_addr, search, replace, heap_content):
    """Find and replace string in memory."""
    if len(replace) > len(search):
        print("Error: Replacement string must not be longer than search string.")
        sys.exit(1)

    match = re.search(search.encode(), heap_content)
    if not match:
        print("Error: String not found in heap.")
        sys.exit(1)

    replace_bytes = replace.encode().ljust(len(search), b'\x00')
    target_address = start_addr + match.start()

    try:
        with open(f"/proc/{pid}/mem", "rb+") as mem_file:
            mem_file.seek(target_address)
            mem_file.write(replace_bytes)
        print("Memory updated successfully!")
    except PermissionError:
        print("Error: Permission denied. Try running with sudo.")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid, search_str, replace_str = sys.argv[1], sys.argv[2], sys.argv[3]
    if not pid.isdigit():
        print("Error: Invalid PID.")
        sys.exit(1)

    heap_range = get_heap_maps(pid)
    if not heap_range:
        print("Error: Heap not found.")
        sys.exit(1)

    heap_data, heap_start = read_memory(pid, heap_range)
    write_memory(pid, heap_start, search_str, replace_str, heap_data)
