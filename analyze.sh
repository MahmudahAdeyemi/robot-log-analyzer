#!/bin/bash
# Log file location
log_file="logs/robot.log"

# Validate the log file
if [ ! -f "$log_file" ]; then
    echo "Error: Log file does not exist."
    exit 1
elif [ ! -s "$log_file" ]; then
    echo "Error: Log file is empty."
    exit 1
fi
# Count log events
total_events=$(wc -l < "$log_file")
info_count=$(grep -c "INFO" "$log_file")
warn_count=$(grep -c "WARN" "$log_file")
error_count=$(grep -c "ERROR" "$log_file")

# Generate summary report
{
    printf "ROBOT LOG ANALYSIS REPORT\n"
    printf "=========================\n\n"

    printf "Total events: %s\n" "$total_events"
    printf "INFO events: %s\n" "$info_count"
    printf "WARN events: %s\n" "$warn_count"
    printf "ERROR events: %s\n\n" "$error_count"

    printf "ERROR DETAILS:\n"
    printf -- "--------------\n"
    grep "ERROR" "$log_file" | awk '{for (i=4; i<=NF; i++) printf "%s%s", $i, (i==NF ? "\n" : " ")}'

} > reports/summary.txt
# Save complete ERROR entries
grep "ERROR" "$log_file" > reports/errors.log
echo "Analysis complete."
echo "Summary report: reports/summary.txt"
echo "Error log: reports/errors.log"
