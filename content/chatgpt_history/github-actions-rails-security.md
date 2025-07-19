---
title: GitHub Actions Rails Security
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# GitHub Actions Rails Security

## ✅ TODOs
- [ ] so.
- [ ] so. Avoid scanning production environments or third-party sites without explicit permission.

## 📌 Summary
Github actions yml to test rails app and add brakeman and owasp zap scanners. Creates issues if SAST or DAST vulns found

## 🧠 Full Chat


Github actions yml to test rails app and add brakeman and owasp zap scanners. Creates issues if SAST or DAST vulns found

To set up a GitHub Actions workflow that tests a Rails application and uses both Brakeman and OWASP ZAP scanners, you can follow the steps below. This example also demonstrates how to create GitHub issues if vulnerabilities are found:

1. Create a new file in your repository at `.github/workflows/rails_test_and_scan.yml`.

2. Add the following content to the file:

```yaml
name: Rails Test and Scan

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    services:
      postgres:
        image: postgres:11
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        ports:
          - 5432:5432

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: 3.0

    - name: Install dependencies
      run: |
        sudo apt-get install -y libpq-dev
        gem install bundler
        bundle install --jobs 4 --retry 3

    - name: Set up database
      run: |
        cp config/database.yml.ci config/database.yml
        bundle exec rails db:create
        bundle exec rails db:schema:load

    - name: Run tests
      run: bundle exec rails test

  brakeman:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Brakeman Scan
      run: |
        gem install brakeman
        brakeman -o brakeman-output.json
    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: Brakeman Vulnerabilities Found
        body: |
          Brakeman vulnerabilities were found. Please review the `brakeman-output.json` file for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  owasp-zap:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: OWASP ZAP Scan
      uses: zaproxy/action-full-scan@v1
      with:
        target: 'https://your-app-url.com'
    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: OWASP ZAP Vulnerabilities Found
        body: |
          OWASP ZAP vulnerabilities were found. Please review the scan results for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

3. Adjust the configuration to your needs:

   - Replace `'https://your-app-url.com'` with the URL of your deployed application for the OWASP ZAP scan.
   - If you have a different database setup, adjust the `services` section and the database setup commands accordingly.
   - The example assumes you have a `config/database.yml.ci` for your CI environment. Adjust this if your setup is different.

4. Commit and push the file to your repository.

5. GitHub Actions will now run this workflow on every push and pull request to the `main` branch. If vulnerabilities are found by Brakeman or OWASP ZAP, issues will be created in your repository.

Note: This is a basic setup and might need adjustments based on your specific needs and environment. Always review and test the workflow before relying on it for security scans.

can it have the container as a target? Having that with: target: 'https://url.com' means I'd need to deploy a staging server?

Yes, you can target a container as part of your CI/CD process. This is especially useful if you don't want to deploy to a staging server just for scanning purposes. Here's how you can adjust the workflow to run your Rails app in a container and then scan it with OWASP ZAP:

1. **Run Rails in Docker**: Before the OWASP ZAP step, add a job to run your Rails app in a Docker container. This assumes you have a `Dockerfile` in your repository that can run your Rails app.

2. **Use Service Containers in GitHub Actions**: GitHub Actions allows you to run service containers, which can be used to run your Rails app and any required databases.

3. **Target the Service Container**: OWASP ZAP can then target the service container's address.

Here's a modified version of the previous workflow:

```yaml
# ... [previous content]

jobs:
  # ... [test and brakeman jobs]

  rails-in-docker:
    runs-on: ubuntu-latest
    services:
      rails:
        image: docker://YOUR_DOCKER_IMAGE_NAME:latest
        ports:
          - 3000:3000
      # Add other services like databases if needed

    steps:
    - name: Wait for Rails to start
      run: |
        while ! nc -z localhost 3000; do
          sleep 1
        done

  owasp-zap:
    needs: [test, brakeman, rails-in-docker]
    runs-on: ubuntu-latest

    steps:
    - name: OWASP ZAP Scan
      uses: zaproxy/action-full-scan@v1
      with:
        target: 'http://localhost:3000'
    # ... [rest of the steps]
```

Replace `YOUR_DOCKER_IMAGE_NAME` with the name of your Docker image. If you haven't built and pushed your Docker image yet, you'll need to add steps to do so.

This setup will:

1. Run your Rails app in a Docker container.
2. Wait for the Rails app to start.
3. Scan the running Rails app with OWASP ZAP.

Remember, this is a basic setup and might need adjustments based on your specific needs and environment. Always review and test the workflow before relying on it for security scans.

Can I add snallygaster py as an action?

Certainly! `snallygaster` is a tool used to scan websites for potential security vulnerabilities. If you want to integrate it into your GitHub Actions workflow, you can do so by running it in a Python environment.

Here's how you can add `snallygaster` to your GitHub Actions workflow:

1. **Install Python**: Ensure you have a step that sets up a Python environment.

2. **Install and Run `snallygaster`**: Use `pip` to install `snallygaster` and then run it against your target.

Here's a sample job that you can add to your GitHub Actions workflow:

```yaml
snallygaster-scan:
  runs-on: ubuntu-latest

  steps:
  - name: Set up Python
    uses: actions/setup-python@v2
    with:
      python-version: 3.x

  - name: Install snallygaster
    run: |
      python -m pip install --upgrade pip
      pip install snallygaster

  - name: Run snallygaster
    run: snallygaster http://localhost:3000
    # Replace the URL with the target you want to scan
```

Add this job after your application is up and running (e.g., after the `rails-in-docker` job if you're following the previous examples).

Note: Always ensure that you're scanning environments where you have permission to do so. Avoid scanning production environments or third-party sites without explicit permission.

what other devsecops filters I can add to my yml?

DevSecOps integrates security practices into the DevOps process. When setting up a CI/CD pipeline with GitHub Actions, there are several tools and practices you can integrate to enhance the security of your application. Here are some popular DevSecOps tools and practices you can consider adding to your GitHub Actions workflow:

1. **Static Application Security Testing (SAST)**:
    - **Brakeman**: As you've already added, it's specific to Ruby on Rails applications.
    - **Bandit**: For Python applications.
    - **ESLint with security plugin**: For JavaScript and TypeScript.
    - **Checkmarx**: A commercial tool that supports multiple languages.
    - **SonarQube**: Offers static code analysis for multiple languages.

2. **Dynamic Application Security Testing (DAST)**:
    - **OWASP ZAP**: You've already added this. It's a popular open-source tool.
    - **Burp Suite**: A commercial tool with a community edition available.
    - **Arachni**: An open-source web application security scanner.

3. **Software Composition Analysis (SCA)**:
    - **Dependabot**: Integrated into GitHub, it checks for outdated or vulnerable dependencies.
    - **Snyk**: Scans dependencies for known vulnerabilities.
    - **WhiteSource**: Another tool for checking dependencies.

4. **Infrastructure as Code (IaC) Scanning**:
    - **Checkov**: Scans infrastructure as code for security misconfigurations.
    - **Terraform Lint (tflint)**: For Terraform configurations.
    - **KubeScore**: Scans Kubernetes configurations for security issues.

5. **Container Security**:
    - **Trivy**: Scans container images for vulnerabilities.
    - **Clair**: Another container vulnerability scanner.
    - **Anchore**: Analyzes containers to give a detailed listing of all components on a granular level.

6. **Secrets Detection**:
    - **Gitleaks**: Scans repositories for secrets.
    - **TruffleHog**: Searches through git repositories for secrets.
    - **AWS Secrets Scanner**: If you're using AWS, this tool can help detect secrets.

7. **Runtime Protection**:
    - **Falco**: Open-source runtime security for Kubernetes.
    - **Sysdig Secure**: Commercial runtime security tool.

8. **Compliance as Code**:
    - **InSpec**: Open-source framework for testing and auditing applications and infrastructure.
    - **Chef Automate**: Commercial compliance as code tool.

9. **Miscellaneous**:
    - **SSL/TLS Scanners**: Tools like `testssl.sh` or `SSLyze` can be used to check the SSL/TLS configuration of your application.
    - **Rate Limit Testing**: Ensure your application can handle DDoS attacks or brute force login attempts.

When adding these tools, always ensure they fit your application's tech stack and your organization's security requirements. Also, remember that no tool can catch every vulnerability, so a combination of automated tools, manual code reviews, and penetration testing is ideal for a comprehensive security posture.

1. burp and arachni are replacements of zap?
2. linters, rubocop with the most refined rules for my yml as well

1. **Burp Suite, Arachni, and OWASP ZAP**:
   - Yes, Burp Suite, Arachni, and OWASP ZAP are all tools that can be used for Dynamic Application Security Testing (DAST). They can identify vulnerabilities in running web applications. While they have overlapping features, they also have unique capabilities:
     - **OWASP ZAP**: An open-source tool with a wide range of features and an active community. It's suitable for both beginners and experienced users.
     - **Burp Suite**: A commercial tool with a free community edition. It's widely used by professional penetration testers and has a rich set of features, especially in the Pro version.
     - **Arachni**: An open-source tool that's modular and framework-agnostic. It's known for its speed and accuracy.
   - Depending on your needs and budget, you might choose one over the others. However, they can be seen as alternatives to each other in many contexts.

2. **Linters and RuboCop**:
   - Linters are tools that analyze source code to flag programming errors, bugs, stylistic errors, and suspicious constructs. For Ruby, RuboCop is a popular linter.
   - If you want to integrate RuboCop with the most refined rules into your GitHub Actions workflow, here's how you can do it:

```yaml
jobs:
  rubocop:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: 3.0

    - name: Install dependencies
      run: |
        gem install bundler
        bundle install --jobs 4 --retry 3

    - name: Run RuboCop
      run: bundle exec rubocop
```

   - For the most refined rules, you'll want to have a `.rubocop.yml` configuration file in your repository. This file will allow you to enable/disable specific cops (rules) and set their configurations. The RuboCop community provides a set of recommended rules, but you might also want to look into community-driven configurations like [rubocop-rails](https://github.com/rubocop/rubocop-rails) or [rubocop-rspec](https://github.com/rubocop/rubocop-rspec) if you're using Rails or RSpec, respectively.
   - Remember, the goal of a linter is not just to enforce style but to catch potential bugs and maintain consistency across the codebase. Adjust the rules in `.rubocop.yml` to fit your team's preferences and the project's needs.

do I need to populate github.repository?

In the context of GitHub Actions, `github.repository` is a default environment variable that provides the `owner/repo` format string for the current repository. You don't need to manually populate it; GitHub Actions does this automatically for each run.

For example, if your repository is located at `https://github.com/username/my-repo`, then `github.repository` would be set to `username/my-repo`.

You can use this variable in your workflow files. For instance, when creating issues or interacting with the GitHub API, you might reference `${{ github.repository }}` to dynamically use the current repository's `owner/repo` string.

So, in short, you don't need to manually set or populate `github.repository` – it's automatically available for you to use in your workflow.

do I need the GITHUB_TOKEN? Where can I get it from?

Yes, if you're interacting with the GitHub API or using certain GitHub Actions that require authentication, you'll often need the `GITHUB_TOKEN`.

The `GITHUB_TOKEN` is a special token that GitHub provides automatically for workflows running in your repository. It's used to authenticate and authorize actions within the current repository. It has a scope limited to the repository where the workflow is running, ensuring that potential damage or misuse is contained.

Here's how you can use it:

1. In your workflow YAML file, you can access the `GITHUB_TOKEN` via the `secrets` context:

```yaml
jobs:
  some-job:
    runs-on: ubuntu-latest
    steps:
    - name: Some step that needs the token
      run: some-command
      env:
        MY_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

2. In the above example, the `GITHUB_TOKEN` is passed as an environment variable named `MY_TOKEN` to the step. You can then use this environment variable in your scripts or commands.

You don't need to manually generate or set the `GITHUB_TOKEN`. GitHub automatically creates and manages this token for you. Every time a workflow runs, a new token is generated, and it's valid only for the duration of that workflow run.

However, be cautious:

- **Do not print or expose the `GITHUB_TOKEN`** in your logs or outputs. While GitHub automatically redacts secrets in logs, it's a good practice not to unnecessarily echo or print them.
  
- **Limit token permissions**: By default, the `GITHUB_TOKEN` has permissions that allow many repository-related actions. If you need a token with more limited permissions, or if you need to interact with other repositories or broader scopes, you might consider creating a personal access token (PAT) and adding it as a secret to your repository. Remember, though, that a PAT has broader permissions, so handle it with care.

In summary, the `GITHUB_TOKEN` is a convenient and secure way to authenticate actions within the current repository, and it's automatically available in your GitHub Actions workflows.

So for this file, please add docker instead of the remote url
name: Rails Test and Scan

on:
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    services:
      postgres:
        image: postgres:11
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        ports:
          - 5432:5432

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: 3.0

    - name: Install dependencies
      run: |
        sudo apt-get install -y libpq-dev
        gem install bundler
        bundle install --jobs 4 --retry 3

    - name: Set up database
      run: |
        cp config/database.yml.ci config/database.yml
        bundle exec rails db:create
        bundle exec rails db:schema:load

    - name: Run tests
      run: bundle exec rails test

  brakeman:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Brakeman Scan
      run: |
        gem install brakeman
        brakeman -o brakeman-output.json
    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: Brakeman Vulnerabilities Found
        body: |
          Brakeman vulnerabilities were found. Please review the `brakeman-output.json` file for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  owasp-zap:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: OWASP ZAP Scan
      uses: zaproxy/action-full-scan@v1
      with:
        target: 'https://your-app-url.com'
    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: OWASP ZAP Vulnerabilities Found
        body: |
          OWASP ZAP vulnerabilities were found. Please review the scan results for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

To run your Rails app in a Docker container and then scan it with OWASP ZAP within the GitHub Actions workflow, you'll need to make several modifications. Here's a revised version of your workflow:

1. **Build and run your Rails app in a Docker container**.
2. **Scan the running container with OWASP ZAP**.

```yaml
name: Rails Test and Scan

on:
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    services:
      postgres:
        image: postgres:11
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        ports:
          - 5432:5432

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: 3.0

    - name: Install dependencies
      run: |
        sudo apt-get install -y libpq-dev
        gem install bundler
        bundle install --jobs 4 --retry 3

    - name: Set up database
      run: |
        cp config/database.yml.ci config/database.yml
        bundle exec rails db:create
        bundle exec rails db:schema:load

    - name: Run tests
      run: bundle exec rails test

  build-and-run-docker:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Build and run Docker container
      run: |
        docker build -t my-rails-app .
        docker run -d -p 3000:3000 my-rails-app

    - name: Wait for Rails to start
      run: |
        sleep 30  # Adjust this as needed

  brakeman:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Brakeman Scan
      run: |
        gem install brakeman
        brakeman -o brakeman-output.json

    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: Brakeman Vulnerabilities Found
        body: |
          Brakeman vulnerabilities were found. Please review the `brakeman-output.json` file for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  owasp-zap:
    needs: [test, build-and-run-docker]
    runs-on: ubuntu-latest

    steps:
    - name: OWASP ZAP Scan
      uses: zaproxy/action-full-scan@v1
      with:
        target: 'http://localhost:3000'

    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: OWASP ZAP Vulnerabilities Found
        body: |
          OWASP ZAP vulnerabilities were found. Please review the scan results for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

This workflow does the following:

1. Tests the Rails app.
2. If tests pass, it builds and runs the Rails app in a Docker container.
3. Scans the running Rails app with Brakeman.
4. Scans the running Rails app with OWASP ZAP.

Note: This assumes you have a `Dockerfile` in your repository that sets up and runs your Rails app. Adjust the Docker commands as needed based on your setup.

my template is not being triggered
name: Rails Test and Scan

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    services:
      postgres:
        image: postgres:11
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        ports:
          - 5432:5432

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: 3.0

    - name: Install dependencies
      run: |
        sudo apt-get install -y libpq-dev
        gem install bundler
        bundle install --jobs 4 --retry 3

    - name: Set up database
      run: |
        bundle exec rails db:create
        bundle exec rails db:schema:load

    - name: Run tests
      run: bundle exec rails test

  build-and-run-docker:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Build and run Docker container
      run: |
        docker build -t my-rails-app .
        docker run -d -p 3000:3000 my-rails-app

    - name: Wait for Rails to start
      run: |
        sleep 30  # Adjust this as needed

  brakeman:
    needs: test
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Brakeman Scan
      run: |
        gem install brakeman
        brakeman -o brakeman-output.json

    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: Brakeman Vulnerabilities Found
        body: |
          Brakeman vulnerabilities were found. Please review the `brakeman-output.json` file for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  owasp-zap:
    needs: [test, build-and-run-docker]
    runs-on: ubuntu-latest

    steps:
    - name: OWASP ZAP Scan
      uses: zaproxy/action-full-scan@v0.7.0
      with:
        target: 'http://localhost:3000'

    - name: Create Issue if Vulnerabilities Found
      if: always()
      uses: octokit/request-action@v2.x
      with:
        route: POST /repos/${{ github.repository }}/issues
        title: OWASP ZAP Vulnerabilities Found
        body: |
          OWASP ZAP vulnerabilities were found. Please review the scan results for details.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}



If your GitHub Actions workflow is not being triggered, here are some common troubleshooting steps to consider:

1. **File Location**: Ensure that the workflow file is located in the `.github/workflows/` directory of your repository.

2. **Branch**: If you're pushing to a branch other than `main`, the workflow won't be triggered based on your current configuration. Ensure you're pushing to the `main` branch or adjust the workflow file to listen to the correct branch.

3. **Syntax**: Ensure there's no syntax error in your YAML file. Even a minor mistake can prevent the workflow from being triggered. You can use online YAML validators to check the syntax.

4. **GitHub Actions Availability**: Ensure that GitHub Actions is available and not disabled for your repository. If you're using a private repository, ensure you haven't exceeded your GitHub Actions minutes.

5. **Check GitHub Actions Tab**: Go to the "Actions" tab of your repository. It should list all the workflows. If your workflow is listed there, click on it to see the runs. If there was an error, it should provide details.

6. **Event Triggers**: Ensure that the event that should trigger the workflow is actually happening. For instance, if you've set it to run on `push`, then you need to push a commit to the specified branch.

7. **Logs**: If the workflow is being triggered but there's an error in one of the jobs or steps, the "Actions" tab in your repository will show logs that can help diagnose the issue.

8. **Repository Settings**: Go to the repository settings and ensure that workflows aren't disabled in the "Actions" section.

9. **Push a New Commit**: Sometimes, pushing a new commit or making a minor change to the workflow file can trigger the workflow.

10. **Check Repository Permissions**: Ensure that you have the necessary permissions to set up and run workflows in the repository.

11. **Docker Daemon**: Your workflow is using Docker. Ensure that the runner has access to the Docker daemon. The default GitHub runner does, but if you're using a self-hosted runner, you need to ensure Docker is installed and accessible.

If you've checked all the above and still face issues, consider creating a minimal workflow with just a simple job to print a message. This can help you determine if the issue is with GitHub Actions in general or with the specific workflow you've defined.

Lastly, GitHub's community forums and support can be valuable resources if you're facing persistent issues.