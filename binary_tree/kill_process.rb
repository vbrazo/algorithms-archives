# Given n processes, each process has a unique PID (process id) \
# and its PPID (parent process id).
#
# Each process only has one parent process, but may have one or
# more children processes. This is just like a tree structure.
# Only one process has PPID that is 0, which means this process
# has no parent process. All the PIDs will be distinct positive integers.
#
# We use two list of integers to represent a list of processes,
# where the first list contains PID for each process and the
# second list contains the corresponding PPID.
#
# Now given the two lists, and a PID representing a process
# you want to kill, return a list of PIDs of processes that
# will be killed in the end. You should assume that when a
# process is killed, all its children processes will be killed.
# No order is required for the final answer.

# Input:
# pid =  [1, 3, 10, 5]
# ppid = [3, 0, 5, 3]
# kill = 5
# Output: [5,10]
# Explanation:
#            3
#          /   \
#         1     5
#              /
#             10
# Kill 5 will also kill 10.

# @param {Integer[]} pid
# @param {Integer[]} ppid
# @param {Integer} kill
# @return {Integer[]}
def kill_process(pid, ppid, kill)
  process_map = {}

  ppid.each_with_index do |process, i|
    process_map[process] ||= []
    process_map[process] << pid[i]
  end

  kill_process_and_subs(process_map, kill)
end

def kill_process_and_subs(process_map, kill)
  killed_processes = [kill]

  if map_entry = process_map[kill]
    map_entry.each do |subp|
      killed_processes += kill_process_and_subs(process_map, subp)
    end
  end

  killed_processes
end
