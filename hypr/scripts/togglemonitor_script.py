import os, sys
from typing import Tuple

def is_commented_out(line: str) -> bool:
    for c in line:
        if not c:
            continue
        return c == "#"
    return False

def is_correct_line(line: str) -> bool:
    return "monitor" in line and "DP-3" in line and "disabled" in line

def get_correct_config_line(lines: str) -> Tuple[int, str | None]:
    index = 0
    monitor_line = None
    for l in lines.splitlines():
        index += 1
        if is_correct_line(l):
            monitor_line = l
            break
    return (index, monitor_line)

def disable_monitor(fname: str, index: int, fcontents: str):
    fcontents = "\n".join([
        l.replace("#", "", 1) if i == index - 1 else l for (i, l) in enumerate(fcontents.splitlines())
    ])
    with open(fname, "w") as f:
        f.write(fcontents)

def enable_monitor(fname: str, index: int, fcontents: str):
    fcontents = "\n".join([
        "#" + l if i == index - 1 else l for (i, l) in enumerate(fcontents.splitlines())
    ])
    with open(fname, "w") as f:
        f.write(fcontents)

def main(enable: bool):
    fname = f"{os.environ['HOME']}/dotfiles/hypr/conf/monitor.conf"
    with open(fname, "r") as f:
        fcontents = f.read()
    index, line = get_correct_config_line(fcontents)
    if not line:
        raise Exception("Could not find correct line in config")
    if enable and not is_commented_out(line):
        enable_monitor(fname, index, fcontents)
    elif not enable and is_commented_out(line):
        disable_monitor(fname, index, fcontents)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        raise Exception("Missing toggle option arg: `enable` | `disable`")
    if sys.argv[1] not in ["enable", "disable"]:
        raise Exception(f"Toggle option arg is only allowed to be `enable` or `disable`, not `{sys.argv[1]}`")

    main(sys.argv[1] == "enable")
