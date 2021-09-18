<h1 align="center">[Rails] Messaging Board </h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT " src="https://img.shields.io/badge/License-MIT -yellow.svg" />
  </a>
  <a href="https://twitter.com/ae_cordova" target="_blank">
    <img alt="Twitter: ae_cordova " src="https://img.shields.io/twitter/follow/ae_cordova .svg?style=social" />
  </a>
</p>

___
## Description of the project

It's a Barebones Messaging Board (User - Posts - Comments) with basic authentication using Devise.

### ⭐️ Built with
* Ruby on Rails 6
* HTML5/CSS3/Sass
* Bootstrap 5
* Postgres
* RSpec

### Dev Environment Requirements:
* Ruby needs to be installed to run the code, check [here](https://www.ruby-lang.org/en/documentation/installation/) for further steps

### ⭐️ Running the code
#### Instructions for running on local environment:

1. Clone the repo

2. Navigate to the root directory

3. Run bundle install to ensure all the needed gems are installed:
    ```
    $ bundle install
    ```
3. Run Yarn Install
    ```
    $ yarn install
    ```
3. Setup the DB
    ```
    $ rails db:setup
    ```
3. Run Rails Server
    ```
    $ rails server
    ```
3. Open localhost:3000 on a browser to get to the home page
    ```
    https://localhost:3000
    ```
### ⭐️ How it works

1. Go to the Home Page and click on the  Sign Up button

2. Fill up your information, username, email, password and confirmation are required.

3. The app will automatically sing you in. (If you already have signed up previously, Click on the Login link on the nav bar, and fill up your email and password.)

4. Once you're logged in the rest of the options appear, 

   * To create a Message, from the All Messages page, hit New MEssage and fill up its contents.

   * To comment on a Messsage, click on the Reply button below the post, fill up the comment field and press the button. 
   
   * To go to the comments page, hit  the See comments button under each post. 
   
   * Newest messages will appear first

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Authors

👤 **Angel Cordova** 
* Github: [@aecordova](https://github.com/https:\/\/github.com\/aecordova)  
