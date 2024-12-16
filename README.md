# Tutorial: Debugging with Codezero

This project sets up a minimal HTTP server using Ruby. It listens for incoming requests, logs the user ID from the request headers, and forwards the requests to a specified service.

The best way to start the tutorial is by visiting <https://tutorial.codezero.dev>.

## Getting Started

### Prerequisites

- Ruby installed on your machine.

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/c6o/tutorial-ruby
   ```

2. Navigate to the project directory:

   ```sh
   cd tutorial-ruby
   ```

3. Install dependencies:

   ```sh
   bundle
   ```

### Running the Application

To start the server, run:

```sh
bin/rackup
```

The server will listen on port 9292.

### Debugging with Codezero

1. Run `czctl compose start` to serve your local variant of service B and consume all services in the tutorial namespace. This command uses the [codezero-compose.yaml](./codezero-compose.yaml) to set up your Codezero environment.
1. Set a breakpoint in line 8 in [service.rb](./service.rb#L8).
1. Launch the debugger.
1. The next request will be stopped by the debugger, allowing you to inspect local variables or step through the code.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
