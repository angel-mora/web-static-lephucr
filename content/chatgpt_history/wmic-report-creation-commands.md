---
title: WMIC Report Creation Commands
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  ## Activity File: Creating a Report with wmic Output"
draft: false
---

# WMIC Report Creation Commands

## 🧠 Full Chat

🙋 **You:**

## Activity File: Creating a Report with wmic Output

In this activity, you will continue in the role of junior systems administrator at Good Corp, Inc.

- Your CIO wants you to run `wmic` queries to continue baselining the system, including the Windows edition and the build number.

- You also have to retrieve a list of disk information details.  

- The CIO also wants you to append these results to your `report.txt` file.

Continue to use the Windows RDP Host machine as the `azadmin` user. Remember to navigate to the `reports` directory you created in the previous activity.

- **Note**: You may want to save all of your working commands to a text file for reference. This way, if you mess up your report, you can delete it easily and re-run the working commands.

### Instructions

1. Using one command, append the following `wmic` query to your `report.txt` file as one output:

     - Windows edition

     - Build number

     **Note**: You can run `wmic [alias] get /value` to see the different properties and values that can be retrieved from an alias. For example: `wmic os get /value`

2. Create a `wmic` query for each of the following aliases and append them to the report:

    - User account information (`useraccount`): Name, the security identifier of the user (`sid`), and description.

        - **Note**: The security ID (`sid`) of each user account is used to identify the groups the user belongs in, set access control entries, and bind security descriptors to each user.

    - Login information (`netlogin`): Username (`caption`), number of times user has logged on, and last logon time.

        - **Note**:  The `LastLogon` format follows the `yyyy/MM/DD-HH:mm:ss.SSSSSSZ` date and time format. 

         - `.SSSSSSZ` are the milliseconds (`000000` in the output) and time zone (`-300` in the output). 

        - This part of the output follows the `SimpleDateFormat` protocol for date and time.

    - Windows Update information (`qfe`): Update name (`caption`), description, installed on date, and hotfix ID. 

**Note**: Make sure you verify each output before using the `/APPEND:<filename>` switch appending it to your `report.txt` file.

----

© 2023 edX Boot Camps LLC. Confidential and Proprietary. All Rights Reserved.

Give the cmd commands to execute for each task

---

🤖 **Assistant:**

Sure, here are the commands you'll need to run for each task.

1. For the first part, you can append the Windows edition and build number information to your report.txt file using the following command:

   ```cmd
   wmic os get Caption, BuildNumber /FORMAT:LIST >> report.txt
   ```

2. For the remaining parts, you will use `wmic` to query for the different aliases and append them to the report:

   - User account information (`useraccount`): Name, the security identifier of the user (`sid`), and description.
     
     ```cmd
     wmic useraccount get Name,SID,Description /FORMAT:LIST >> report.txt
     ```
  
   - Login information (`netlogin`): Username (`caption`), number of times user has logged on, and last logon time.
     
     ```cmd
     wmic netlogin get Caption,NumberOfLogons,LastLogon /FORMAT:LIST >> report.txt
     ```

   - Windows Update information (`qfe`): Update name (`caption`), description, installed on date, and hotfix ID.

     ```cmd
     wmic qfe get Caption,Description,InstalledOn,HotFixID /FORMAT:LIST >> report.txt
     ```

Please note that your access rights may affect the execution of these commands, and the `/FORMAT:LIST` switch is used to format the output in a readable way. The `>>` operator is used to append the output of the `wmic` command to the `report.txt` file.

Make sure to execute these commands in the `reports` directory as you were instructed.

Also, please note that `wmic` is deprecated in Windows Server 2022 and newer versions, you may need to use alternative tools such as PowerShell in the future.