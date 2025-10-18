Setup Guide for prime-run.sh

The script above needs two steps to be fully functional: making it executable and placing it somewhere the system can find it (your PATH).

Step 1: Save and Make the Script Executable

Save the script: Save the code above into a file named prime-run.sh.

Make it executable: Open your terminal in the directory where you saved the file and run:

chmod +x prime-run.sh


Rename it (Optional but recommended): For easier use, you can rename it to remove the .sh extension:

mv prime-run.sh prime-run


Step 2: Move the Script to Your PATH

Move the executable file to a directory that is included in your system's $PATH (like /usr/local/bin or ~/bin).

Option A: Global (Requires Admin access)
This allows all users on the system to use the command.

sudo mv prime-run /usr/local/bin/


Option B: User-Specific (Recommended)
If you have a ~/bin folder, you can use that. If you don't, you might need to create it and add it to your shell configuration file (.bashrc or .zshrc).

Create the directory:

mkdir -p ~/bin


Move the script:

mv prime-run ~/bin/


Ensure it's in your PATH: Open your shell configuration file (e.g., ~/.bashrc or ~/.zshrc) and add the following line if it's not already there:

export PATH="$HOME/bin:$PATH"


Apply the changes:

source ~/.bashrc  # Or source ~/.zshrc


Step 3: Use the Command

You can now run any application using your NVIDIA GPU by prefixing the command with prime-run:

prime-run steam
prime-run /path/to/my/game/executable


Alternative: Shell Function (No File Needed)

Instead of managing an executable file, you can define prime-run as a shell function directly in your ~/.bashrc or ~/.zshrc. This is often simpler and faster.

Open your configuration file (~/.bashrc or ~/.zshrc).

Add this function definition:

# NVIDIA Prime Offload Function
prime-run() {
    __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
}


Save the file and apply changes: source ~/.bashrc
