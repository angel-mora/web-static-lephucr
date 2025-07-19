---
title: Deploy Ruby 2.6.5 on Heroku
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Deploy Ruby 2.6.5 on Heroku

## ✅ TODOs


## 📌 Summary
heroku cli to push ruby 2.6.5

## 🧠 Full Chat


heroku cli to push ruby 2.6.5

If you want to deploy a Ruby application with a specific Ruby version (in this case, 2.6.5) to Heroku using the Heroku CLI, follow these steps:

1. **Install Heroku CLI**: If you haven't already, install the Heroku CLI. You can find instructions on the [official Heroku website](https://devcenter.heroku.com/articles/heroku-cli).

2. **Specify Ruby Version**: In your Ruby application's directory, make sure you have a `Gemfile`. In this `Gemfile`, specify the Ruby version you want:

    ```ruby
    ruby '2.6.5'
    ```

3. **Initialize a Git Repository**: If your project isn't already a Git repository, initialize one:

    ```bash
    git init
    git add .
    git commit -m "Initial commit"
    ```

4. **Login to Heroku**:

    ```bash
    heroku login
    ```

5. **Create a Heroku App**: If you haven't created a Heroku app for this project yet:

    ```bash
    heroku create [optional-app-name]
    ```

    If you already have an app, you can link the current repository to that app:

    ```bash
    heroku git:remote -a your-existing-app-name
    ```

6. **Push to Heroku**:

    ```bash
    git push heroku master
    ```

7. **Migrate Database** (if applicable): If your Ruby application uses a database, you might need to run migrations:

    ```bash
    heroku run rake db:migrate
    ```

8. **Open Your App**:

    ```bash
    heroku open
    ```

This will open your app in a web browser. Your Ruby application running Ruby 2.6.5 should now be live on Heroku!

Remember, Heroku uses the `Procfile` to determine how to run your application. If you're deploying a Rails app, for instance, and you don't have a `Procfile`, Heroku will make a guess based on the contents of your app. However, it's a good practice to specify a `Procfile` for clarity. For a typical Rails app, the `Procfile` might look like:

```
web: bundle exec puma -C config/puma.rb
```

Adjust as necessary for your specific application and its requirements.

is there a website where I can find railsgoat deployed? I need it for a sample test where I'll run OWASP zap against the remote url

RailsGoat is a vulnerable version of the Ruby on Rails Framework, used for training and educational purposes. It's a project maintained by OWASP itself. However, as of my last update in January 2022, there isn't a permanently deployed public instance of RailsGoat. This is likely due to the inherent security risks of hosting intentionally vulnerable applications on the public internet.

If you need to run OWASP ZAP or any other security tool against RailsGoat, you typically have to set it up locally or deploy it to a controlled environment where you have permissions to perform such tests.

Here's a brief guide on how you can set up RailsGoat locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/OWASP/railsgoat.git
   ```

2. **Navigate to the Directory**:
   ```bash
   cd railsgoat
   ```

3. **Bundle Install**:
   ```bash
   bundle install
   ```

4. **Setup the Database**:
   ```bash
   rake db:setup
   ```

5. **Start the Server**:
   ```bash
   rails server
   ```

Now, you can access RailsGoat at `http://localhost:3000`.

If you want to deploy it to a remote server, you can use platforms like Heroku, AWS, or DigitalOcean. However, be very careful and ensure that the deployment is isolated and not accessible to the wider public to prevent misuse.

Once you have it deployed or running locally, you can point OWASP ZAP to the appropriate URL and begin your testing.