

# ChangeDNS PowerShell Script

This PowerShell script facilitates the modification of DNS settings on a Windows system. It provides the ability to switch between different DNS configurations.

## Instructions

#### Prerequisites:

Run PowerShell with administrative privileges.

#### How to Use:

 1. **Start PowerShell as Administrator:**

       

 - Right-click on PowerShell and select "Run as Administrator."
 
 2. **Ensure Administrative Rights:**

       

 - The script requires administrative privileges to make changes. Running without these rights might result in failure.

 3. **Run the Script:**
      
       

 - Type or copy the path of the script into the PowerShell window and press Enter.

 - Use the following command to run the script:
        
       PowerShell -File "C:\Path\To\Your\Script\ChangeDNS.ps1"
 4. **Select Action:**
- When prompted, input set to switch to Cloudflare DNS (1.1.1.1 and 1.0.0.1) or dhcp to revert to automatic DNS settings.

5. **Confirmation:**

- Upon successful execution, the script will display a confirmation message about the DNS change.

## About the Script
#### Purpose:
This script is designed to modify DNS settings on Windows systems by changing them to Cloudflare DNS servers (1.1.1.1 and 1.0.0.1) or reverting back to automatic (DHCP) DNS settings.

#### Administrative Rights:
Ensure the PowerShell script is run with administrative rights for successful execution. Administrative privileges are necessary to make changes to network configurations.

#### Execution Policy:
The script may modify the PowerShell execution policy to RemoteSigned for successful execution. This policy change ensures that the script can run without restrictions imposed by the execution policy.
