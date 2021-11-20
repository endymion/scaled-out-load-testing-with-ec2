# Load testing

This is a simple way to use lots of EC2 instances at once for load testing.  It doesn't do any kind of fancy aggregation of test results.  It just gives you a way to run scripts or tests on one or all instances in a list.

# Setup

## Set up a bunch of EC2 instances with the same key

Spin up a lot of EC2 instances with Amazon Linux 2.  I used 20 `t3a.large` instances.

TODO: This should be CDK code.  I did it manually.

Get the "Public IPv4 DNS" for each instance and add it to a text file called `instances.txt` in this projec folder.  One host name per line.

Add the key for the instances to `key.pem` in this project folder.

Run `./run-script-on-all.sh setup.sh`

That script will install NPM, Node, and Artillery Core on each of the instances.

# Usage

## Run a command on all instances

    ./run-on-all.sh ls

This will connect to all of the instances and run the command, consecutively:

    $ ./run-on-all.sh pwd
    ./run-on-all.sh pwd
    ] running: pwd
    ]      on: ec2-3-239-116-74.compute-1.amazonaws.com
    /home/ec2-user

    ] running: pwd
    ]      on: ec2-3-83-187-30.compute-1.amazonaws.com
    /home/ec2-user

    ] running: pwd
    ]      on: ec2-34-226-234-65.compute-1.amazonaws.com
    /home/ec2-user

    ] running: pwd
    ]      on: ec2-3-231-219-233.compute-1.amazonaws.com
    /home/ec2-user

    ] running: pwd
    ]      on: ec2-3-236-140-49.compute-1.amazonaws.com
    /home/ec2-user

## Run a script on all instances

    ./run-script-on-all.sh setup.sh

For each instance in the list, this will take each line from the script and run it remotely on the instance.  (This is not quite the same thing as running the script remotely.)

## Run an Artillery test script on all instances

    ./run-artillery-on-all.sh example-artillery-script.yml

This will run the Artillery script from all of the instances at once, concurrently.

You need to `./run-script-on-all.sh setup.sh` to install NPM, Node and Artillery first.
