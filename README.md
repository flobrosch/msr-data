# Dataset of Developer-Labeled Commit Messages
## Getting Started
### SQLite
Make sure you have sqlite on your system first

    cd msr-data
    sqlite3 out.db

### MySQL
This should work for Postgres too with minor modifications.

    cd msr-data
    mysql -u user -p password < schema.sql

Edit bootstap.sh for your mysql username and password

    ./bootstrap.sh

You're done. Enjoy
