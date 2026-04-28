import threading
import multiprocessing
import os
def exit_if_orphaned():
    # concurrent.futures.ProcessPoolExecutors are suffering from non-exiting workers once the parent process is gone
    # see issue https://github.com/python/cpython/issues/111873

    # wait for parent process to die first; may never happen
    multiprocessing.parent_process().join()
    os._exit(-1)

def start_orphan_guard():
    threading.Thread(target=exit_if_orphaned, daemon=True).start()
