<img src="http://g.recordit.co/vQCagOBgFn.gif">

# ReBook

A book rental subscription service that will allow you to access from the most popular to the most obscure printed books for as low as $10 a month.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

```
Ruby 2.3.1
```

### Installing

1. Clone the app and change into the `rebook` directory:

```
$ git clone https://github.com/mimilettd/rebook.git
$ cd rebook
```

2. Install the dependencies:

```
bundle install
```

3. Run the following commands in your terminal to prepare and start the server:

```
$ rake db:create db:migrate db:seed
$ rails s
```

To view the application, visit `http://localhost:3000`.

### Built With

  * Ruby (back-end language)
  * Rails (web application framework)
  * PostreSQL (database)
  * HTML, CSS, JQuery (front-end language)
  
### Authors

  * Mimi Le
