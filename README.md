# Robot Log Analyzer v1

A Bash script that analyzes robot system logs and generates summary reports.

## Features

- Counts total log events.
- Counts INFO, WARN, and ERROR events.
- Extracts error descriptions.
- Saves complete ERROR entries separately.
- Handles missing and empty log files.

## Project Structure

robot-log-analyzer/
├── logs/
│   ├── robot.log
│   └── empty.log
├── reports/
│   ├── summary.txt
│   └── errors.log
├── analyze.sh
└── README.md

## How to Run

```bash
chmod +x analyze.sh
./analyze.sh
