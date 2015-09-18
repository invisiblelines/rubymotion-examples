# RubyMotion Examples

Three simple RubyMotion example apps.


### Hello World

Standard Hello World application using standard Cocoa methods.


### Camera

App to select and display an image.


### Promotion

Example of using Promotion and Bubblewrap to display results from a JSON API in a tableview.

*NOTE - This app requires a Meetup API token. Update the constant define in app_delegate.rb*


## Prerequisites

You must have Xcode and RubyMotion installed.

## Usage

Change to the root directory of the app you would like to try.

Install the required gems

    bundle install

Install any cocoapods required by these gems (only required by promotion example)

    rake pod:install

Run the app in the simulator

    rake

