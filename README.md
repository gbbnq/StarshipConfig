# Starship Configuration Template

This repository provides a template for configuring the Starship prompt. 

## Installation

To install Starship, follow these steps:

1. **Install via Shell Script:**

    ```sh
    curl -sS https://starship.rs/install.sh | sh
    ```

2. **Add to your shell configuration:**

    For **bash**:
    ```sh
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    ```

3. **Restart your shell:**

    ```sh
    exec $SHELL
    ```

Starship should now be installed and configured for your shell.

4. **Copy the configuration file:**

    ```sh
    mkdir -p ~/.config && cp starship.toml ~/.config/starship.toml
    ```


5. **Copy the check_ip.sh script:**

    ```sh
    cp check_ip.sh ~/.config/check_ip.sh
    ```

6. **Make the check_ip.sh script executable:**

    ```sh
    chmod +x ~/.config/check_ip.sh
    ```