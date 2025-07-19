---
title: Pushing application.yml to Heroku
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Pushing application.yml to Heroku

## ✅ TODOs


## 📌 Summary
How can I push application.yml figaro (kinda env) file to heroku using the cli? Like cat application.yml and pass those as params to the heroku config set api.

## 🧠 Full Chat


How can I push application.yml figaro (kinda env) file to heroku using the cli? Like cat application.yml and pass those as params to the heroku config set api.

To push an `application.yml` file (commonly used with Figaro for environment configuration in Ruby on Rails applications) to Heroku using the Heroku CLI, you can use a combination of shell commands and the `heroku config:set` command. Here's a step-by-step guide:

1. **Install Heroku CLI**: Make sure you have the Heroku CLI installed. If not, you can download it from the [Heroku website](https://devcenter.heroku.com/articles/heroku-cli).

2. **Login to Heroku**: Open your terminal and log in to Heroku using the command `heroku login`.

3. **Navigate to Your App's Directory**: Change your directory to where your Rails application is located.

4. **Read and Set Config Vars**: You can read the contents of your `application.yml` file and set them as Heroku config vars in one line using shell command substitution. Here's the command you can use:

   ```bash
   heroku config:set $(cat application.yml | sed '/^$/d; /#[[:print:]]*$/d' | xargs)
   ```

   Let me break down what this does:
   - `cat application.yml`: This command reads the contents of `application.yml`.
   - `sed '/^$/d; /#[[:print:]]*$/d'`: This `sed` command removes empty lines and comments from the output.
   - `xargs`: This converts the output into a format suitable for `heroku config:set`.
   - `heroku config:set`: This sets the environment variables in your Heroku application.

5. **Push Your Code to Heroku**: After setting the config vars, you can deploy your application using Git. If you haven't already, add Heroku as a remote with `heroku git:remote -a your-app-name`. Then, deploy your application with `git push heroku master` or `git push heroku main` depending on your main branch name.

6. **Verify Configuration**: After deployment, verify that your configuration variables are set correctly by running `heroku config`.

Remember that this method directly sets the environment variables in your Heroku application. If you have sensitive information in your `application.yml` file, ensure that it's appropriate to upload them to Heroku's environment. Also, be aware that this approach might not work correctly if your `application.yml` file contains multi-line values or special characters that need escaping in the shell.

Must use = instead of :

You're correct, Heroku config vars use the format `KEY=VALUE`. To convert the YAML file to this format, you can slightly modify the command. Assuming your `application.yml` uses the standard YAML format with `key: value` pairs, here's an updated command:

1. Use `awk` to transform `key: value` pairs into `KEY=VALUE` pairs, suitable for Heroku:

   ```bash
   heroku config:set $(cat application.yml | awk '/:/ {print $1 "=" $2}' | xargs)
   ```

   Breakdown of the command:
   - `cat application.yml`: Reads the contents of `application.yml`.
   - `awk '/:/ {print $1 "=" $2}'`: This `awk` command processes each line with a colon (`:`), splitting it into two fields. It then prints these fields in the `KEY=VALUE` format required by Heroku.
   - `xargs`: Converts the output into a single line.
   - `heroku config:set`: Sets the environment variables in your Heroku application.

2. After running this command, proceed with deploying your application to Heroku as usual, and verify the configuration with `heroku config`.

Note: This approach assumes your `application.yml` file is relatively straightforward, without nested YAML structures or special characters that need escaping. If your YAML file contains more complex structures or special characters, you may need a more sophisticated script to correctly parse and transform the data. Also, ensure that no sensitive data is exposed unintentionally.

awk is not removing the : from the VAR name

You're right, the `awk` command needs to be adjusted to correctly format the keys and values from the `application.yml` file into `KEY=VALUE` pairs for Heroku, while removing the colon (`:`) from the variable names. Here's the revised command:

1. Use this `awk` command to format the `application.yml` contents:

   ```bash
   heroku config:set $(cat application.yml | awk -F': ' '{gsub(" ","", $1); print $1 "=" $2}' | xargs)
   ```

   Explanation:
   - `cat application.yml`: Reads the contents of `application.yml`.
   - `awk -F': ' '{gsub(" ","", $1); print $1 "=" $2}'`: This `awk` command does several things:
     - `-F': '`: Sets the field separator to `: ` (colon and space).
     - `gsub(" ","", $1)`: Removes spaces from the first field (the key).
     - `print $1 "=" $2`: Formats the line as `KEY=VALUE`.
   - `xargs`: Converts the output into a single line.
   - `heroku config:set`: Sets the environment variables in your Heroku application.

2. After running this command, you can proceed with the usual steps for deploying your application to Heroku.

Remember, this command assumes that your `application.yml` file has a simple key-value structure with each line formatted as `key: value`. If your YAML file contains nested structures, complex values, or special characters, you might need a more sophisticated parsing approach. Additionally, always ensure that you are not inadvertently exposing sensitive information when setting environment variables.

remove jumpspaces and comments with # in the same awk command

To remove leading/trailing whitespace and ignore lines with comments (lines starting with `#`) in the same `awk` command while converting `application.yml` to Heroku's `KEY=VALUE` format, you can enhance the `awk` script. Here's the updated command:

```bash
heroku config:set $(cat application.yml | awk -F': ' '!/^#/ && NF {gsub(/^ +| +$/,"",$1); gsub(/^ +| +$/,"",$2); print $1 "=" $2}' | xargs)
```

Explanation of the command:
- `cat application.yml`: Reads the contents of `application.yml`.
- `awk -F': ' '!/^#/ && NF {gsub(/^ +| +$/,"",$1); gsub(/^ +| +$/,"",$2); print $1 "=" $2}'`:
  - `-F': '`: Sets the field separator to `: ` (colon and space).
  - `!/^#/ && NF`: Processes lines that do not start with `#` and are not empty.
  - `gsub(/^ +| +$/,"",$1); gsub(/^ +| +$/,"",$2)`: Removes leading and trailing whitespace from both the key and the value.
  - `print $1 "=" $2`: Formats the line as `KEY=VALUE`.
- `xargs`: Converts the output into a single line.
- `heroku config:set`: Sets the environment variables in your Heroku application.

After running this command, continue with deploying your application and verifying the configuration on Heroku.

This approach assumes a simple key-value structure in your `application.yml`. If your file contains more complex structures or special characters, further adjustments may be needed. As always, be cautious with sensitive data when setting environment variables.