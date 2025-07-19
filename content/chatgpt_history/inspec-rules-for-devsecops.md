---
title: InSpec Rules for DevSecOps
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# InSpec Rules for DevSecOps

## ✅ TODOs
- [ ] wnload policies for actual compliance requirements, using chef inspect ruby gem?

## 📌 Summary
Is there a website to download policies for actual compliance requirements, using chef inspect ruby gem?

## 🧠 Full Chat


Is there a website to download policies for actual compliance requirements, using chef inspect ruby gem?

As of my last training data in January 2022, Chef InSpec is a popular open-source framework for testing and auditing infrastructure and applications. It can be used to ensure compliance with various policies.

However, there isn't a single central website where you can download policies (often referred to as "profiles" in the context of InSpec) for every compliance requirement out there. Instead, the Chef community and other users often create and share these profiles in various repositories.

A good place to start looking for InSpec profiles is the Chef Supermarket, which is Chef's marketplace for shared cookbooks, InSpec profiles, and other resources. You can find it at:
https://supermarket.chef.io/

There are also profiles available on GitHub. Users often share profiles they've created on their own repositories or as contributions to larger community projects.

Remember to always review and possibly customize any downloaded profiles to ensure they meet your specific needs and environment, as compliance requirements can vary based on the exact context and interpretation of rules.

If you are dealing with specific compliance standards, it might also be worth checking if there are specialized vendors or community efforts focusing on those standards that provide tailored InSpec profiles.

Those InSpec rules are not published about Privacy Act in USA for financial institutions or ISO rules set as infrastructure

If you're looking for InSpec profiles related to specific compliance frameworks like the Privacy Act in the USA for financial institutions or ISO standards for infrastructure, and you can't find them in the standard repositories like Chef Supermarket or GitHub, then you might need to consider a few alternative routes:

1. **Custom Development**: Sometimes, organizations have to create their own InSpec profiles from scratch to meet specific compliance needs. This requires a good understanding of both the compliance requirements and InSpec itself. Developing custom profiles allows for tailoring the checks to your organization's specific environment and requirements.

2. **Vendors**: Some vendors or consultants might offer specialized compliance profiles as part of their services, especially for more niche or complex standards. For instance, companies that specialize in compliance and auditing might have developed their own InSpec profiles that they use as part of their assessments.

3. **Community & Forums**: Engage with the Chef community or related forums. Someone might be working on what you're looking for or could point you in the right direction. The Chef community Slack or forums are good places to ask.

4. **ISO Standards**: ISO standards, especially those related to IT (like ISO/IEC 27001), have a broad scope, and creating a comprehensive InSpec profile might be a substantial effort. However, you can prioritize based on your organization's most significant risks or concerns.

5. **Other Compliance Tools**: While InSpec is powerful, you might also want to consider other tools or platforms that might have broader community contributions or vendor support for specific compliance frameworks. Tools like CIS-CAT, Nessus, or even cloud-native tools like AWS Config might have rule sets that are more aligned with what you're seeking.

Ultimately, while there are many resources available, ensuring compliance, especially in specific niches, can require a combination of community resources, vendor tools, and custom development.

Write a sample InSpec for GDPR in infrastructure

Certainly! Below is a simple example of an InSpec profile for a very basic GDPR-related check in infrastructure. This sample will check if a Linux system has logging enabled for auditing purposes, as logging can be an essential component of GDPR compliance (for tracking data access and modifications).

```ruby
# controls/gdpr_logging.rb

control 'gdpr-01' do
  impact 1.0
  title 'Ensure auditing is enabled'
  desc 'For GDPR compliance, it is essential to ensure that system auditing is enabled to track data access and modifications.'

  describe package('auditd') do
    it { should be_installed }
  end

  describe service('auditd') do
    it { should be_enabled }
    it { should be_running }
  end
end
```

The above InSpec control does the following:

1. Checks if the `auditd` package is installed.
2. Checks if the `auditd` service is enabled and running.

This is a basic example, and a full GDPR profile would be much more extensive, checking database configurations, user access controls, encryption at rest and in transit, etc.

Remember, GDPR is broad, and its requirements are not strictly technical. Many requirements depend on legal interpretation, organizational processes, and other non-technical factors. This is a simple technical check and should be seen as a tiny piece of a comprehensive GDPR compliance strategy.

Write rules described in CompTIA Security+

CompTIA Security+ is a certification that covers a wide range of foundational knowledge in security principles, practices, and technologies. The certification exam addresses various domains, including threats, attacks, technologies and tools, architecture and design, identity and access management, risk management, cryptography, and more.

However, it's important to note that the CompTIA Security+ curriculum is not a set of specific "rules" or configurations like you might find in a compliance standard. Instead, it's a set of general knowledge objectives and principles.

That being said, I can create a sample InSpec profile based on some general principles from the Security+ curriculum. For instance, one of the objectives might touch on secure system design or ensuring systems are patched.

Here's a basic example of an InSpec control that ensures the system has the latest updates:

```ruby
# controls/secure_system.rb

control 'securityplus-01' do
  impact 1.0
  title 'Ensure system is updated'
  desc 'For security best practices, ensure the system has the latest security patches installed.'

  # Check if there are any available updates. This example is for an Ubuntu system using apt.
  describe command('apt list --upgradable') do
    its('stdout') { should eq '' }
  end
end
```

This control checks if there are any upgradable packages on an Ubuntu system. It would return a failure if there are packages that need to be upgraded.

Again, remember that this is a simplistic representation. In a real-world scenario, you'd have a more comprehensive set of controls covering various aspects of system and application security. Moreover, not every concept in Security+ will directly translate to an InSpec rule since many are theoretical or process-oriented rather than specific technical configurations.

Rules for devsecops of a rails app in aws running the simplest infrastructure, running rails 7, Postgres and hotwire. Has WAF enabled and scalability thresholds (to protect against DDoS or these sort of things)

For a Rails application running on AWS with the mentioned configurations, the DevSecOps approach should cover infrastructure security, application security, and continuous monitoring and response. Here's a simplified InSpec profile covering some key rules for such a setup:

1. **AWS Security**:
- Ensure instances are running in a VPC.
- Ensure security groups are properly configured (restrictive inbound rules, no 0.0.0.0/0 unless necessary).
- Ensure AWS logging (CloudTrail) is enabled.
- Ensure access to the AWS Management Console requires multi-factor authentication.

2. **Web Application Firewall (WAF)**:
- Ensure AWS WAF is enabled and properly configured.
- Ensure common rule sets (like AWS Managed Rules) are active to protect against OWASP Top 10 vulnerabilities.

3. **Rails Application**:
- Ensure Rails is running in `production` mode.
- Ensure `config.force_ssl` is set to `true` to enforce HTTPS.
- Ensure no debug routes (`/rails/info/properties`) are accessible in production.
- Ensure secret key base is set and secure.

4. **PostgreSQL**:
- Ensure connections to PostgreSQL are encrypted.
- Ensure PostgreSQL is not publicly accessible.
- Ensure strong password policies are in place for the database.

5. **Scalability & DDoS Mitigation**:
- Set up CloudWatch Alarms to monitor traffic and get alerts for unusual spikes.
- Ensure AWS Shield (for DDoS protection) is enabled, especially if it's a high-profile application.

Here's a simple InSpec control example for a few of these rules (this is a basic representation, and a full profile would require more extensive checks):

```ruby
# controls/aws_security.rb

# Check if instances are in a VPC
control 'aws-01' do
  impact 1.0
  title 'Ensure instances are in a VPC'
  aws_ec2_instances.instance_ids.each do |instance_id|
    describe aws_ec2_instance(instance_id) do
      it { should be_in_vpc }
    end
  end
end

# controls/rails_application.rb

# Check Rails is in production mode
control 'rails-01' do
  impact 1.0
  title 'Ensure Rails is running in production mode'
  # Replace with the path to your rails environment configuration file
  describe file('/path/to/your/app/config/environment.rb') do
    its('content') { should match /Rails\.env\.production?/ }
  end
end

# Ensure SSL is enforced in Rails configuration
control 'rails-02' do
  impact 1.0
  title 'Ensure SSL is enforced'
  # Replace with the path to your rails production configuration file
  describe file('/path/to/your/app/config/environments/production.rb') do
    its('content') { should match /config\.force_ssl = true/ }
  end
end
```

This is just the tip of the iceberg. A comprehensive DevSecOps setup would involve integrating security into your CI/CD pipeline, automating threat detection and response, regular vulnerability scanning, and more. Always consult a DevSecOps expert or specialist for a complete and tailored approach.

Continue sharing yml rules

For an AWS infrastructure running a Rails application, you might want to utilize AWS-specific tools like AWS Config for rule definitions, but as a simple continuation, let's delve into some sample YAML-based rules you might use in a tool like CloudCustodian or as pseudocode for AWS Config.

Below are some hypothetical YAML-based rules:

1. **Ensure instances are using encrypted volumes**:
```yaml
---
name: encrypted-volumes-only
resource: ec2
description: |
  Ensure all EC2 instances are using encrypted EBS volumes
filters:
  - type: ebs
    key: Encrypted
    value: false
actions:
  - type: terminate
```

2. **Ensure RDS databases (PostgreSQL) are encrypted**:
```yaml
---
name: encrypted-rds-databases
resource: rds
description: |
  Ensure all RDS databases are encrypted at rest
filters:
  - type: value
    key: StorageEncrypted
    value: false
actions:
  - type: stop
```

3. **Ensure Security Groups do not have open SSH**:
```yaml
---
name: no-open-ssh
resource: security-group
description: |
  Ensure security groups do not allow open SSH (0.0.0.0/0).
filters:
  - type: ingress
    IpProtocol: tcp
    FromPort: 22
    Cidr: '0.0.0.0/0'
actions:
  - type: delete
```

4. **Ensure CloudTrail is enabled**:
```yaml
---
name: ensure-cloudtrail-enabled
resource: account
description: |
  Ensure AWS CloudTrail is enabled for auditing.
filters:
  - type: check-cloudtrail
    value: true
actions:
  - type: notify
    to:
      - email@example.com
    template: default
    priority_header: '1'
```

5. **Auto-scaling limits for DDoS mitigation**:
```yaml
---
name: ensure-asg-limits
resource: asg
description: |
  Ensure auto-scaling groups have set max sizes to avoid resource exhaustion.
filters:
  - type: value
    key: MaxSize
    value: 10
    op: gt
actions:
  - type: modify
    key: MaxSize
    value: 10
```

Remember, these are basic pseudocode examples and might not be directly usable in any specific tool without adaptation. The exact structure, key names, and values will depend on the tool or service you're using to implement the rules. Always test your rules in a safe, non-production environment before deploying them.

Sorry, forgot inspect is a dsl, I meant inspect files instead of yml 

No worries! Let's move back to InSpec, which uses a domain-specific language (DSL) for writing controls. I'll provide some examples based on our prior discussions, focusing on an AWS infrastructure.

1. **Ensure instances are using encrypted volumes**:
```ruby
control 'encrypted-volumes' do
  impact 1.0
  title 'Ensure all EC2 instances use encrypted EBS volumes'
  aws_ec2_instances.instance_ids.each do |instance_id|
    describe aws_ec2_instance(instance_id) do
      its('ebs_encrypted?') { should eq true }
    end
  end
end
```

2. **Ensure RDS (PostgreSQL) instances are encrypted**:
```ruby
control 'rds-encryption' do
  impact 1.0
  title 'Ensure all RDS instances are encrypted'
  aws_rds_cluster('my-database-cluster').cluster_members.each do |db|
    describe aws_rds_instance(db.db_instance_identifier) do
      its('storage_encrypted') { should eq true }
    end
  end
end
```

3. **Ensure Security Groups do not have open SSH**:
```ruby
control 'sg-open-ssh' do
  impact 1.0
  title 'No security groups should allow open SSH'
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 22) }
    end
  end
end
```

4. **Ensure CloudTrail is enabled**:
```ruby
control 'cloudtrail-enabled' do
  impact 1.0
  title 'AWS CloudTrail should be enabled'
  describe aws_cloudtrail_trail('MyTrail') do
    it { should exist }
    its('s3_bucket_name') { should eq 'my-trail-bucket' }
    its('is_logging') { should eq true }
  end
end
```

5. **Check Auto-scaling group limits**:
```ruby
control 'asg-limits' do
  impact 1.0
  title 'Auto-scaling groups should have reasonable limits'
  aws_auto_scaling_groups.group_names.each do |group_name|
    describe aws_auto_scaling_group(group_name) do
      its('max_size') { should cmp <= 10 }
    end
  end
end
```

Remember, you'll need to have the necessary InSpec AWS resources to run these controls. Ensure that you have the `inspec-aws` resource pack available and properly configured.

Before deploying any of these controls, make sure to thoroughly test in a staging or development environment to ensure that they work as expected and don't have unintended consequences.

Continue 

Certainly! Let's expand on our previous controls with some more DevSecOps-related InSpec controls for AWS and a Rails application.

6. **Ensure CloudWatch Alarms are set for suspicious activities**:
```ruby
control 'cloudwatch-alarms' do
  impact 1.0
  title 'Ensure necessary CloudWatch Alarms are set'
  describe aws_cloudwatch_alarm('UnusualInstanceTraffic') do
    its('comparison_operator') { should eq 'GreaterThanOrEqualToThreshold' }
    its('evaluation_periods') { should eq '2' }
    its('metric_name') { should eq 'NetworkPacketsOut' }
    its('namespace') { should eq 'AWS/EC2' }
    its('period') { should eq '300' }
    its('statistic') { should eq 'SampleCount' }
    its('threshold') { should cmp > 10000 }
    its('actions_enabled') { should eq true }
  end
end
```

7. **Ensure WAF is enabled for the Application Load Balancer**:
```ruby
control 'waf-enabled' do
  impact 1.0
  title 'Ensure AWS WAF is enabled for the ALB'
  describe aws_waf_web_acl('web-acl-id') do
    it { should exist }
    its('rules') { should include('rule-id') }
    its('default_action') { should eq 'ALLOW' }
  end
end
```

8. **Ensure all S3 buckets have logging enabled**:
```ruby
control 's3-logging' do
  impact 1.0
  title 'All S3 buckets should have logging enabled'
  aws_s3_buckets.bucket_names.each do |bucket|
    describe aws_s3_bucket(bucket) do
      it { should have_logging_enabled }
    end
  end
end
```

9. **Check Rails secrets are not stored in code**:
```ruby
control 'rails-secrets' do
  impact 1.0
  title 'Ensure Rails secrets are stored securely and not in the codebase'
  describe file('/path/to/your/app/config/secrets.yml') do
    its('content') { should_not match /YOUR_SECRET_KEY_BASE/ }
  end
end
```

10. **Check PostgreSQL requires SSL**:
```ruby
control 'postgres-ssl' do
  impact 1.0
  title 'Ensure PostgreSQL requires SSL for connections'
  # This is a basic way to check the pg_hba.conf file. In a real-world scenario, you'd connect to the DB and check settings.
  describe file('/path/to/postgresql/pg_hba.conf') do
    its('content') { should match /hostssl all all 0.0.0.0\/0 md5/ }
    its('content') { should_not match /host all all 0.0.0.0\/0 md5/ }
  end
end
```

It's crucial to note that the above controls are representative and will need modifications based on specific needs and environments. Always consult documentation or experts when creating security controls and, as always, test in a non-production environment before deployment.