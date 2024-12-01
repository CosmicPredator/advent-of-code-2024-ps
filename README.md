# My Solutions to Advent of Code 2024 using PowerShell Scripting Language.

### How to run the script?
- Firstly, set the execution policy to bypass so that we can run external scripts.
    ```powershell
    PS C:\> Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass
    ```
- Open powershell and run the `runner.ps1` file.
    ```powershell
    PS C:/> ./runner.ps1
    ```
- Go to [Advent of Code Website](https://adventofcode.com/) and open the browser dev tools.
- Go to `Application` tab and look for a section called `Cookies`.
- Search for a cookie named `session` and copy it's value.
- Paste the token in the script prompt and hit enter.
- Tada! The solutions are being run and the results are tabulated.

#### My Test Rig
- **CPU:** AMD Ryzen 5 3550H
- **Memory:** 16gb (13gb usable)
- **Disk:** 1.25TB SSD
- **OS:** Windows 11 26100.2314
- **Powershell Version:** 7.5.0-rc.1

#### Execution Timings

| Solution        | Time Taken (ms) |
| :-------------: | :-------------: |
|Day 1 Part 1     | 35.8634         |
|Day 1 Part 2     | 29.5198         |