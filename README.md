## Usage

1. Setup

    ```sh
    npm install
    ```

2. Build docker image

    ```sh
    docker build -t headless-chrome .
    ```

3. Start container

    ```sh
    docker run headless-chrome
    ```

4. Update the host option in `index.js`

5. Run script to connect to remote debugging protocol

    ```sh
    node index.js
    ```
