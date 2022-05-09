#! /bin/bash
mkdir $1
cd $1
# Let's initiate the npm
npm init -y
# first ensure we are connected the
# install required dependencies
read -p "Are you connected to the internet?y/n: " conn
if [ "$conn" = "y" -o -z $conn ]
    then
        echo "Installing express, mongoose, eslint(airbnb)"
        npm install express mongoose eslint
        # use express generator
        read -p "Should I bundle an express app with router?y/n: " expressQ
        if [ "$expressQ" = "y" ]
            then
                npx express-generator --no-view
            else
                break 1
        fi
        echo "Express and mongoose installed"
    else
        break 1
fi
# Let's initiate git for the project
echo "Initializing git repo"
git init

# open up code editor
code .