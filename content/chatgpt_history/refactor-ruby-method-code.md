---
title: Refactor Ruby Method Code
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Refactor Ruby Method Code

## ✅ TODOs


## 📌 Summary
with ruby metaprogramming, refactor this code to prevent a method has too many lines rubocop warning:

## 🧠 Full Chat


with ruby metaprogramming, refactor this code to prevent a method has too many lines rubocop warning:
def create_snapshot(offering, off_cat_award)
    OfferingScoreExecutiveSummarySnapshot.create!(
      offering_score_snapshot_id: off_cat_award.offering_score_snapshot.id, plan_to_renew: offering['plan_to_renew'],
      plan_to_renew_def_will_not: offering['plan_to_renew_def_will_not'],
      plan_to_renew_prob_will_not: offering['plan_to_renew_prob_will_not'],
      plan_to_renew_prob_will: offering['plan_to_renew_prob_will'],
      plan_to_renew_def_will: offering['plan_to_renew_def_will'],
      satisfaction_fair_cost_to_value: offering['satisfaction_fair_cost_to_value'],
      satisfaction_fair_cost_to_value_disappoints: offering['satisfaction_fair_cost_to_value_disappoints'],
      satisfaction_fair_cost_to_value_almost_satisfied: offering['satisfaction_fair_cost_to_value_almost_satisfied'],
      satisfaction_fair_cost_to_value_highly_satisfied: offering['satisfaction_fair_cost_to_value_highly_satisfied'],
      satisfaction_fair_cost_to_value_delights: offering['satisfaction_fair_cost_to_value_delights'],
      likeliness_to_recommend: offering['likeliness_to_recommend'], detractors: offering['detractors'],
      neutrals: offering['neutrals'],promoters: offering['promoters']
    )
  end

One way to refactor this code to prevent the "method has too many lines" warning from Rubocop is to extract each attribute assignment into its own method:
```
def create_snapshot(offering, off_cat_award)
  snapshot = OfferingScoreExecutiveSummarySnapshot.new
  snapshot.offering_score_snapshot_id = off_cat_award.offering_score_snapshot.id
  snapshot.plan_to_renew = offering['plan_to_renew']
  snapshot.plan_to_renew_def_will_not = offering['plan_to_renew_def_will_not']
  snapshot.plan_to_renew_prob_will_not = offering['plan_to_renew_prob_will_not']
  snapshot.plan_to_renew_prob_will = offering['plan_to_renew_prob_will']
  snapshot.plan_to_renew_def_will = offering['plan_to_renew_def_will']
  snapshot.satisfaction_fair_cost_to_value = offering['satisfaction_fair_cost_to_value']
  snapshot.satisfaction_fair_cost_to_value_disappoints = offering['satisfaction_fair_cost_to_value_disappoints']
  snapshot.satisfaction_fair_cost_to_value_almost_satisfied = offering['satisfaction_fair_cost_to_value_almost_satisfied']
  snapshot.satisfaction_fair_cost_to_value_highly_satisfied = offering['satisfaction_fair_cost_to_value_highly_satisfied']
  snapshot.satisfaction_fair_cost_to_value_delights = offering['satisfaction_fair_cost_to_value_delights']
  snapshot.likeliness_to_recommend = offering['likeliness_to_recommend']
  snapshot.detractors = offering['detractors']
  snapshot.neutrals = offering['neutrals']
  snapshot.promoters = offering['promoters']
  snapshot.save!
end
```

Alternatively, you can use `attributes` method and pass a hash of attributes to it
```
def create_snapshot(offering, off_cat_award)
  OfferingScoreExecutiveSummarySnapshot.create!(
    offering_score_snapshot_id: off_cat_award.offering_score_snapshot.id, 
    plan_to_renew: offering['plan_to_renew'],
    plan_to_renew_def_will_not: offering['plan_to_renew_def_will_not'],
    plan_to_renew_prob_will_not: offering['plan_to_renew_prob_will_not'],
    plan_to_renew_prob_will: offering['plan_to_renew_prob_will'],
    plan_to_renew_def_will: offering['plan_to_renew_def_will'],
    satisfaction_fair_cost_to_value: offering['satisfaction_fair_cost_to_value'],
    satisfaction_fair_cost_to_value_disappoints

use and array and send

```
def create_snapshot(offering, off_cat_award)
  attributes = [
    :offering_score_snapshot_id, :plan_to_renew, :plan_to_renew_def_will_not, :plan_to_renew_prob_will_not, 
    :plan_to_renew_prob_will, :plan_to_renew_def_will, :satisfaction_fair_cost_to_value, 
    :satisfaction_fair_cost_to_value_disappoints, :satisfaction_fair_cost_to_value_almost_satisfied, 
    :satisfaction_fair_cost_to_value_highly_satisfied, :satisfaction_fair_cost_to_value_delights,
    :likeliness_to_recommend, :detractors, :neutrals, :promoters
  ]
  snapshot_attributes = {}
  attributes.each { |attribute| snapshot_attributes[attribute] = offering[attribute.to_s] }
  snapshot_attributes[:offering_score_snapshot_id] = off_cat_award.offering_score_snapshot.id
  OfferingScoreExecutiveSummarySnapshot.create!(snapshot_attributes)
end
```
This way you can use an array of symbols to represent the attributes and then use `each` loop to iterate over the array to create a hash with keys as the attribute names and values as the corresponding values from the `offering` object. And then pass this hash to the `create!` method. This way you can avoid creating too many lines of code.


improve abc score of this:
  def match_the_offering(off, off_cat_award, executive_summary)
    matched_slug = FuzzyMatch.new(
      executive_summary['results'].pluck('slug')
    ).find(found_with_deleted(off_cat_award).slug)
    return off if matched_by_db(off, off_cat_award)

    # s3_bucket_report_offering_slug_metadata,offering_slug_for_offering_category_award,offering_category_award_id
    # all_offering_slugs_for_s3_bucket_report,actual_offering_name
    log = <<-TEXT
      #{matched_slug.colorize(:light_blue)},#{found_with_deleted.slug.colorize(:green)},#{off_cat_award.id.to_s.colorize(:blue)}
      #{executive_summary['results'].pluck('slug').join(' ').colorize(:yellow)}"
    TEXT
    puts log
    return off if matched_slug
  end

Here's one possible way to improve the ABC score of this method:

1. Extract the logic for finding the matched_slug into a separate method, to make the main method more readable.
2. Rename the method to be more descriptive of its purpose
3. Use meaningful variable and method names to make the code more self-explanatory
4. Use guard clauses to check for the matched_slug before performing the rest of the logic.
5. Extract the logic for logging the matched slug, into a separate method.

```
def match_offering_to_executive_summary(off, off_cat_award, executive_summary)
  matched_slug = find_matched_slug(off_cat_award, executive_summary)
  return off if matched_by_db?(off, off_cat_award)
  return off if matched_slug.nil?
  
  log_match_info(matched_slug, off_cat_award, executive_summary)
  off
end

def find_matched_slug(off_cat_award, executive_summary)
  FuzzyMatch.new(executive_summary['results'].pluck('slug')).find(found_with_deleted(off_cat_award).slug)
end

def matched_by_db?(off, off_cat_award)
  # logic for checking if the offering has been matched in the db
end

def log_match_info(matched_slug, off_cat_award, executive_summary)
  log = <<-TEXT
    #{matched_slug.colorize(:light_blue)},#{found_with_deleted.slug.colorize(:green)},#{off_cat_award.id.to_s.colorize(:blue)}
    #{executive_summary['results'].pluck('slug').join(' ').colorize(:yellow)}"
  TEXT
  puts log
end
```

This way, it will be more clear what the purpose of the method is, and it will also be more readable.


Have a docker container that runs with:
docker-compose run test rspec

How am I supposed to bundle install within that service?

You can bundle install within the service by adding a command to run bundle install to the service's definition in the `docker-compose.yml` file. Here is an example of how you can do this:

```
services:
  test:
    build:
      context: .
      args:
        - BUNDLE_WITHOUT=development:test
    command: bundle install && rspec
```

This tells Docker to install the gems specified in the Gemfile when building the test service, and then run the command `rspec` after the gems are installed.

Alternatively, you can use `Dockerfile` to add bundle install as a part of the build process:
```
FROM ruby:2.7
# install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# set working directory
RUN mkdir /myapp
WORKDIR /myapp
# add `/myapp/vendor/bundle` to the system path
ENV PATH /myapp/bin:$PATH
# copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
# copy the main application
COPY . .
```
This way, when you build the image, it will run bundle install as a step and will have all the gems installed.

And then you can run the container using 
```
docker-compose up --build
```
This will rebuild the container and run the tests


How can I do it only with a docker bash command

You can install the gems within the container by running `bundle install` command in the container's bash. Here is an example of how you can do this:

1. Start the container by running `docker-compose run test bash`
2. Once inside the container's bash, navigate to the project's directory.
3. Run the command `bundle install`
4. Once the gems are installed, you can run your tests using `rspec` command

Here is an example of the commands you would run:
```
docker-compose run test bash
cd /path/to/project
bundle install
rspec
```

Another option is to install the gems when the container is created by passing the command in the `docker run` command:
```
docker run -it --rm -v "$PWD":/app -w /app my_image bash -c "bundle install && rspec"
```
This will install the gems and run rspec in the same command, this way you don't have to install them again when you need to run the test.

Note that in this case, you have to use the `-it` option to run the command in interactive mode and `-w` option to set the working directory, and `-v` option to mount the host's current directory to container's directory.


Got the following error when I try:
How can I bundle install so the command "docker-compose up server" works.

The error you are encountering is likely due to the fact that the gems are not being installed in the correct location within the container.

One solution is to include a `bundle install` command in the `command` field of the `server` service in your `docker-compose.yml` file. This way, when you run `docker-compose up server`, the gems will be installed before the server starts.

Here is an example of what your `docker-compose.yml` file might look like:

```
services:
  server:
    build: .
    command: bundle install && rails s
```

Alternatively, you can use `Dockerfile` to include bundle install as a part of the build process as I explained before, this way the gems will be installed when the image is built and you can use `docker-compose up` command without any issues.

Another option is to use `docker-compose run` command to install the gems and run the server in the same command:
```
docker-compose run --rm server bash -c "bundle install && rails s"
```
This command will install the gems and start the server in the same command, so you don't have to install them again when you need to run the server.

You could also use a `Dockerfile` and include a `bundle install` command, and then build the image including the gems, this way, you don't have to run the command every time you need to start the server.


This is the error I got:
smart_ac_app  | /usr/local/lib/ruby/3.0.0/bundler/definition.rb:480:in `materialize': Could not find pry-byebug-3.10.1, pry-0.14.2, coderay-1.1.3 in any of the sources (Bundler::GemNotFound)
This is the docker-compose.yml config for "server"
  server:
    <<: *dev
    command: ["bundle", "exec", "./bin/validate-migrated && rails server -b 0.0.0.0"]
    ports:
      - "3000:3000"
    networks:
      - sac-exposed
      - sac-backend

The error message `Could not find pry-byebug-3.10.1, pry-0.14.2, coderay-1.1.3 in any of the sources` suggests that the gems specified in the error message are not present in the `Gemfile.lock` file, and therefore they are not being installed when you run `bundle install`.

You could try updating your `Gemfile` to include the missing gems, and then run `bundle install` again. Make sure that you have the correct version of the gems specified in the `Gemfile` and that they are compatible with your Ruby version.

Another solution is to use the `bundle install --deployment` command when installing the gems. This flag will ensure that the gems are installed in the same version and location as specified in the `Gemfile.lock`.
```
docker-compose run --rm server bash -c "bundle install --deployment && ./bin/validate-migrated && rails s -b 0.0.0.0"
```

You could also use the `bundle update` command to update the gems and install the missing gems. 
```
docker-compose run --rm server bash -c "bundle update && ./bin/validate-migrated && rails s -b 0.0.0.0"
```

Make sure that you run the `

continue

bundle install` or `bundle update` command after you have made changes to the `Gemfile` to ensure that the gems specified in the `Gemfile` are installed or updated.

Another possibility is that the missing gems are in the development or test group of your `Gemfile`, and that you are running `bundle install` with the `--without development test` flag. Try removing this flag to install the gems in these groups as well.

Lastly, it is possible that the gems are not available in the default gem source(rubygems.org) . You could try adding other gem sources like `https://gems.github.com` or other private gem server in your `Gemfile` and then run `bundle install`

```
source 'https://gems.github.com'
source 'https://my_private_gem_server'
```

Try these solutions, and if the problem persists, please share the error message, the output of `gem env` command and the `Gemfile` and `Gemfile.lock` files, so I can help you troubleshoot further.


Explain SOLID principles with ruby code. Provide the most understandable example.\

The SOLID principles are a set of five design principles that help in writing clean, maintainable, and extensible code. Here's an explanation of each principle along with a simple example in Ruby:

1. Single Responsibility Principle (SRP): A class should have only one reason to change.

Example:
```ruby
class Order
  def initialize(customer, items)
    @customer = customer
    @items = items
  end

  def calculate_total
    # calculate the total cost of the items
  end

  def generate_invoice
    # generate an invoice for the order
  end

  def send_confirmation_email
    # send a confirmation email to the customer
  end
end
```
In the above example, the `Order` class has multiple responsibilities: calculating the total, generating an invoice, and sending a confirmation email. To adhere to SRP, it would be better to separate these responsibilities into different classes, such as `OrderCalculator`, `InvoiceGenerator`, and `EmailSender`.

2. Open-Closed Principle (OCP): Software entities should be open for extension but closed for modification.

Example:
```ruby
class Shape
  def area
    raise NotImplementedError, "Subclasses must implement the area method"
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius**2
  end
end

class Rectangle < Shape
  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end
```
In the above example, the `Shape` class defines an interface for calculating the area. The `Circle` and `Rectangle` classes inherit from `Shape` and implement their own versions of the `area` method. If a new shape, such as a `Triangle`, needs to be added, it can inherit from `Shape` and implement its own `area` method without modifying the existing code.

3. Liskov Substitution Principle (LSP): Subtypes must be substitutable for their base types.

Example:
```ruby
class Vehicle
  def start_engine
    # start the engine
  end

  def accelerate
    # accelerate the vehicle
  end
end

class Car < Vehicle
  def start_engine
    # start the car's engine
  end

  def accelerate
    # accelerate the car
  end
end

class Bicycle < Vehicle
  def start_engine
    raise NotImplementedError, "Bicycles don't have engines"
  end

  def accelerate
    # pedal faster
  end
end
```
In the above example, the `Car` and `Bicycle` classes inherit from `Vehicle`. The `start_engine` and `accelerate` methods are implemented differently based on the type of vehicle, but they can be used interchangeably because they adhere to the same interface defined by the `Vehicle` base class.

4. Interface Segregation Principle (ISP): Clients should not be forced to depend on interfaces they do not use.

Example:
```ruby
# Bad example
class Vehicle
  def start_engine
    # start the engine
  end

  def accelerate
    # accelerate the vehicle
  end

  def play_music
    raise NotImplementedError, "This method is not applicable for all vehicles"
  end
end

# Good example
class Vehicle
  def start_engine
    # start the engine
  end

  def accelerate
    # accelerate the vehicle
  end
end

class MusicPlayer
  def play_music
    # play music
  end
end


Please continue

In the above example, the bad example violates the ISP because the `Vehicle` class has a `play_music` method that is not applicable to all vehicles. Clients that depend on the `Vehicle` class will be forced to depend on this method even if they don't need it. 

The good example separates the responsibilities by moving the `play_music` method to a separate `MusicPlayer` class. Now, clients can depend on the `Vehicle` class for its engine and acceleration functionality, and they can depend on the `MusicPlayer` class for playing music, without being forced to depend on methods they don't need.

5. Dependency Inversion Principle (DIP): High-level modules should not depend on low-level modules. Both should depend on abstractions.

Example:
```ruby
# Bad example
class ReportGenerator
  def initialize(data_source)
    @data_source = data_source
  end

  def generate_report
    data = @data_source.fetch_data
    # generate the report
  end
end

class Database
  def fetch_data
    # fetch data from the database
  end
end

# Good example
class ReportGenerator
  def initialize(data_source)
    @data_source = data_source
  end

  def generate_report
    data = @data_source.fetch_data
    # generate the report
  end
end

class DataSource
  def fetch_data
    raise NotImplementedError, "Subclasses must implement the fetch_data method"
  end
end

class Database < DataSource
  def fetch_data
    # fetch data from the database
  end
end
```
In the bad example, the `ReportGenerator` directly depends on the `Database` class, violating the DIP. In the good example, the high-level `ReportGenerator` depends on the abstraction `DataSource`, and the `Database` class implements the `DataSource` interface. This way, the `ReportGenerator` can work with any implementation of `DataSource`, promoting flexibility and decoupling.

By following these SOLID principles, you can write code that is easier to understand, maintain, and extend. Each principle focuses on a specific aspect of good software design and can help you create more robust and scalable applications.