# README

## Getting Started

- Start but cloning this repo on your local machine

`git clone https://github.com/joniguerrero/2VD-Project.git`

- Make sure docker is running in the background and pull the latest version of the container we worked with in lab

`docker pull dmartinez05/ruby_rails_postgresql:latest`

- Navigate to the directory you just cloned na donce there run the following commands for windows and mac

  - for Windows

    `docker run --rm -it --volume "${PWD}:/webapp_2vd" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000`

  - for Mac

    `docker run --rm -it --volume "$(pwd):/webapp_2vd" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000`

- Now run the following commands

  `bundle install`

  `rails webpacker:install`

  `rails db:create`

  `rails db:migrate`

- All there is to do is to run the app. To do this run the following command

  `rails server --binding=0.0.0.0`

After Navigating to localhost:3000 on your browser you should see the 'Yay! Youre on rails page'

## Useful Rails Commands

`rails scaffold`

`Keep on adding to this`
